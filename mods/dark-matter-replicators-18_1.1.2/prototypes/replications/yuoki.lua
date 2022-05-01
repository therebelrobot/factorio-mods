--Yuoki Industries
replvar("y-crushing-recipe", 50/189) --electric Crusher
replvar("yuoki-formpress-recipe", 20/27) --electric Formpress
replvar("yuoki-archaeology-wash", 13/9) --Washer
replvar("yuoki-raw-material-recipe", 40/27) --Special drill
replvar("yuoki-wonder-recipe", 20/27) --Atomic Quantum Composer
replvar("yuoki-alien-recipe", 10000/27) --Alien Infuser

--Signs
--The way I see it, signs represent what other factions are willing to do for you.  If an item costs a small number of signs then you are getting the permission to craft the item from that faction and through replication you can easily pirate said blueprints.  But if an item takes a large number of signs then that machine requires constant support from its faction to work and can't be replicated at all.
replvar("y_greensign", 0)
replvar("y_rwtechsign", 0)
replvar("ypfw_trader_sign", 0)
replvar("ye_science_blue", 0)

--Things for which the costs are generally based on recipes but backwards and as such have had their references manually entered
repladd_item("026-iron", "y-pure-iron", {{target = "iron-plate", type = "item", multiplier = 2}, {target = "smelting", type = "var", multiplier = -3.5}})
repladd_item("029-copper", "y-pure-copper", {{target = "copper-plate", type = "item", multiplier = 2}, {target = "smelting", type = "var", multiplier = -3.5}})
repladd_recipe("coal", "y-coaldust-recipe")
repltech_item("y-slag", "ore", {target = "y-unicomp-a2", type = "item", multiplier = 0.01})
repltech_item_table({replsub_recipe("y_slag_granulate_recipe"), replsub_recipe("y_slag_brick_recipe"), replsub_recipe("y_tile_slagbricks_recipe"), replsub_recipe("y_tile_slagpattern_recipe"), replsub_recipe("y_tile_slagfilled_recipe")}, "shape", {target = "y-slag", type = "item"}, {localized_name = {"technology-name."..gprefix.."repl-shape-slag"}})
repltech_item("y-toxic-dust", "ore", {{target = "sulfuric-acid", type = "item", multiplier = 10/12}, {target = "water", type = "item", multiplier = -20/12}, {target = "yuoki-archaeology-wash", type = "var", multiplier = -3.5/12}})

--N4
repltech_item_table({
	replsub_item("y-res1", {target = "ore", type = "var", multiplier = 3}),
	replsub_recipe("y-crush-unicomp-raw-recipe")
	}, "exotic", nil, {localized_name = {"technology-name.repl-unicomp-ore"}, tier = 1})
repltech_recipe("y-smelt-crush-res1-recipe", "exotic", {localized_name = {"technology-name."..gprefix.."repl-unicomp-refined"}, tier = 2, research_multiplier = 0.5})
repltech_recipe("y-unicomp-raw-recipe", "exotic", {localized_name = {"technology-name."..gprefix.."repl-unicomp-shaped"}, tier = 2})

--Fuelnium
repltech_item_table({
	replsub_item("y-res2", {target = "ore", type = "var", multiplier = 4}),
	replsub_recipe("y-crush-fuel-raw-recipe")
	}, "exotic", nil, {localized_name = {"technology-name."..gprefix.."repl-yfuel-ore"}, tier = 1})
repltech_recipe("y-smelt-crush-res2-recipe", "exotic", {localized_name = {"technology-name."..gprefix.."repl-yfuel-refined"}, tier = 2, research_multiplier = 0.5})
repltech_recipe("y-raw-fuelnium-recipe", "exotic", {localized_name = {"technology-name."..gprefix.."repl-yfuel-shaped"}, tier = 2})

--Mixed
repltech_recipe("y-mixing-rich-recipe", "exotic", {localized_name = {"technology-name."..gprefix.."repl-mixed-refined"}, tier = 2, research_multiplier = 0.5})
repltech_recipe("y-press-richdust-recipe", "exotic", {localized_name = {"technology-name."..gprefix.."repl-mixed-shaped"}, tier = 2})
repltech_recipe("y-orange-stuff_recipe", "exotic", {localized_name = {"technology-name."..gprefix.."repl-mixed-other"}, tier = 2})
repltech_recipe("y-infused-uca2-recipe", "exotic", {tier = 3})

--Advanced
repltech_recipe("y-crystal-cnd-recipe", "exotic", {tier = 3})
repltech_recipe("y-quantrinum-recipe", "exotic", {tier = 3})
repltech_recipe("y_quantrinum_infusion_recipe", "exotic", {tier = 4})

--Artifacts
--If would make no sense to replicate something as common as dirt, so instead its cost is a variable
--If the mod tries to refrerence the cost of an item which cannot be replicated but there also exists a replication variable with the same name as that item then the variable is used instead
replvar("y-dirt", "y-digfdirt-recipe")
repltech_item("y-crystal2", "alien", {target = "y-wash-dirt-recipe", type = "recipe-noproduct"}, nil, {tier = 2})
repltech_recipe("y_data_crystal_recipe", "alien", {tier = 4})

--Machine parts
repltech_recipe("y-conductive-wire-1_recipe", "alloy", {internal_name = "y-conductive-wire"})
repltech_recipe("y-conductive-coil-1-recipe", "alloy", {internal_name = "y-conductive-coil"})
repltech_recipe("y_dotzetron_recipe", "alloy")
repltech_recipe("y_chip_plate_recipe", "device3")
repltech_recipe("y-chip1-recipe", "device3", {internal_name = "y-chip-a"})
repltech_recipe("y-chip2-recipe", "device4", {internal_name = "y-chip-b"})

