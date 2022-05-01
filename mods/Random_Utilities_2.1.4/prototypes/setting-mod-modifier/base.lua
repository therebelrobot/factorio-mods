--solar panel upgradable
data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "solar-panel"
--accumulator upgradable
data.raw["accumulator"]["accumulator"].fast_replaceable_group = "accumulator"
--substation upgradable
data.raw["electric-pole"]["substation"].fast_replaceable_group = "electric-pole"
--lamp upgradable
data.raw["lamp"]["small-lamp"].fast_replaceable_group = "lamp"
--boiler upgradable
data.raw["boiler"]["boiler"].fast_replaceable_group = "boiler"
--steam engine upgradable
data.raw["generator"]["steam-engine"].fast_replaceable_group = "steam-engine"
--centifughe upgradable
--nuclear reactor upgradable
--turbine upgradable
--train upgradable


--electric pole range
data.raw["electric-pole"]["small-electric-pole"].maximum_wire_distance = settings.startup["small-electric-pole-max-wire-distance"].value
data.raw["electric-pole"]["small-electric-pole"].supply_area_distance = settings.startup["small-electric-pole-supply-area-distance"].value / 2  -- (5x5) make this divide by 2
data.raw["electric-pole"]["medium-electric-pole"].maximum_wire_distance = settings.startup["medium-electric-pole-max-wire-distance"].value
data.raw["electric-pole"]["medium-electric-pole"].supply_area_distance = settings.startup["medium-electric-pole-supply-area-distance"].value / 2  -- (7x7) make this divide by 2
data.raw["electric-pole"]["big-electric-pole"].maximum_wire_distance = settings.startup["big-electric-pole-max-wire-distance"].value
data.raw["electric-pole"]["big-electric-pole"].supply_area_distance = settings.startup["big-electric-pole-supply-area-distance"].value / 2  -- (4x4) make this divide by 2
data.raw["electric-pole"]["substation"].maximum_wire_distance = settings.startup["substation-max-wire-distance"].value
data.raw["electric-pole"]["substation"].supply_area_distance = settings.startup["substation-supply-area-distance"].value / 2 -- (18x18) make this divide by 2

--Inventory size 
if settings.startup["ru-inventory-size"] then
   data.raw.character["character"].inventory_size = settings.startup["ru-inventory-size"].value
end

--Reach distance
if settings.startup["ru-reach-distance"] then
   data.raw.character["character"].build_distance = settings.startup["ru-reach-distance"].value
   data.raw.character["character"].reach_distance = settings.startup["ru-reach-distance"].value
end

--Mining reach
if settings.startup["ru-mine-reach"] then
   data.raw.character["character"].reach_resource_distance = settings.startup["ru-mine-reach"].value
end

 --Mining speed 
if settings.startup["ru-mining-speed"] then
   data.raw.character["character"].mining_speed = data.raw.character["character"].mining_speed * settings.startup["ru-mining-speed"].value
end

--hp
if settings.startup["ru-hp"] then
   data.raw.character["character"].health = settings.startup["ru-hp"].value
end

--hp recovery
if settings.startup["ru-hp-recovery"] then
   data.raw.character["character"].healing_per_tick = settings.startup["ru-hp-recovery"].value
end

--running speed
if settings.startup["ru-hp-recovery"] then
   data.raw.character["character"].running_speed = data.raw.character["character"].running_speed + settings.startup["ru-running-speed"].value
end


