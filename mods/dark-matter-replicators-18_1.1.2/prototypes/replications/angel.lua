--Angel's mods machines
replvar("water-treatment", 25/54)

--If there is Angel pure water, use it instead of Bob pure water
if data.raw["fluid"]["water-purified"] then
	--Remove the Bob pure water replication, if it exists
	repl_table["pure-water"] = nil
	--Create a new repltech with the same internal name
	repltech_item("water-purified", "chemical", {{target = "water", type = "item", multiplier = 1.5}, {target = "water-treatment", type = "var", multiplier = 0.01}}, {{target = "hydrogen", type = "item"}, {target = "oxygen", type = "item"}})
end

--Add crushed stone and slag by using the recipe and value for regular stone and going backwards
repladd_item("stone", "stone-crushed", {{target = "stone", type = "item", multiplier = 0.5}, {target = "", type = "var", multiplier = -0.25}})
repladd_item("stone", "slag", {{target = "stone", type = "item", multiplier = 1}, {target = "", type = "var", multiplier = -0.5}})

--Also add mineralized and salt water
repladd_recipe("water", "water-mineralized")
repladd_recipe("water", "water-saline")

--Catalysts
repltech_recipe("catalyst-metal-carrier", "shape")
repltech_recipe("catalyst-metal-red", "device2")
repltech_recipe("catalyst-metal-green", "device2")
repltech_recipe("catalyst-metal-blue", "device2")
repltech_recipe("catalyst-metal-yellow", "device2")

--Rocket fuel calculation variables (This is a bad solution but I haven't thought of a better one yet.)
replvar("rocket-fuel-capsule", "chemical")
replvar("rocket-oxidizer-capsule")
replvar("gas-dimethylhydrazine")
replvar("gas-hydrazine")
replvar("liquid-nitric-acid")
replvar("gas-dinitrogen-tetroxide")
replvar("gas-dimethylamine")
replvar("gas-monochloramine")
replvar("gas-ammonia")
replvar("gas-nitrogen-dioxide")
replvar("gas-nitrogen-monoxide")
replvar("gas-methylamine")
replvar("cellulose-fiber", 0.75)
replvar("gas-methanol", "gas-methanol-from-wood")
replvar("solid-sodium-hypochlorite")
replvar("liquid-aqueous-sodium-hydroxide")
replvar("solid-sodium-hydroxide")
replvar("angels-electrode", {{target = "angels-electrode", type = "recipe", multiplier = 0.2}})
replvar("solid-sodium", "element")
replvar("gas-hydrogen", {{target = "hydrogen", type = "item", multiplier = 1}})
replvar("gas-oxygen", {{target = "oxygen", type = "item", multiplier = 1}})
replvar("gas-nitrogen", {{target = "nitrogen", type = "item", multiplier = 1}})
replvar("gas-chlorine", {{target = "chlorine", type = "item", multiplier = 1}})
replvar("solid-carbon", {{target = "carbon", type = "item", multiplier = 1}})

--Angel ores, if they exist
if data.raw["item"]["angels-ore1"] then
	repltech_ore("angels-ore1", 1, 10)
	repltech_ore("angels-ore2", 2, 7)
	repltech_ore("angels-ore3", 1.5, 10)
	repltech_ore("angels-ore4", 2.5, 7)
	repltech_ore("angels-ore5", 2, 8)
	repltech_ore("angels-ore6", 2.5, 8)
	repltech_raw("thermal-water", 0.1/3*7)
	--Also make these prerequisites for the other ores and increase their costs coorespondingly
	local function angel_ore_requirement(item, required_ore, multiplier)
		repl_table[item].items[1].cost = {{target = required_ore, type = "item", multiplier = multiplier}}
		repl_table[item].prerequisites = {{target = required_ore, type = "item"}}
	end
	angel_ore_requirement(gprefix.."26-ore-iron", "angels-ore1", 0.7) --3
	angel_ore_requirement(gprefix.."29-ore-copper", "angels-ore3", 0.7) --3
	angel_ore_requirement(gprefix.."92-ore-uranium", "angels-ore3", 2.1) --1
	if bobmods and (bobmods.ores or bobmods.plates) then
		angel_ore_requirement(gprefix.."13-ore-aluminum", "angels-ore5", 2.1) --1
		angel_ore_requirement(gprefix.."27-ore-cobalt", "angels-ore3", 2.1) --1
		angel_ore_requirement(gprefix.."79-ore-gold", "angels-ore5", 2.1) --1
		angel_ore_requirement(gprefix.."82-ore-lead", "angels-ore5", 0.7) --3
		angel_ore_requirement(gprefix.."28-ore-nickel", "angels-ore5", 1) --2
		angel_ore_requirement(gprefix.."14-ore-silicon", "angels-ore6", 1) --2
		angel_ore_requirement(gprefix.."22-ore-titanium", "angels-ore1", 2.1) --1
		angel_ore_requirement(gprefix.."47-ore-silver", "angels-ore4", 2.1) --1
		angel_ore_requirement(gprefix.."50-ore-tin", "angels-ore6", 0.7) --3
		angel_ore_requirement(gprefix.."74-ore-tungsten", "angels-ore5", 2.1) --1
		angel_ore_requirement(gprefix.."30-ore-zinc", "angels-ore2", 2.1) --1
	end
end