replvar("y-battery-single-use1", "y-battery-singleuse1-recipe")
repltech_item("y-battery-single-use2", "device2", {target = "y-battery-singleuse2-recipe", type = "recipe"}, {target = "y-battery-singleuse1-recipe", type = "recipe"}, {localized_name = {"technology-name."..gprefix.."repl-ybattery"}, internal_name = gprefix.."y-battery-b"})
repltech_recipe("y-battery-single-use3-recipe", "device3", {internal_name = gprefix.."y-battery-c"})

repltech_recipe("y_blocked_capa_recipe", "device3")
repltech_recipe("yi_magnetron_recipe", "device3")
repltech_recipe("y-basic-st1-mf-recipe", "device3")

repltech_recipe("y-heat-pipe-recipe", "device2")
repltech_recipe("y-bluegear-recipe", "device3")
repltech_recipe("y_structure_element_recipe", "device3")
repltech_recipe("y_structure_vessel_recipe", "device3")
repltech_recipe("y_structure_electric_recipe", "device3")
repltech_recipe("y-basic-st2-mf-recipe", "device4")

--Poles
repltech_recipe("y_signal_pole_recipe", "device3")
repltech_recipe("y-substation-m-recipe", "device4")
repltech_recipe("y-substation-h-recipe", "device5")

--Solar generators
repltech_recipe("y-solar-dish-recipe", "device4")
repltech_recipe("y_alien_solar_recipe", "device4")
repltech_recipe("y_alien_solar2_recipe", "device5")

--Accumulators
repltech_item_table({replsub_recipe("y-accumulator-m-recipe"), replsub_recipe("y-accumulator-b-recipe")}, "device4", "y-accumulator-b-recipe", {localized_name = {"technology-name."..gprefix.."repl-quant-accum"}})
repltech_item_table({replsub_recipe("y-accumulator-mt2-recipe"), replsub_recipe("y-accumulator-bt2-recipe")}, "device4", "y-accumulator-b-recipe", {localized_name = {"technology-name."..gprefix.."repl-yadvanced-accum"}})
repltech_recipe("y-accumulator-btx-recipe", "device4")
repltech_recipe("y_compensator_25_recipe", "device5")
repltech_recipe("y-accumulator-crystal-m-recipe", "device5")

repltech_recipe("y-ups-flywheel-b-recipe", "device4")

--Robotics
repltech_recipe("yi_construction-robot_recipe", "device5")
repltech_recipe("yi_logistic-robot_recipe", "device5")
repltech_recipe("yi_roboport_recipe", "device5")

--Other
repltech_recipe("y-mining-drill-e2-recipe", "device4")
repltech_recipe("yi_beacon_recipe", "device5")
repltech_recipe("yi_radar_recipe", "device4")

--Walls
repltech_recipe("y-mud-wall-recipe", "device3")
repltech_item_table({replsub_recipe("y-rare-wall-basic-recipe"), replsub_recipe("y-rare-wall-adv-recipe")}, "device4", "y-rare-wall-basic-recipe", {localized_name = {"technology-name."..gprefix.."repl-yadvanced-wall"}})
repltech_recipe("y-wall-forcefield-recipe", "device4")
repltech_recipe("y_wall22_hardic_recipe", "device4")

--Turrets
repltech_item_table({replsub_recipe("y_laser_onhwall_recipe"), replsub_recipe("y_laser_mk1_recipe")}, "device4", "y_laser_onhwall_recipe", {localized_name = {"technology-name."..gprefix.."repl-yadvanced-laser"}})
repltech_item_table({replsub_recipe("y-gun-turret-mk2-recipe"), replsub_recipe("y-gun-turret-mk3-recipe")}, "device4", "y-gun-turret-mk2-recipe", {localized_name = {"technology-name."..gprefix.."repl-yadvanced-turret"}})

--Ammo
repltech_recipe("y-bullet-case-recipe", "alloy")
repltech_recipe("y-ammo-acid-medium-recipe", "device3", {internal_name = gprefix.."y-acid-ammo"})
repltech_recipe("y-ammo-hohlspitz-recipe", "device3")
repltech_recipe("y-ammo-explosiv-recipe", "device3")
repltech_recipe("y-ammo-poison-recipe", "device3")
repltech_recipe("y-ammo-biggun-recipe", "device3")
repltech_recipe("y-ammo-krakon-recipe", "device3")

repltech_recipe("y_ammo_case_recipe", "alloy")
repltech_recipe("y_ammo_plasma_recipe", "device3")
replvar("y-c_mud", {target = "y-dirt", type = "item"})
repltech_recipe("yi_mine_plasma_recipe", "device4")
repltech_recipe("y_ammo_flame_recipe", "device3")
repltech_recipe("yi_mine_impact_recipe", "device4")

repltech_recipe("yi_ammo_energie_recipe", "device4")

--Modules
repltech_recipe("y_modul_blue1-recipe", "module", {internal_name = "y-blue-mod-1", tier = 4})
repltech_recipe("y_modul_blue2-recipe", "module", {internal_name = "y-blue-mod-2"})
repltech_recipe("y_modul_green1_recipe", "module", {internal_name = "y-green-mod-1", tier = 4})
repltech_recipe("y_modul_green2_recipe", "module", {internal_name = "y-green-mod-2"})
repltech_recipe("y-pink-module-1-recipe", "module", {internal_name = "y-pink-mod-1", tier = 4})
repltech_recipe("y-pink-module-2-recipe", "module", {internal_name = "y-pink-mod-2"})
repltech_recipe("y-pink-module-3-recipe", "module", {internal_name = "y-pink-mod-3"})