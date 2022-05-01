--Create the two global tables which will be used to create the replications and their technologies later on

repl_table = {}
--[[
Repltech (table):
	items (array of the following table):
		name
		cost (either a number or an array where each entry is either a number or the following table):
			target
			type (item, var, recipe or recipe-noproduct)
			multiplier (nil is considered to be 1)
		overrides:
			internal_name
			localized name
			icon
	category
	prerequisites (array of the following table):
		target
		type (item, tech, recipe, recipe-items-only or recipe-tech-only)
	overrides:
		tier
		research_multiplier
		upgrade (Is this technology an upgrade? (defaults to false))
		internal_name
		localized name
		icon
--]]

repl_variables = {}
--[[
Replication variables (table):
	name
	cost (number or array of both numbers and the following table):
		target
		type (item, var, recipe or recipe-noproduct)
		multiplier (nil is considered to be 1)
--]]


--The function for making replication variables
	--If a replication variable's is used in a recipe then those prerequisites also come along with it
function replvar(name, cost, prerequisites) repl_variables[name] = {name = name, cost = replsub_cost(cost or name), prerequisites = prerequisites} end


--Functions for making subtables
--Cost subsubtable
function replsub_cost(cost)
	--Parse the cost, which will either be nil, a number, a single replication cost or a table of replication costs.
	if cost == nil then --Nil
		return 0
	elseif type(cost) == "number" then --A number
		return cost
	elseif type(cost) == "string" then --A recipe
		return {{type = "recipe", target = cost}}
	elseif cost.type then --A single replication cost
		return {cost}
	end --A table of replication costs
	return cost
end
--Item subtable
function replsub_item(item, cost, item_overrides)
	--Create and return the subtable
	return {
		name = item,
		cost = replsub_cost(cost),
		overrides = item_overrides or {}
	}
end
function replsub_recipe(recipe_name, item_overrides)
	--Load the recipe
	local recipe = data.raw.recipe[recipe_name] --or data.raw.recipe[gprefix..recipe_name]
	--If the recipe exists, find its (first) item and make a subtable for it
	if recipe then
		--Find the recipe's item
		local item = get_recipe_result_part(recipe, "result", "name")
		--Create and return the subtable
		return {
			name = item,
			cost = {{type = "recipe", target = recipe_name}},
			overrides = item_overrides or {}
		}
	else
		--Log that the recipe does not exist
		log("A function just tried to make a replication based on a recipe named \""..recipe_name.."\", but no recipe with that name exists.")
	end
end
--Prerequisites subtable
function replsub_prereq(prerequisites)
	--Parse the prerequisites, which will either be nil, a string, a single prerequisite or a table of prerequisites
	if prerequisites == nil then --Nil
		return {}
	elseif type(prerequisites) == "string" then --A string
		--It's assumed that if a prerequisite is a single string then it's meant to be a whole host of prerequisites based on a recipe.
		return {{target = prerequisites, type = "recipe"}}
	elseif prerequisites[1] and type(prerequisites[1]) == "string" then --An array of strings
		--Multiple recipes, presumably for multiple items
		local output = {}
		for _,prerequisite in ipairs(prerequisites) do
			output[#output + 1] = {target = prerequisite, type = "recipe"}
		end
		return output
	elseif prerequisites.target then --A single prerequisite
		return {prerequisites}
	end
	return prerequisites
end


--Functions for adding entries to the replication table
function repltech_item(item, category, cost, prerequisites, overrides, item_overrides)
	overrides = overrides or {}
	local name = overrides.internal_name or item
	repl_table[name] = {
		name = name,
		category = repltypes[category],
		items = {replsub_item(item, cost, item_overrides)},
		prerequisites = replsub_prereq(prerequisites),
		overrides = overrides
	}
end
function repltech_item_table(item_table, category, prerequisites, overrides)
	overrides = overrides or {}
	local name = overrides.internal_name or item_table[1].overrides.internal_name or item_table[1].name
	repl_table[name] = {
		name = name,
		category = repltypes[category],
		items = item_table,
		prerequisites = replsub_prereq(prerequisites),
		overrides = overrides
	}
end
function repltech_recipe(recipe_name, category, overrides, item_overrides)
	overrides = overrides or {}
	local item = replsub_recipe(recipe_name, item_overrides)
	if item then
		local name = overrides.internal_name or item.overrides.internal_name or item.name
		repl_table[name] = {
			name = name,
			category = repltypes[category],
			items = {item},
			prerequisites = {{type = "recipe", target = recipe_name}},
			overrides = overrides
		}
	end
end

--More specialized replication functions
function repltech_raw(item, multiplier, overrides, item_overrides, prerequisites)
	repltech_item(item, "ore", {{target = "ore", type = "var", multiplier = multiplier or 1}}, prerequisites, overrides, item_overrides)
end
function repltech_ore(item, mining_time, base_density, overrides, item_overrides, prerequisites)
	repltech_item(item, "ore", {{target = "ore", type = "var", multiplier = ((mining_time or 1)/(base_density or 1)*8)}}, prerequisites, overrides, item_overrides)
end
function repltech_element(atomic_number, name, item_table, ore_name, prerequisites, icon_path)

	name = string.format("%03d-%s", atomic_number, name)
	icon_path = image_path or "__dark-matter-replicators-18__/graphics/icons/periodic/"..name..".jpg"
	name = gprefix..name
	prerequisites = replsub_prereq(prerequisites)
	if ore_name then
		prerequisites[#prerequisites + 1] = {target = ore_name, type = "item"}
	end
	repltech_item_table(item_table, "element", prerequisites, {internal_name = name, localized_name = {"technology-name."..gprefix.."repl-"..name}, icon = icon_path})
end


--Trying to add a replication while one already exists will overwrite the old replication.

--Functions for modifying existing replications
--Change a recipe's category
function replmod_category(repltech, category)
	repl_table[repltech].category = repltypes[category]
end
--Add an item to a replication while not changing anything else (not even prerequisites)
function repladd_item(repltech, item, cost, item_overrides)
	--Check to see if the modified repltech exists
	local tech = repl_table[repltech] or repl_table[gprefix..repltech]
	if tech then
		tech.items[#tech.items + 1] = replsub_item(item, cost, item_overrides)
	else
		log("An attempt was made to modify the repltech \""..repltech.."\", but that repltech does not yet exist.  The attempted modification was the addition of the item \""..item.."\".")
	end
end
--Add the first product of a recipe to a replication while not changing anything else (not even prerequisites)
function repladd_recipe(repltech, recipe_name, item_overrides)
	--Check to see if the modified repltech exists
	local tech = repl_table[repltech] or repl_table[gprefix..repltech]
	if tech then
		tech.items[#tech.items + 1] = replsub_recipe(recipe_name, item_overrides)
	else
		log("An attempt was made to modify the repltech \""..repltech.."\", but that repltech does not yet exist.  The attempted modification was the addition of the recipe \""..recipe_name.."\".")
	end
end