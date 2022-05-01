
--boiler
if settings.startup["ru-boiler"].value == "basic" or settings.startup["ru-boiler"].value == "medium" or settings.startup["ru-boiler"].value == "big" or settings.startup["ru-boiler"].value == "behemoth" then
  data.raw["recipe"]["ru-basic-boiler"].hidden = false
  data.raw["technology"]["ru-basic-boiler"].hidden = false
  if settings.startup["ru-boiler"].value == "medium" or settings.startup["ru-boiler"].value == "big" or settings.startup["ru-boiler"].value == "behemoth" then
    data.raw["recipe"]["ru-medium-boiler"].hidden = false
    data.raw["technology"]["ru-medium-boiler"].hidden = false
    if settings.startup["ru-boiler"].value == "big" or settings.startup["ru-boiler"].value == "behemoth" then
      data.raw["recipe"]["ru-big-boiler"].hidden = false
      data.raw["technology"]["ru-big-boiler"].hidden = false
      if settings.startup["ru-boiler"].value == "behemoth" then
        data.raw["recipe"]["ru-behemoth-boiler"].hidden = false
        data.raw["technology"]["ru-behemoth-boiler"].hidden = false
      end
    end
  end
end

--Steam Engine
if settings.startup["ru-steam-engine"].value == "basic" or settings.startup["ru-steam-engine"].value == "medium" or settings.startup["ru-steam-engine"].value == "big" or settings.startup["ru-steam-engine"].value == "behemoth" then
  data.raw["recipe"]["ru-basic-steam-engine"].hidden = false
  data.raw["technology"]["ru-basic-steam-engine"].hidden = false
  if settings.startup["ru-steam-engine"].value == "medium" or settings.startup["ru-steam-engine"].value == "big" or settings.startup["ru-steam-engine"].value == "behemoth" then
    data.raw["recipe"]["ru-medium-steam-engine"].hidden = false
    data.raw["technology"]["ru-medium-steam-engine"].hidden = false
    if settings.startup["ru-steam-engine"].value == "big" or settings.startup["ru-steam-engine"].value == "behemoth" then
      data.raw["recipe"]["ru-big-steam-engine"].hidden = false
      data.raw["technology"]["ru-big-steam-engine"].hidden = false
      if settings.startup["ru-steam-engine"].value == "behemoth" then
        data.raw["recipe"]["ru-behemoth-steam-engine"].hidden = false
        data.raw["technology"]["ru-behemoth-steam-engine"].hidden = false
      end
    end
  end
end

--substation
if settings.startup["ru-substation"].value == "basic" or settings.startup["ru-substation"].value == "medium" or settings.startup["ru-substation"].value == "big" or settings.startup["ru-substation"].value == "behemoth" then
  data.raw["recipe"]["ru-basic-substation"].hidden = false
  data.raw["technology"]["ru-basic-substation"].hidden = false
  if settings.startup["ru-substation"].value == "medium" or settings.startup["ru-substation"].value == "big" or settings.startup["ru-substation"].value == "behemoth" then
    data.raw["recipe"]["ru-medium-substation"].hidden = false
    data.raw["technology"]["ru-medium-substation"].hidden = false
    if settings.startup["ru-substation"].value == "big" or settings.startup["ru-substation"].value == "behemoth" then
      data.raw["recipe"]["ru-big-substation"].hidden = false
      data.raw["technology"]["ru-big-substation"].hidden = false
      if settings.startup["ru-substation"].value == "behemoth" then
        data.raw["recipe"]["ru-behemoth-substation"].hidden = false
        data.raw["technology"]["ru-behemoth-substation"].hidden = false
        data.raw["recipe"]["ru-junction-pole"].hidden = false
        table.insert(data.raw["technology"]["ru-behemoth-substation"].effects, {type = "unlock-recipe", recipe = "ru-junction-pole"})
      end
    end
  end
end

