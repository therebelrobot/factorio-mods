--Crafting time cost multipliers for different recipe categories
--Each such category being based on a specific machine which performs that type of crafting, with the value being (energy cost in kW)/(speed * 270)
replvar("", 56/90) --Assembly machine 3 (basic crafting is represented by an empty name becuase Factorio itself represents it with the lack of a recipe category)
replvar("smelting", 1/3) --Electric furnace
replvar("oil-processing", 14/9) --Oil refinery
replvar("chemistry", 56/90) --Chemical plant
replvar("centrifuging", 140/81) --Centrifuge
replvar("rocket-building", 25/27) --Rocket silo
--I should really have the mod perform these calculations itself but they'll work as numerical constants for now



--Debug
--repltech_recipe("lubricant", "chemical")




--Raw resources
replvar("ore", 2)

repltech_ore("iron-ore", 1, 10, {internal_name = gprefix.."26-ore-iron"})
repltech_ore("copper-ore", 1, 8, {internal_name = gprefix.."29-ore-copper"})
repltech_ore("coal", 1, 8)
repltech_ore("stone", 1, 4)
repltech_raw("wood", 0.5)
--This is per unit of liquid, so it should be low
repltech_raw("water", 0.02)
repltech_raw("crude-oil", 0.1)
--Uranium ore requires sulfuric acid to mine so the ore function won't work with it, but the things you see here is basically what the ore function does anyway
repltech_item("uranium-ore", "ore", {{target = "ore", type = "var", multiplier = 2/0.9*8}, {target = "sulfuric-acid", type = "item", multiplier = 10}}, nil, {internal_name = gprefix.."92-ore-uranium"})


--Elements
repltech_element(16, "sulfur", {replsub_recipe("sulfur")}, "crude-oil")
repltech_element(26, "iron", {replsub_recipe("iron-plate")}, "iron-ore")
repltech_element(29, "copper", {replsub_recipe("copper-plate")}, "copper-ore")
--The cost of 238 is calculated based on uranium processing while the cost of 235 is based on enrichment
repltech_element(92, "uranium", {
	replsub_item("uranium-235", {{target = "uranium-238", type = "item", multiplier = 3}, {target = "centrifuging", type = "var", multiplier = 49.5}}),
	replsub_item("uranium-238", {{target = "uranium-ore", type = "item", multiplier = 1}, {target = "centrifuging", type = "var", multiplier = 9.5}})
	}, "uranium-ore")


--Chemical resources
--[[I think that petroleum gas should cost proportionally less to replicate because it is the more common result of oil refining (4 produced for every 3 of the others).  However, the average replication cost of the three products of oil refining should be true to the cost of the oil and refining.  As such, I will need to find the right modifiers for the three products:
3x = 3y = 4z
(x+y+z)/3 = 1
x+y+z = 3
2x+z = 3
2x+z-3 = 0
3x = 4z
3x-4z = 0
3x-4z+4*0 = 0
3x-4z+4*(2x+z-3) = 0
3x-4z+8x+4z-12 = 0
3x+8x-4z+4z-12 = 0
11x-12 = 0
11x = 12
x = 12/11
y = 12/11
z = 9/11
Work check: x+y+z = 12/11+12/11+9/11 = (12+12+9)/11 = 33/11 = 3
]]

replvar("oil-product", {{target = "crude-oil", type = "item", multiplier = 1}, {target = "oil-processing", type = "var", multiplier = 0.045}})
repltech_item("heavy-oil", "chemical", {target = "oil-product", type = "var", multiplier = 12/11}, {{target = "basic-oil-processing", type = "recipe"}})
repltech_item("light-oil", "chemical", {target = "oil-product", type = "var", multiplier = 12/11}, {{target = "basic-oil-processing", type = "recipe"}})
repltech_item("petroleum-gas", "chemical", {target = "oil-product", type = "var", multiplier = 9/11}, {{target = "basic-oil-processing", type = "recipe"}})

repltech_recipe("lubricant", "chemical")
repltech_recipe("solid-fuel-from-light-oil", "chemical")
repltech_recipe("plastic-bar", "chemical")

repltech_recipe("sulfuric-acid", "chemical")
repltech_recipe("explosives", "chemical")


--Complex resources
repltech_recipe("iron-stick", "shape")
repltech_recipe("iron-gear-wheel", "shape")
repltech_recipe("pipe", "shape")
repltech_recipe("copper-cable", "shape")
repltech_recipe("stone-brick", "shape")

repltech_recipe("concrete", "chemical")
repltech_recipe("refined-concrete", "chemical")
repltech_recipe("battery", "device3")

repltech_recipe("electronic-circuit", "device3")
repltech_recipe("advanced-circuit", "device4")
repltech_recipe("processing-unit", "device5")

repltech_recipe("engine-unit", "device3")
repltech_recipe("electric-engine-unit", "device3")


--Modules
repltech_recipe("speed-module", "module", {internal_name = "speed-module-1", tier = 4})
repltech_recipe("speed-module-2", "module")
repltech_recipe("speed-module-3", "module")

