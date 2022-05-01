--Function which removes repeated and self-referential prerequisites
local function remove_repeats(name, prerequisite_strings)
	for i=#prerequisite_strings, 1, -1 do
		--If this tech has itself as a prerequisite, remove that prerequisite
		if prerequisite_strings[i] == gprefix.."repl-"..name then
			table.remove(prerequisite_strings, i)
		else
			for j=#prerequisite_strings, i+1, -1 do
				--If this prerequisite is listed multiple times, remove this instance of the prerequisite
				if prerequisite_strings[i] == prerequisite_strings[j] then
					table.remove(prerequisite_strings, j)
				end
			end
		end
	end
end


--Create a hash(?) table of pointers to all items which can be replicated
local all_items = {}
for _,current_replication in pairs(repl_table) do
	for _,current_item in ipairs(current_replication.items) do
		--Also have each replicatable item contain a pointer to its repltech
		current_item.parent = current_replication
		
		--Find and save a pointer to the item as well as whether this item is a fluid or not
		current_item.pointer = data.raw["fluid"][current_item.name]
		current_item.fluid = true
		if not current_item.pointer then
			current_item.pointer = data.raw["item"][current_item.name]
									or data.raw["tool"][current_item.name]
									or data.raw["repair-tool"][current_item.name]
									or data.raw["mining-tool"][current_item.name]
									or data.raw["ammo"][current_item.name]
									or data.raw["armor"][current_item.name]
									or data.raw["capsule"][current_item.name]
									or data.raw["gun"][current_item.name]
									or data.raw["blueprint"][current_item.name]
									or data.raw["deconstruction-item"][current_item.name]
									or data.raw["module"][current_item.name]
									or data.raw["module"][current_item.name]
									or data.raw["rail-planner"][current_item.name] 
			current_item.fluid = false
		end
		if current_item.pointer then
			--Add a pointer to this item to item table, hashed to the item's name
			all_items[current_item.name] = current_item
		end
		--[[
		--This part is commented out because there's another error message for missing items later on.
		--If an item still doesn't have a pointer then it does not exist.  Log this as an error.
		else
			log("The replication of \""..current_item.name.."\" (in the repltech \""..current_replication.name.."\") is for an item which does not exist.  It will be considered to have a replication cost of 0, it will be ignored as a prerequisite and (obviously) it will not be replicatable.")
		end
		--]]
	end
end