--accumulator
if settings.startup["ru-accumulator"].value == "basic" or settings.startup["ru-accumulator"].value == "medium" or settings.startup["ru-accumulator"].value == "big" or settings.startup["ru-accumulator"].value == "behemoth" then
  data.raw["recipe"]["ru-basic-accumulator"].hidden = false
  data.raw["technology"]["ru-Advanced-Electric-Energy-accumulators-a"].hidden = false
  if settings.startup["ru-accumulator"].value == "medium" or settings.startup["ru-accumulator"].value == "big" or settings.startup["ru-accumulator"].value == "behemoth" then
    data.raw["recipe"]["ru-medium-accumulator"].hidden = false
    data.raw["technology"]["ru-Advanced-Electric-Energy-accumulators-b"].hidden = false
    if settings.startup["ru-accumulator"].value == "big" or settings.startup["ru-accumulator"].value == "behemoth" then
      data.raw["recipe"]["ru-big-accumulator"].hidden = false
      data.raw["technology"]["ru-Advanced-Electric-Energy-accumulators-c"].hidden = false
      if settings.startup["ru-accumulator"].value == "behemoth" then
        data.raw["recipe"]["ru-behemoth-accumulator"].hidden = false
        data.raw["technology"]["ru-Advanced-Electric-Energy-accumulators-d"].hidden = false
      end
    end
  end
end

if not settings.startup["ru-Logistic"].value == "nothing" then
data.raw["recipe"]["ru-basic-loader"].hidden = true
  if mods["deadlock-beltboxes-loaders"] then
  data.raw["recipe"]["ru-basic-transport-belt-beltbox"].hidden = true
  end
  end
if not settings.startup["ru-Logistic"].value == "nothing" or settings.startup["ru-Logistic"].value == "basic" then
data.raw["recipe"]["ru-medium-loader"].hidden = true
  if mods["deadlock-beltboxes-loaders"] then
  data.raw["recipe"]["ru-medium-transport-belt-beltbox"].hidden = true
  end
end
if not settings.startup["ru-Logistic"].value == "nothing" or settings.startup["ru-Logistic"].value == "basic" or settings.startup["ru-Logistic"].value == "medium" then
data.raw["recipe"]["ru-big-loader"].hidden = true
  if mods["deadlock-beltboxes-loaders"] then
  data.raw["recipe"]["ru-big-transport-belt-beltbox"].hidden = true
  end
end
if not settings.startup["ru-Logistic"].value == "nothing" or settings.startup["ru-Logistic"].value == "basic" or settings.startup["ru-Logistic"].value == "medium" or settings.startup["ru-Logistic"].value == "big" then
data.raw["recipe"]["ru-behemoth-loader"].hidden = true
  if mods["deadlock-beltboxes-loaders"] then
  data.raw["recipe"]["ru-behemoth-transport-belt-beltbox"].hidden = true
  end
end

