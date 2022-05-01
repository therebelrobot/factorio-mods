--AII Industry

--New components
repltech_recipe("sand-from-stone", "ore")
repltech_recipe("glass-from-sand", "shape")
repltech_recipe("stone-tablet", "shape")
repltech_recipe("motor", "device2")
repltech_recipe("electric-motor", "device3")

--New usable things
repltech_recipe("concrete-wall", "chemical")
if data.raw.item["vehicle-fuel"] then
	repltech_item("vehicle-fuel", "chemical", {{target = "solid-fuel", type = "item", multiplier = 3/8}, 10/27}, {{target = "solid-fuel", type = "item"}, {target = "fuel-processing", type = "tech"}}, {tier = 4})
end

--Small electric poles
replvar("raw-wood", {target = "wood", type = "item", multiplier = 2})
local wood_prereq = repl_table["small-electric-pole"].prerequisites
wood_prereq[#wood_prereq + 1] = {target = "wood", type = "item"}
repladd_recipe("small-electric-pole", "small-iron-electric-pole")

--Lower tier machines
repltech_recipe("stone-furnace", "device2")
repltech_recipe("steel-furnace", "device3")
repltech_recipe("burner-inserter", "device3")
repltech_recipe("burner-mining-drill", "device3")
repltech_recipe("burner-assembling-machine", "device3")
