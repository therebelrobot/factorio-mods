--Go through every replicatable item and replication variable and hash(?) them to a pair of tables depending on whether their numerical costs are known or unkown
local known_costs = {}
local unknown_cost_items = {}
for name,current_replication in pairs(repl_table) do
	for i,current_item in ipairs(current_replication.items) do
		if not current_item.name then
			log("The repltech \""..name.."\" has an item entry without an item.  Factorio will now crash for your debugging convenience.")
		end
		if type(current_item.cost) == "number" then
			known_costs["item-"..current_item.name] = current_item.cost
		else
			unknown_cost_items["item-"..current_item.name] = current_item
		end
	end
end
for name,current_variable in pairs(repl_variables) do
	if type(current_variable.cost) == "number" then
		known_costs["var-"..name] = current_variable.cost
	else
		unknown_cost_items["var-"..name] = current_variable
	end
end

--Repeatedly go through the replication costs until every cost is reduced to a number (or until there's a loop of costs which reference each other)
local changed_entry = true
while changed_entry do
	changed_entry = false
	--Iterate over every unknown cost
	for name,item in pairs(unknown_cost_items) do
		local unknown_cost = false
		local running_total = 0
		--Iterate over every sub-cost within the current cost
		for i,current_part in ipairs(item.cost) do
			
			--If the part is a number, simply add the number
			if type(current_part) == "number" then
				running_total = running_total + current_part
				
			--If the part references an item or a variable, try to find and use its target number
			elseif current_part.type == "item" or current_part.type == "var" then
				local part_name = current_part.type.."-"..current_part.target
				local this_part = known_costs[part_name]
				if this_part == nil and current_part.type == "item" and unknown_cost_items[part_name] == nil then
					--If an item which cannot be replicated is referenced and there is a varible with the same name as the item, use the variable's cost instead
					this_part = known_costs["var-"..current_part.target]
				end
				if this_part then
					--If there is a value, look it up and use it with the multiplier
					local multiplier = current_part.multiplier or 1
					local new_value = this_part * multiplier
					item.cost[i] = new_value
					running_total = running_total + new_value
					--Mark down that a new cost was calculated
					changed_entry = true
				else
					--Do not save this cost
					unknown_cost = true
				end
				
			--If the part references a recipe, split that recipe up into item references
			elseif current_part.type == "recipe" or current_part.type == "recipe-noproduct" then
				local recipe = data.raw.recipe[current_part.target]
				if recipe then
					local multiplier
					if current_part.type == "recipe" then
						--Find the number of products produced by this recipe
						multiplier = get_recipe_result_part(recipe, "result_count", "amount") or 1
						--Divide this recipe's multiplier by the number of products from the recipe
						if current_part.multiplier then
							multiplier = current_part.multiplier / multiplier
						else
							multiplier = 1 / multiplier
						end
					else --"recipe-noproduct" is a special cost type which works like "recipe" except it does not look at the recipe's results
						if current_part.multiplier then
							multiplier = current_part.multiplier
						else
							multiplier = 1
						end
					end
					--Load the ingredients of the recipe
					local ingredients = recipe.ingredients or recipe.normal.ingredients or {}
					for _,ingredient in ipairs(ingredients) do
						--Get the name of the ingredient
						local ingredient_name = ingredient.name or ingredient[1]
						--Check to see if the ingredient can be replicated and add it to the list if it can
						if known_costs["item-"..ingredient_name] or unknown_cost_items["item-"..ingredient_name] or known_costs["var-"..ingredient_name] or unknown_cost_items["var-"..ingredient_name] then
							--Get how many of the item are required by the recipe
							local ingredient_amount = ingredient.amount or ingredient[2]
							--Create a new cost part referencing the item
							item.cost[#item.cost + 1] = {type = "item", target = ingredient_name, multiplier = multiplier * ingredient_amount}
						else
							--If the ingredient can't be replicated, log that this is the case
							log("There is a replication based on the recipe \""..current_part.target.."\" and that recipe uses the item \""..ingredient_name
								.."\" but said item cannot be replicated.  Its replication cost will be treated as being zero for calculation purposes.  If you deliberately want things to be this way, please create a replication variable with the same name as the required item so that this message is not logged at every startup.")
						end
					end
					--If there is a variable with the same name as the recipe's category, create a variable component based on the recipe's energy cost
					--Get the name of the category
					local category = recipe.category or ""
					--Check to see if there is a replication variable with the same name as this category
					if known_costs["var-"..category] or unknown_cost_items["var-"..category] then
						--Get how long this recipe takes to make
						local energy_required = recipe.energy_required
						--Only add a creation cost if the recipe takes some special amount of time
						if energy_required then
							energy_required = energy_required - 0.5
							--Create a new cost part referencing the variable with the same name as the category
							item.cost[#item.cost + 1] = {type = "var", target = category, multiplier = multiplier * energy_required}
						end
					end
				end
				--Convert this recipe reference into a zero
				item.cost[i] = 0
			elseif current_part == nil then
				item.cost[i] = 0
			else
				--Log that this cost part is of a type which does not exist, then destroy the part so that this error does not keep repeating
				if current_part.type then
					log("Item #"..i.." of the replication cost of \""..name.."\" is of type \""..current_part.type.."\", which does not exist.")
				else
					log("Item #"..i.." of the replication cost of \""..name.."\" does not have a type.")
				end
				item.cost[i] = 0
			end
		end
		--If every part of the cost was found overwrite the old cost with a new one and move the cost to a new table
		if not unknown_cost then
			item.cost = running_total
			known_costs[name] = running_total
			unknown_cost_items[name] = nil
		end
	end
end

--Go through the hopefully empty list one last time and treat anything not yet a number as zero
--Also log each of these misspellings or circular references
for name,item in pairs(unknown_cost_items) do
	local running_total = 0
	for i,current_part in ipairs(item.cost) do
		if type(current_part) == "number" then
			running_total = running_total + current_part
		else
			log("The cost of replicating "..name.." will be lower than intended due to a reference to an item which cannot be replicated, a misspelled name, a circual reference or some other problem.  The problem was a reference to "..current_part.target.." ("..current_part.type..").  This unresolvable cost part was treated as being zero.")
		end
	end
	item.cost = running_total
end