--Belt / splitter / underground belt / loader-1x
if settings.startup["ru-Logistic"].value == "basic" or settings.startup["ru-Logistic"].value == "medium" or settings.startup["ru-Logistic"].value == "big" or settings.startup["ru-Logistic"].value == "behemoth" then
  data.raw["recipe"]["ru-basic-transport-belt"].hidden = false
  data.raw["recipe"]["ru-basic-underground-belt"].hidden = false
  data.raw["recipe"]["ru-basic-splitter"].hidden = false
  data.raw["recipe"]["ru-basic-loader"].hidden = false
  data.raw["technology"]["ru-logistics-a"].hidden = false
  if mods["miniloader"] then
    data.raw["recipe"]["ru-basic-miniloader"].hidden = false
    data.raw["recipe"]["ru-basic-filter-miniloader"].hidden = false
    data.raw["recipe"]["ru-basic-loader"].hidden = false
  end
  --[[
  if mods["deadlock-beltboxes-loaders"] then
    data.raw["recipe"]["ru-basic-transport-belt-loader"].hidden = true
    data.raw["recipe"]["ru-basic-transport-belt-beltbox"].hidden = true
  end
  --]]
  if settings.startup["ru-Logistic"].value == "medium" or settings.startup["ru-Logistic"].value == "big" or settings.startup["ru-Logistic"].value == "behemoth" then
    data.raw["recipe"]["ru-medium-transport-belt"].hidden = false
    data.raw["recipe"]["ru-medium-underground-belt"].hidden = false
    data.raw["recipe"]["ru-medium-splitter"].hidden = false
    data.raw["recipe"]["ru-medium-loader"].hidden = false
    data.raw["technology"]["ru-logistics-b"].hidden = false
    if mods["miniloader"] then
      data.raw["recipe"]["ru-medium-miniloader"].hidden = false
      data.raw["recipe"]["ru-medium-filter-miniloader"].hidden = false
      data.raw["recipe"]["ru-medium-loader"].hidden = false
    end
    --[[
    if mods["deadlock-beltboxes-loaders"] then
      data.raw["recipe"]["ru-medium-transport-belt-loader"].hidden = true
      data.raw["recipe"]["ru-medium-transport-belt-beltbox"].hidden = true
    end
    --]]
    if settings.startup["ru-Logistic"].value == "big" or settings.startup["ru-Logistic"].value == "behemoth" then
      data.raw["recipe"]["ru-big-transport-belt"].hidden = false
      data.raw["recipe"]["ru-big-underground-belt"].hidden = false
      data.raw["recipe"]["ru-big-splitter"].hidden = false
      data.raw["recipe"]["ru-big-loader"].hidden = false
      data.raw["technology"]["ru-logistics-c"].hidden = false
      if mods["miniloader"] then
        data.raw["recipe"]["ru-big-miniloader"].hidden = false
        data.raw["recipe"]["ru-big-filter-miniloader"].hidden = false
        data.raw["recipe"]["ru-big-loader"].hidden = false
      end
      --[[
      if mods["deadlock-beltboxes-loaders"] then
        data.raw["recipe"]["ru-big-transport-belt-loader"].hidden = true
        data.raw["recipe"]["ru-big-transport-belt-beltbox"].hidden = true
      end
      --]]
      if settings.startup["ru-Logistic"].value == "behemoth" then
        data.raw["recipe"]["ru-behemoth-transport-belt"].hidden = false
        data.raw["recipe"]["ru-behemoth-underground-belt"].hidden = false
        data.raw["recipe"]["ru-behemoth-splitter"].hidden = false
        data.raw["recipe"]["ru-behemoth-loader"].hidden = false
        data.raw["technology"]["ru-logistics-d"].hidden = false
        if mods["miniloader"] then
          data.raw["recipe"]["ru-behemoth-miniloader"].hidden = false
          data.raw["recipe"]["ru-behemoth-filter-miniloader"].hidden = false
          data.raw["recipe"]["ru-behemoth-loader"].hidden = false
        end
        --[[
        if mods["deadlock-beltboxes-loaders"] then
          data.raw["recipe"]["ru-behemoth-transport-belt-loader"].hidden = true
          data.raw["recipe"]["ru-behemoth-transport-belt-beltbox"].hidden = true
        end
        --]]
      end
    end
  end
end

--fluid handling pipe/pipe to ground/pump
if settings.startup["ru-fluid-handling"].value == "basic" or settings.startup["ru-fluid-handling"].value == "medium" or settings.startup["ru-fluid-handling"].value == "big" or settings.startup["ru-fluid-handling"].value == "behemoth" then
  data.raw["recipe"]["ru-basic-pump"].hidden = false
  data.raw["recipe"]["ru-basic-pipe"].hidden = false
  data.raw["recipe"]["ru-basic-pipe-to-ground"].hidden = false
  data.raw["technology"]["ru-basic-fluid-handling"].hidden = false
  if settings.startup["ru-fluid-handling"].value == "medium" or settings.startup["ru-fluid-handling"].value == "big" or settings.startup["ru-fluid-handling"].value == "behemoth" then
    data.raw["recipe"]["ru-medium-pump"].hidden = false
    data.raw["recipe"]["ru-medium-pipe"].hidden = false
    data.raw["recipe"]["ru-medium-pipe-to-ground"].hidden = false
    data.raw["technology"]["ru-medium-fluid-handling"].hidden = false
    if settings.startup["ru-fluid-handling"].value == "big" or settings.startup["ru-fluid-handling"].value == "behemoth" then
      data.raw["recipe"]["ru-big-pump"].hidden = false
      data.raw["recipe"]["ru-big-pipe"].hidden = false
      data.raw["recipe"]["ru-big-pipe-to-ground"].hidden = false
      data.raw["technology"]["ru-big-fluid-handling"].hidden = false
      if settings.startup["ru-fluid-handling"].value == "behemoth" then
        data.raw["recipe"]["ru-behemoth-pump"].hidden = false
        data.raw["recipe"]["ru-behemoth-pipe"].hidden = false
        data.raw["recipe"]["ru-behemoth-pipe-to-ground"].hidden = false
        data.raw["technology"]["ru-behemoth-fluid-handling"].hidden = false
      end
    end
  end