--Go through every replication prerequisite and make those values into a list
for _,current_replication in pairs(repl_table) do
	--Create a pointer to the current replication's prerequisites list
	local prerequisite_table = current_replication.prerequisites

	--log(serpent.block(current_replication))
	--Find and save the replication's tier
	if current_replication.overrides then
		current_replication.tier = current_replication.overrides.tier or current_replication.category.tier
	else
		current_replication.tier = current_replication.category.tier
	end
	--Add the replication technology for the current tier as a prerequisite
	if not current_replication.tier then
		log("\""..gprefix.."repl-"..current_replication.name.."\" does not have a tier.  Its tier will default to 1.  Please change this.")
		current_replication.tier = 1
	end
	local prerequisite_strings = {gprefix.."replication-"..current_replication.tier}
	
	--Convert each reference from a subtable to a string
	for i,current_prerequisite in ipairs(prerequisite_table) do
		if not current_prerequisite.target then
			log("\""..gprefix.."repl-"..current_replication.name.."\" has a prerequisite with no target.  Factorio will now crash for your convenience.")
		end

		if current_prerequisite.type == "recipe" or current_prerequisite.type == "recipe-items-only" or current_prerequisite.type == "recipe-tech-only" then
			--Get a pointer to the referenced recipe
			local recipe = data.raw.recipe[current_prerequisite.target]
			if recipe then
				if current_prerequisite.type == "recipe" or current_prerequisite.type == "recipe-items-only" then
					--Get the list of recipe ingredients
					local ingredients = recipe.ingredients or recipe.normal.ingredients or {}
					--Append an item requirement for each item used in the recipe which also has an item replication
					for _,ingredient in ipairs(ingredients) do
						--Get the name of the ingredient
						local ingredient_name = ingredient.name or ingredient[1]
						--Check to see if there the ingredient can be replicated
						if all_items[ingredient_name] then
							--Append the replication of that item as a prerequisite
							prerequisite_table[#prerequisite_table + 1] = {target = ingredient_name, type = "item"}
						end
					end
				end
				if current_prerequisite.type == "recipe" or current_prerequisite.type == "recipe-tech-only" then
					--If the recipe is not enabled at the start, append a technology requirement for the first found technology which unlocks this recipe
					if recipe.enabled == false or (recipe.normal and recipe.normal.enabled == false) then
						local found_it = false
						for tech_name,technology in pairs(data.raw.technology) do
							--Look through every technology and check their effects until the technology which unlocks this recipe is found
							if (technology.enabled ~= false) and technology.effects then
								for _,effect in ipairs(technology.effects) do
									if effect.type == "unlock-recipe" and effect.recipe == current_prerequisite.target then
										prerequisite_table[#prerequisite_table + 1] = {target = tech_name, type = "tech"}
										found_it = true
									end
								end
							end
							if found_it then break end
						end
						if not found_it then log("The recipe \""..current_prerequisite.target.."\" is not enabled by default but is also not unlocked by any technologies.  It only requires its existing ingredients to replicate.") end
					else
					end
				end
			else
				--Log that the recipe in question does not exist
				log("The prerequisites for \""..gprefix.."repl-"..current_replication.name.."\" are generated from a recipe named \""..current_prerequisite.target.."\", but that recipe does not exist.  The prerequisite was dropped.")
			end
			
		elseif current_prerequisite.type == "item" then
			--Find the last replication (it should really be the only one, but if there are multiples the last one is used) which has the selected item as an item and add its name to the prerequisite list
			local item = all_items[current_prerequisite.target]
			--If an item could be found, add its repltech to the prerequisites list
			if item then
				prerequisite_strings[#prerequisite_strings + 1] = gprefix.."repl-"..item.parent.name
			else
				--If an item cannot be found, drop the prerequisite and leave a note in Factorio's log file
				log("\""..gprefix.."repl-"..current_replication.name.."\" requires the replication of \""..current_prerequisite.target.."\" as a prerequisite, but \""..current_prerequisite.target.."\" cannot be replicated.  The prerequisite was dropped.")
			end
			
		elseif current_prerequisite.type == "tech" then
			--Check to see if the technology in question exists
			if data.raw.technology[current_prerequisite.target] then
				--Add a technology to the replication list
				prerequisite_strings[#prerequisite_strings + 1] = current_prerequisite.target
			else
				--Unless the technology in question doesn't exist.
				log("\""..gprefix.."repl-"..current_replication.name.."\" requires \""..current_prerequisite.target.."\" as a prerequisite, but \""..current_prerequisite.target.."\" is not a real technology.  The prerequisite was dropped.")
			end
		else
			--Log the mistake
			if current_prerequisite.type then
				log("\""..gprefix.."repl-"..current_replication.name.."\" has a \""..current_prerequisite.type.."\" prerequisite named \""..current_prerequisite.target.."\".  There is no such thing as a \""..current_prerequisite.type.."\" prerequisite.  It's probably just a typo but the DMR mod can't figure things out on its own.")
			else
				log("\""..gprefix.."repl-"..current_replication.name.."\" has a prerequisite named \""..current_prerequisite.target.."\" which does not have a type.")
			end
		end
	end
	
	--Go through the prerequisite list and remove any self-referential or duplicate prerequisites
	remove_repeats(current_replication.name, prerequisite_strings)
	
	--Save the prerequisites of the replication in place of the table
	current_replication.prerequisites = prerequisite_strings
end


--If any replication types are disabled, replace instances where a disabled repltech is a prerequisites with the disabled repltech’s prerequisites
--Check to see if any replication types are disabled
local disabled_type = false
for _,repltype in pairs(repltypes) do
	--log("\nrepltype:\n"..serpent.block(repltype))
	if not repltype.enabled then
		disabled_type = true
		break
	end
end
if (disabled_type) then
	--Go over every prerequisite of every repltech
	for _,current_replication in pairs(repl_table) do
		local added_prerequisites = false
		--Get a pointer to the current replication's prerequisites
		local prerequisite_strings = current_replication.prerequisites
		--Go over every prerequisite
		--This has to be a while loop becuase in LUA the control variable (i) in a for loop is local for each iteration of the loop
		local i = 1
		while i <= #prerequisite_strings do
			--Check to see if each prerequisite is for a disabled repltech
			--First, see if this prerequisite begins with "repl-"
			if string.sub(prerequisite_strings[i], 0, string.len(gprefix)+5) == gprefix.."repl-" then
				--If it does, check to see if the repltech with the indicated name is disabled
				local prereq_tech = repl_table[string.sub(prerequisite_strings[i], string.len(gprefix)+6)]
				if not prereq_tech.category.enabled then
					--If this prerequisite is a disabled repltech, remove it and append all of its prerequisites onto the end of prerequisite_strings
					--Remove the current value
					table.remove(prerequisite_strings, i)
					--Decrement i to compensate for the removed value
					i = i-1
					--Append the removed tech's prerequisites
					for _,prereq_of_prereq in ipairs(prereq_tech.prerequisites) do
						prerequisite_strings[#prerequisite_strings+1] = prereq_of_prereq
					end
					--Note that this repltech had new prerequisites added to it
					added_prerequisites = true
				end
			end
			i = i+1
		end
		--Every repltech which is given new prerequisites and has its repeated and self-referential perquisites removed again
		if added_prerequisites then
			remove_repeats(current_replication.name, prerequisite_strings)
		end
	end
end


--Go through every replication technology and remove any redundant prequisites
for repl_name,current_replication in pairs(repl_table) do
	--Only bother pruning the prerequisites of replications from enabled categories.
	--log("\ncurrent_replication:\n"..repl_name.."\n"..serpent.block(current_replication))
	if current_replication.category.enabled then
		local tech_name = gprefix.."repl-"..repl_name
		--Create a pointer to the current replication's prerequisites list
		local prerequisite_strings = current_replication.prerequisites
		--Create a copy of the prerequisite list
		local copy_list = {}
		for i,current_prerequisite in ipairs(prerequisite_strings) do
			copy_list[i] = current_prerequisite
		end
		--Iterate through the copy list and use it to prune the actual prerequisite list
		for _,tech in ipairs(copy_list) do
			local prereq_of_prereq
			--Check to see if this prerequisite is a repltech
			--Then, create a pointer to the prerequsites of the current tech
			if string.sub(tech, 0, string.len(gprefix)+5) == gprefix.."repl-" then
				--log(string.sub(tech, 6))
				--error("stop")
				prereq_of_prereq = repl_table[string.sub(tech, string.len(gprefix)+6)].prerequisites
			else
				--Find the current prerequisite technology
				local prereq_tech = data.raw.technology[tech]
				--Check to see if that technology exists
				if prereq_tech then
					--Copy its prerequisites if it does exist
					prereq_of_prereq = prereq_tech.prerequisites
				end
			end
			--Check to see if there are any prerequisites
			if prereq_of_prereq ~= nil then
				--Iterate through these prerequisites
				for _,prereq in ipairs(prereq_of_prereq) do
					--Check to see if this technology is in the real list and remove it from the real list if it is
					for i,current_prerequisite in ipairs(prerequisite_strings) do
						if prereq == current_prerequisite then
							table.remove(prerequisite_strings, i)
							break
						end
					end
					--Check to see if this technology is in the copy list
					local duplicate_found = false
					for _,current_prerequisite in ipairs(copy_list) do
						if prereq == current_prerequisite then
							duplicate_found = true
							break
						end
					end
					--Add this technology to the end of the copy list if it is not in there already
					if not duplicate_found then
						copy_list[#copy_list+1] = prereq
					end
				end
			end
		end
	end
end