repltech_recipe("effectivity-module", "module", {internal_name = "effectivity-module-1", tier = 4})
repltech_recipe("effectivity-module-2", "module")
repltech_recipe("effectivity-module-3", "module")

repltech_recipe("productivity-module", "module", {internal_name = "productivity-module-1", tier = 4})
repltech_recipe("productivity-module-2", "module")
repltech_recipe("productivity-module-3", "module")


--Machines
repltech_recipe("electric-mining-drill", "device3")
repltech_recipe("electric-furnace", "device4")

repltech_recipe("assembling-machine-1", "device3", {upgrade = true})
repltech_recipe("assembling-machine-2", "device4", {upgrade = true})
repltech_recipe("assembling-machine-3", "device4", {upgrade = true})

repltech_recipe("chemical-plant", "device3")

repltech_recipe("solar-panel", "device3")
repltech_recipe("accumulator", "device4")

repltech_recipe("small-lamp", "device3")
repltech_recipe("beacon", "device4")


--Logistics
repltech_recipe("landfill", "shape")
repltech_recipe("cliff-explosives", "device3")

repltech_recipe("transport-belt", "device3")
repltech_recipe("fast-transport-belt", "device3")
repltech_recipe("express-transport-belt", "device4")

repltech_recipe("inserter", "device3")
repltech_recipe("fast-inserter", "device4")
repltech_recipe("filter-inserter", "device4")

repltech_recipe("steel-chest", "alloy")
repltech_recipe("empty-barrel", "alloy")

repltech_recipe("small-electric-pole", "device2")
repltech_item_table({replsub_recipe("medium-electric-pole"), replsub_recipe("big-electric-pole")}, "device3", "medium-electric-pole", {localized_name = {"technology-name."..gprefix.."repl-poles"}})
repltech_recipe("substation", "device4")

repltech_recipe("rail", "device3")
repltech_item_table({replsub_recipe("rail-signal"), replsub_recipe("rail-chain-signal")}, "device3", "rail-signal")

repltech_recipe("flying-robot-frame", "device4")
repltech_recipe("construction-robot", "device4")
repltech_recipe("logistic-robot", "device4")
repltech_item_table({replsub_recipe("roboport")}, "device4", {{target="roboport", type="recipe-items-only"}, {target="robotics", type="tech"}})


--Warfare
repltech_recipe("stone-wall", "shape")
repltech_recipe("gate", "device3")

repltech_recipe("firearm-magazine", "device2")
repltech_recipe("piercing-rounds-magazine", "device3")
repltech_recipe("uranium-rounds-magazine", "device4")

repltech_recipe("shotgun-shell", "device2")
repltech_recipe("piercing-shotgun-shell", "device3")

repltech_recipe("flamethrower-ammo", "device3")

repltech_recipe("rocket", "device3")
repltech_recipe("explosive-rocket", "device4")
repltech_recipe("atomic-bomb", "device5")

repltech_recipe("cannon-shell", "device3")
repltech_recipe("explosive-cannon-shell", "device4")
repltech_recipe("uranium-cannon-shell", "device4")
repltech_recipe("explosive-uranium-cannon-shell", "device5")

repltech_recipe("artillery-shell", "device4")

repltech_recipe("grenade", "device2")
repltech_recipe("cluster-grenade", "device3")

repltech_recipe("poison-capsule", "device3")
repltech_recipe("slowdown-capsule", "device3")

repltech_recipe("land-mine", "device3")

repltech_recipe("defender-capsule", "device3")
repltech_recipe("distractor-capsule", "device4")
repltech_recipe("destroyer-capsule", "device5")

repltech_recipe("repair-pack", "device3")

repltech_recipe("gun-turret", "device3")
repltech_recipe("laser-turret", "device4")
repltech_recipe("flamethrower-turret", "device4")

repltech_recipe("radar", "device3")


--Space
repltech_recipe("low-density-structure", "device4")
repltech_recipe("rocket-fuel", "chemical", {tier = 4})
repltech_recipe("rocket-control-unit", "device5")
repltech_recipe("satellite", "device5")


--Science packs
repltech_recipe("automation-science-pack", "science", {tier = 3})
repltech_recipe("logistic-science-pack", "science", {tier = 4})
repltech_recipe("military-science-pack", "science", {tier = 4})
repltech_recipe("chemical-science-pack", "science", {tier = 4})
repltech_recipe("production-science-pack", "science", {tier = 5})
repltech_recipe("utility-science-pack", "science", {tier = 5})
repltech_item("space-science-pack", "science",
	{{target = "rocket-part", type = "recipe", multiplier = 0.1}, {target = "satellite", type = "item", multiplier = 0.001}},
	{{target = "rocket-part", type = "recipe"}, {target = "satellite", type = "item"}},
	{tier = 5})


--Other
repltech_recipe("steel-plate", "alloy")
repltech_recipe("uranium-fuel-cell", "device3")
repltech_recipe("nuclear-fuel", "device3")
repltech_item("raw-fish", "life", 200)