end

--[[
--fluid handling pipe/pipe to ground/pump
for _, x in pairs(settings.startup["ru-fluid-handling"].value) do

  local fluid_handling = {"-pump", "-pipe", "-pipe-to-ground"}

  local number = {}

  if x == "basic" then number = 1
    elseif x == "medium" then number = 2
    elseif x == "big" then number = 3
    elseif x == "behemoth" then number = 4
  end

  local unlock_recipe = {}

  table.insert( unlock_recipe, "ru-"..x..fluid_handling)

  if number > 1 then
    table.insert( unlock_recipe, "ru-basic"..fluid_handling)
  end
  if number > 2 then
    table.insert( unlock_recipe, "ru-medium"..fluid_handling)
  end
  if number > 3 then
    table.insert( unlock_recipe, "ru-big"..fluid_handling)
  end

  for _, unlock in pairs(unlock_recipe) do
    data.raw["recipe"][unlock].hidden = false
  end
end
--]]

--inserter / Stack Inserter
if settings.startup["ru-inserter"].value == "basic" or settings.startup["ru-inserter"].value == "medium" or settings.startup["ru-inserter"].value == "big" or settings.startup["ru-inserter"].value == "behemoth" then
  data.raw["recipe"]["ru-basic-inserter"].hidden = false
  data.raw["technology"]["ru-basic-inserter"].hidden = false
  data.raw["recipe"]["ru-basic-stack-inserter"].hidden = false
  data.raw["technology"]["ru-basic-stack-inserter"].hidden = false
  if settings.startup["ru-inserter"].value == "medium" or settings.startup["ru-inserter"].value == "big" or settings.startup["ru-inserter"].value == "behemoth" then
    data.raw["recipe"]["ru-medium-inserter"].hidden = false
    data.raw["technology"]["ru-medium-inserter"].hidden = false
    data.raw["recipe"]["ru-medium-stack-inserter"].hidden = false
    data.raw["technology"]["ru-medium-stack-inserter"].hidden = false
    if settings.startup["ru-inserter"].value == "big" or settings.startup["ru-inserter"].value == "behemoth" then
      data.raw["recipe"]["ru-big-inserter"].hidden = false
      data.raw["technology"]["ru-big-inserter"].hidden = false
      data.raw["recipe"]["ru-big-stack-inserter"].hidden = false
      data.raw["technology"]["ru-big-stack-inserter"].hidden = false
      if settings.startup["ru-inserter"].value == "behemoth" then
        data.raw["recipe"]["ru-behemoth-inserter"].hidden = false
        data.raw["technology"]["ru-behemoth-inserter"].hidden = false
        data.raw["recipe"]["ru-behemoth-stack-inserter"].hidden = false
        data.raw["technology"]["ru-behemoth-stack-inserter"].hidden = false
      end
    end
  end
end

