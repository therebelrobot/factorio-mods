--Load configuration settings which affect the replications
local reps_multiplier = settings.startup["replresearch-item-multiplier"].value
local research_time = settings.startup["replresearch-item-time"].value
local repl_penalty = settings.startup["replication-penalty"].value
local fluid_quantity = settings.startup["replication-fluid-quantity"].value

--Go through every replication and make the technologies and recipes for them
for _,current_replication in pairs(repl_table) do
	--log(serpent.block(current_replication))
	--Don't even spend time looking at replications from disabled recipes
	if current_replication.category.enabled then
		--Remove all items which do not exist
		local item_table = current_replication.items
		for currentItem=#item_table,1,-1 do
			if item_table[currentItem].pointer == nil then
				log("The item \""..item_table[currentItem].name.."\" was removed from the repltech \""..current_replication.name.."\" becuase the item in question does not exist.")
				table.remove(item_table, currentItem)
			end
		end
		
		--only make the technology if at least one item will be created
		if (#current_replication.items > 0) then
			--Set up temporary storage space for new data
			local repl_data = {}
			
			--Generate recipe data for each item
			local effects = {}
			for _,current_item in ipairs(current_replication.items) do
				--Calculate the item's cost and round it to the nearest single decimal place (minimum 0.1)
				local cost = current_item.cost
				if type(cost) ~= "number" then
					if type(cost) == "table" then
						log("Something went really wrong when it comes to the replication of \""..current_item.name.."\".  Somehow its cost table could not be processed into a number even though there are enough default cases that this should never be possible.  Maybe a replication is there twice or something.  Here's what the table itself looked like after somehow slipping through cost calculations: "..table.tostring(cost))
						cost = 1
					else
						cost = tonumber(cost)
					end
				end
				if current_item.fluid then
					cost = cost * fluid_quantity
				end
				--Add the replication penalty and then round the cost to the nearest 0.1
				cost = math.floor((cost + repl_penalty) * 10 + 0.5) / 10
				--There's also a minimum replication cost so as to prevent division by zero or have something take a negative amount of time
				if cost <= 0 then
					cost = 0.1
				end
				
				--Put whether the item is a fluid or not into string form
				local type
				local amount
				if current_item.fluid then
					type = "fluid"
					amount = fluid_quantity
				else
					type = "item"
					amount = 1
				end
				
				--Make the icon for the item
                -- 2020-03-05 icon sizes are buggy between item and technology
                -- don't scale item/recipe icon, DO scale tech icon
				local icon
				local icon_size
				local per_icon_size
				local per_icon_scale
				local icon_name = string.gsub(gprefix, "(%-)", "%%%1")
				icon_name = string.gsub(current_replication.category.name, icon_name, "")

				if current_item.pointer.icon_size then icon_size = current_item.pointer.icon_size end
				if current_item.pointer.icons then
					--Create a copy of the item's already layered icon
					icon = {}
					for _,current_layer in ipairs(current_item.pointer.icons) do
						if current_item.pointer.icons[#icon + 1].icon_size then per_icon_size = current_item.pointer.icons[#icon + 1].icon_size
						else per_icon_size = icon_size end
						--per_icon_scale = current_item.pointer.icons[#icon + 1].icon_scale
						icon[#icon + 1] = {icon = current_layer.icon, icon_size = per_icon_size, scale = per_icon_scale}
						--icon[#icon + 1] = {icon = current_layer.icon, icon_size = icon_size}

					end
					--Add the replication border as an extra layer
					icon[#icon + 1] = {
						icon = "__dark-matter-replicators-18__/graphics/icons/borders/repl-"..icon_name..".png",
						icon_size = 32,
						--scale = max_size / 32
					}
				elseif current_item.pointer.icon then
					--Create a layered icon consisting of the item's icon underneath the replication border for this replication's category
					icon = {
						{icon = current_item.pointer.icon, icon_size = icon_size}, -- redundant icon_size, a single icon needs item.icon_size
						{
							icon = "__dark-matter-replicators-18__/graphics/icons/borders/repl-"..icon_name..".png",
							icon_size = 32,
							--scale = icon_size / 32
						}
					}
					max_size = icon_size
					if not max_size then max_size = 64 end
				else
					log("The item "..current_item.pointer.name.." does not have an icon. Dependency issue? (another mod adds the icon in their data-final-fixes after)")
				end

				--log("serpent of recipe icon: "..serpent.block(icon))
				--Generate the recipe itself
				repl_data[#repl_data + 1] = {
					type = "recipe",
					name = gprefix.."repl-"..(current_item.internal_name_override or current_item.name),
					category = gprefix.."replication-"..current_replication.tier,
					enabled = false,
					energy_required = cost,
					ingredients = {},
					results = {{
						type = type,
						name = current_item.name,
						amount = amount
					}},
					icons = icon,
--					icon_size = 32,
					subgroup = gprefix.."replication-recipes-"..current_replication.category.name,
					order = "x"..current_replication.category.order --It would have the same order as all the other recipes in its subgroup anyway
				}
				--Create an unlock effect for this recipe
				effects[#effects + 1] = {type = "unlock-recipe", recipe = gprefix.."repl-"..current_item.name}
			end
			
			--Get the technology's icon

			local repldata  = repl_data[#repl_data]
			if not repldata.icons[1] then error("wanted to make a replication tech but there wasn't anything to replicate") end

			local tech_icon
			local icon_size

			if current_replication.overrides.icon then
                if current_replication.overrides.icon_size then icon_size = current_replication.overrides.icon_size else icon_size = 128 end
				tech_icon = {
						{icon = current_replication.overrides.icon, icon_size = icon_size},
						{icon = "__dark-matter-replicators-18__/graphics/icons/borders/tech-"..current_replication.category.name..".png", icon_size = 128}
				}
			else
				tech_icon = table.deepest_copy(repl_data[1].icons)
				tech_icon[#tech_icon].scale = tech_icon[1].icon_size / 32
			end
			
			--log("serpent of tech icons: "..serpent.block(tech_icon))

			--Find and put together the pieces of the technology's display name
			local display_name = {"repltype-tech.display", {"repltype-tech."..current_replication.category.name}}
			local first_item = current_replication.items[1]
			if current_replication.overrides.localized_name then
				display_name[3] = current_replication.overrides.localized_name
			elseif first_item.pointer.localised_name then
				display_name[3] = first_item.pointer.localised_name
			elseif first_item.pointer.place_result then
				--If an item can be placed as an entity then its item display name defaults to that entity's display name during localization.  Many placable items do not have actual names of their own and instead use the names of their placed forms.
				display_name[3] = {"entity-name."..first_item.pointer.place_result}
			elseif first_item.fluid then
				display_name[3] = {"fluid-name."..first_item.pointer.name}
			else
				display_name[3] = {"item-name."..first_item.pointer.name}
			end
			
			--Generate technology data
			local upgrade = current_replication.overrides.upgrade
			if upgrade == nil then
				upgrade = current_replication.category.upgrade
			end
			local research_multiplier = current_replication.overrides.research_multiplier or current_replication.category.research_multiplier or 1
			repl_data[#repl_data + 1] = {
				type = "technology",
				name = gprefix.."repl-"..current_replication.name,
				localised_name = display_name,
				icons = tech_icon,
--				icon_size = tech_icon_size, -- should be using explicit icon sizes now, too many size differences
				effects = effects,
				prerequisites = current_replication.prerequisites,
				unit = repl_research(current_replication.tier, reps_multiplier * research_multiplier, research_time),
				upgrade = upgrade,
				order = "x"..current_replication.category.order
			}
			
			--Add the new data to Factorio's main data structure
			data:extend(repl_data)
		else
			log("The repltech \""..current_replication.name.."\" was not created as a technology becuase it does not contain any replicatable items.")
		end
	end
end