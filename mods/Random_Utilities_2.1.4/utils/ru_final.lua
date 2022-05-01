
if settings.startup["ru-force-equipment-categories"] then

    local grid_lists = {}
  
    if mods["spidertrontiers"] and mods["bobvehicleequipment"] then
      table.insert( grid_lists, "spidertron-equipment-grid" )
      table.insert( grid_lists, "spidertron-equipment-grid" )
      table.insert( grid_lists, "spidertron-mk-1-equipment-grid" )
      table.insert( grid_lists, "spidertron-mk0-equipment-grid" )
      table.insert( grid_lists, "spidertron-mk2-equipment-grid" )
      table.insert( grid_lists, "spidertron-mk3-equipment-grid" )
      table.insert( grid_lists, "prototype-spidertron-equipment-grid" )
      table.insert( grid_lists, "assault-spidertron-mk1-equipment-grid" )
      table.insert( grid_lists, "assault-spidertron-mk2-equipment-grid" )
      table.insert( grid_lists, "bulwark-spidertron-mk1-equipment-grid" )
      table.insert( grid_lists, "bulwark-spidertron-mk2-equipment-grid" )
      table.insert( grid_lists, "scout-spidertron-mk1-equipment-grid" )
      table.insert( grid_lists, "scout-spidertron-mk2-equipment-grid" )
      table.insert( grid_lists, "voyage-spidertron-mk1-equipment-grid" )
      table.insert( grid_lists, "voyage-spidertron-mk2-equipment-grid" )
    end
  
    for _, grid in pairs(grid_lists) do
      if not (data.raw["equipment-grid"][grid].equipment_categories == "armor") then
        table.insert(data.raw["equipment-grid"][grid].equipment_categories, "armor")
      end
    end
  end
  
  if settings.startup["ru-force-chemical-fuel"].value == true then
  
    local entity_list = {
      "locomotive",
      "car",
      "inserter",
      "mining-drill",
      "boiler",
      "furnace",
      "reactor",
    }
    --[
    if mods["Krastorio2"] then
      table.insert(entity_list, "generator-equipment")
      table.insert(entity_list, "spider-vehicle")
    end
  --]]
  
    for _, entity in pairs(entity_list) do
  
      local function ChangeTable(name)
  
        if data.raw[entity][name] and data.raw[entity][name].burner then
          if data.raw[entity][name].burner.fuel_category then
            data.raw[entity][name].burner.fuel_categories = {data.raw[entity][name].burner.fuel_category, "chemical"}
            data.raw[entity][name].burner.fuel_category = nil
          end
  
          local fuelissimi1 = {}
  
          --if mods["InfiniteFuel"] then
          --  table.insert(fuelissimi1, "IF")
          --end
  
          for _, fuels1 in pairs(fuelissimi1) do
            if data.raw[entity][name].burner.fuel_categories then
              table.insert(data.raw[entity][name].burner.fuel_categories, fuels1)
            end
          end
        end
  
        if data.raw[entity][name] and data.raw[entity][name].energy_source then
          if data.raw[entity][name].energy_source.fuel_category then
            data.raw[entity][name].energy_source.fuel_categories = {data.raw[entity][name].energy_source.fuel_category, "chemical"}
            data.raw[entity][name].energy_source.fuel_category = nil
          end
  
          local fuelissimi2 = {}
  
          --if mods["InfiniteFuel"] then
          --  table.insert(fuelissimi2, "IF")
          --end
  
          for _, fuels2 in pairs(fuelissimi2) do
            if data.raw[entity][name].energy_source.fuel_categories then
              table.insert(data.raw[entity][name].energy_source.fuel_categories, fuels2)
            end
          end
        end
      end
  
      for _, list in pairs(data.raw[entity]) do
        for _, name in pairs(list) do
          ChangeTable(name)
        end
      end
  
    end
  end
  
  --enable beacons productivity (global)
  if settings.startup["ru-beacon-Productivity"].value == true then
    if data.raw.beacon.allowed_effects ~= "productivity" then
      for _, beacon in pairs(data.raw.beacon) do
        table.insert(beacon.allowed_effects, "productivity")
      end
    end
  end
  
  --disable beacons productivity (global)
  if settings.startup["ru-beacon-Productivity"].value == false then
    if data.raw.beacon.allowed_effects == "productivity" then
      for _, beacon in pairs(data.raw.beacon) do
        table.remove(beacon.allowed_effects, "productivity")
      end
    end
  end
  
  local entity_list = {
    "module"
  }
  for _, entity in pairs(entity_list) do
    local function RemoveProductivity(name)
      if data.raw[entity][name] and data.raw[entity][name].limitation then
        if settings.startup["ru-Disable-Productivity-Limitation"].value == true then
          if data.raw[entity][name].limitation ~= nil then
          data.raw[entity][name].limitation = nil
          end
        end
      end
    end
    for _, list in pairs(data.raw[entity]) do
      for _, name in pairs(list) do
        RemoveProductivity(name)
      end
    end
  end
  
  --botspeed
  if settings.startup["ru-botspeed"].value then
      for _, crobot in pairs(data.raw["construction-robot"]) do
        crobot.speed = crobot.speed + settings.startup["ru-botspeed"].value
      end
      for _, lrobot in pairs(data.raw["logistic-robot"]) do
        lrobot.speed = lrobot.speed + settings.startup["ru-botspeed"].value
      end
  end
  
  -- mini equipment
  local equip_list = {
    "energy-shield-equipment",
    "solar-panel-equipment",
    "generator-equipment",
    "battery-equipment",
    "roboport-equipment",
    "night-vision-equipment",
    "movement-bonus-equipment",
    "active-defense-equipment",
  }
  for _, entity in pairs(equip_list) do
    local function MiniEquipment(name)
      if data.raw[entity][name] and data.raw[entity][name].shape then
        if settings.startup["ru-MiniEquipment"].value == true then
          if data.raw[entity][name].shape ~= nil then
            if data.raw[entity][name].shape ~= {width = 1, height = 1, type = "full"} then
              data.raw[entity][name].shape = {width = 1, height = 1, type = "full"}
            end
          end
        end
      end
    end
    for _, list in pairs(data.raw[entity]) do
      for _, name in pairs(list) do
        MiniEquipment(name)
      end
    end
  end
  
  
  
  
  --collision box tree DISABLED
  --[[if settings.startup["ru-trees"].value then
     for _, tree in pairs(data.raw["tree"]) do
        tree.collision_box = {{-0.03, -0.03}, {0.03, 0.03}}
     end
  end--]]
  
  --Powerful Lamp Setting OK
  if settings.startup["ru-powerful-lamp"] then
     data.raw.character["character"].light = {
        {minimum_darkness = 0.3, intensity = 0.9, size = settings.startup["ru-powerful-lamp"].value}
     }
  end