--solar Panel
if settings.startup["ru-solar-panel"].value == "basic" or settings.startup["ru-solar-panel"].value == "medium" or settings.startup["ru-solar-panel"].value == "big" or settings.startup["ru-solar-panel"].value == "behemoth" then
  data.raw["recipe"]["ru-basic-solar-panel"].hidden = false
  data.raw["technology"]["ru-Advanced-Solar-Energy-a"].hidden = false
  if settings.startup["ru-solar-panel"].value == "medium" or settings.startup["ru-solar-panel"].value == "big" or settings.startup["ru-solar-panel"].value == "behemoth" then
    data.raw["recipe"]["ru-medium-solar-panel"].hidden = false
    data.raw["technology"]["ru-Advanced-Solar-Energy-b"].hidden = false
    if settings.startup["ru-solar-panel"].value == "big" or settings.startup["ru-solar-panel"].value == "behemoth" then
      data.raw["recipe"]["ru-big-solar-panel"].hidden = false
      data.raw["technology"]["ru-Advanced-Solar-Energy-c"].hidden = false
      if settings.startup["ru-solar-panel"].value == "behemoth" then
        data.raw["recipe"]["ru-behemoth-solar-panel"].hidden = false
        data.raw["technology"]["ru-Advanced-Solar-Energy-d"].hidden = false
      end
    end
  end
end

--beacon
if settings.startup["ru-beacon"].value == "basic" or settings.startup["ru-beacon"].value == "medium" or settings.startup["ru-beacon"].value == "big" then
  data.raw["recipe"]["ru-basic-beacon"].hidden = false
  data.raw["technology"]["ru-advanced-effect-transmission-a"].hidden = false
  if settings.startup["ru-beacon"].value == "medium" or settings.startup["ru-beacon"].value == "big" then
    data.raw["recipe"]["ru-medium-beacon"].hidden = false
    data.raw["technology"]["ru-advanced-effect-transmission-b"].hidden = false
    if settings.startup["ru-beacon"].value == "big" then
      data.raw["recipe"]["ru-big-beacon"].hidden = false
      data.raw["technology"]["ru-advanced-effect-transmission-c"].hidden = false
    end
  end
end

--walkable Beacon
if settings.startup["ru-walkable-beacon"].value == "vanilla" or settings.startup["ru-walkable-beacon"].value == "basic" or settings.startup["ru-walkable-beacon"].value == "medium" or settings.startup["ru-walkable-beacon"].value == "big" then
  data.raw["recipe"]["ru-walkable-beacon"].hidden = false
  data.raw["technology"]["ru-walkable-beacon-upgrade"].hidden = false
  data.raw["technology"]["ru-walkable-beacon-downgrade"].hidden = false
  if settings.startup["ru-walkable-beacon"].value == "basic" or settings.startup["ru-walkable-beacon"].value == "medium" or settings.startup["ru-walkable-beacon"].value == "big" then
    data.raw["recipe"]["ru-walkable-basic-beacon"].hidden = false
    table.insert(data.raw["technology"]["ru-walkable-beacon-upgrade"].effects, {type = "unlock-recipe", recipe = "ru-walkable-basic-beacon",})
    table.insert(data.raw["technology"]["ru-walkable-beacon-downgrade"].effects, {type = "unlock-recipe", recipe = "ru-walkable-basic-beacon-Recycle",})
    if settings.startup["ru-walkable-beacon"].value == "medium" or settings.startup["ru-walkable-beacon"].value == "big" then
      data.raw["recipe"]["ru-walkable-medium-beacon"].hidden = false
      table.insert(data.raw["technology"]["ru-walkable-beacon-upgrade"].effects, {type = "unlock-recipe", recipe = "ru-walkable-medium-beacon",})
      table.insert(data.raw["technology"]["ru-walkable-beacon-downgrade"].effects, {type = "unlock-recipe", recipe = "ru-walkable-medium-beacon-Recycle",})
      if settings.startup["ru-walkable-beacon"].value == "big" then
        data.raw["recipe"]["ru-walkable-big-beacon"].hidden = false
        table.insert(data.raw["technology"]["ru-walkable-beacon-upgrade"].effects, {type = "unlock-recipe", recipe = "ru-walkable-big-beacon",})
        table.insert(data.raw["technology"]["ru-walkable-beacon-downgrade"].effects, {type = "unlock-recipe", recipe = "ru-walkable-big-beacon-Recycle",})
      end
    end
  end
end

--lamp
if settings.startup["ru-lamp"].value == "basic" or settings.startup["ru-walkable-beacon"].value == "medium" or settings.startup["ru-walkable-beacon"].value == "big" then
  data.raw["recipe"]["ru-basic-lamp"].hidden = false
  data.raw["technology"]["ru-basic-lamp"].hidden = false
  if settings.startup["ru-lamp"].value == "medium" or settings.startup["ru-walkable-beacon"].value == "big" then
    data.raw["recipe"]["ru-medium-lamp"].hidden = false
    data.raw["technology"]["ru-medium-lamp"].hidden = false
    if settings.startup["ru-lamp"].value == "big" then
      data.raw["recipe"]["ru-big-lamp"].hidden = false
      data.raw["technology"]["ru-big-lamp"].hidden = false
    end
  end
end

--Infinite Repairer
if settings.startup["ru-Infinite-Repairer"].value == true then
  data.raw["recipe"]["ru-Infinite-Repairer"].hidden = "false"
  data.raw["technology"]["ru-Infinite-Repairer"].hidden = "false"
end

  --disable items / recipes
if settings.startup["ru-alternativerecipe"].value == "true" then
  data.raw["recipe"]["ru-offshore-pump"].hidden = "false"
  data.raw["recipe"]["wood-to-landfill"].hidden = "false"
  --table.insert(data.raw["technology"]["landfill"].effects, { type = "unlock-recipe", recipe = "wood-to-landfill"})
end

if settings.startup["ru-cheatyrecipe"].value == "true" then
  data.raw["recipe"]["easy-landfill"].hidden = "false"
  --table.insert(data.raw["technology"]["landfill"].effects, { type = "unlock-recipe", recipe = "easy-landfill"})
end

if settings.startup["ru-cheatyrecipe"].value == "true" or settings.startup["ru-alternativerecipe"].value == "true" then
  data.raw["technology"]["landfill-2"].hidden = "false"
end

--space exploration beacon balance
if mods["space-exploration"] then
  --basic
  data.raw["beacon"]["ru-basic-beacon"]["module_specification"] = {module_slots = 10, module_info_icon_shift = {0, 0}, module_info_multi_row_initial_height_modifier = -0.3, module_info_max_icons_per_row = 2,}
  data.raw["beacon"]["ru-basic-beacon"].energy_usage = "75MW"
  data.raw["beacon"]["ru-walkable-basic-beacon"]["module_specification"] = {module_slots = 10, module_info_icon_shift = {0, 0}, module_info_multi_row_initial_height_modifier = -0.3, module_info_max_icons_per_row = 2,}
  data.raw["beacon"]["ru-walkable-basic-beacon"].energy_usage = "75MW"
  --medium
  data.raw["beacon"]["ru-medium-beacon"]["module_specification"] = {module_slots = 20, module_info_icon_shift = {0, 0}, module_info_multi_row_initial_height_modifier = -0.3, module_info_max_icons_per_row = 2,}
  data.raw["beacon"]["ru-medium-beacon"].energy_usage = "375MW"
  data.raw["beacon"]["ru-walkable-medium-beacon"]["module_specification"] = {module_slots = 20, module_info_icon_shift = {0, 0}, module_info_multi_row_initial_height_modifier = -0.3, module_info_max_icons_per_row = 2,}
  data.raw["beacon"]["ru-walkable-medium-beacon"].energy_usage = "375MW"
  --big
  data.raw["beacon"]["ru-big-beacon"]["module_specification"] = {module_slots = 30, module_info_icon_shift = {0, 0}, module_info_multi_row_initial_height_modifier = -0.3, module_info_max_icons_per_row = 2,}
  data.raw["beacon"]["ru-big-beacon"].energy_usage = "1875MW"
  data.raw["beacon"]["ru-walkable-big-beacon"]["module_specification"] = {module_slots = 30, module_info_icon_shift = {0, 0}, module_info_multi_row_initial_height_modifier = -0.3, module_info_max_icons_per_row = 2,}
  data.raw["beacon"]["ru-walkable-big-beacon"].energy_usage = "1875MW"
end