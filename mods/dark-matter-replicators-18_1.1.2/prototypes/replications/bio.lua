--Bio Industries
replvar("biofarm-mod-smelting", 1/3) --Cokery
replvar("biofarm-mod-crushing", 5/27) --Stone crusher

--Energy
repltech_recipe("bi_bio_Solar_Farm", "device4")
repltech_recipe("bi_solar_mat", "device4")
repltech_recipe("bi_accumulator", "device4")
repladd_recipe("small-electric-pole", "bi-big-wooden-pole")

--Bio cannon ammo (if it exists)
if BI.Settings.Bio_Cannon then
	repltech_recipe("Bio_Cannon_Basic_Ammo", "device4")
	repltech_recipe("Bio_Cannon_Poison_Ammo", "device4")
end

--Materials
repladd_recipe("stone", "bi-crushed-stone")
replvar("raw-wood", {target = "wood", type = "item", multiplier = 2})
repladd_recipe("wood", "bi-woodpulp")
repltech_item("bi-ash", "ore", "bi-ash", "wood")
repltech_item("liquid-air", "ore", "bi-liquid-air")
repltech_element(7, "nitrogen", {replsub_recipe("bi-nitrogen")}, "liquid-air")

--Garden
--[[
repltech_recipe("bi-Bio_Garden", "life")
repltech_recipe("bi-fertiliser", "chemical")
repltech_recipe("bi-adv-fertiliser", "chemical")
--]]
repltech_recipe("bi-Bio_Garden", "life")
repltech_recipe("bi-fertiliser-1", "chemical")
repltech_recipe("bi-adv-fertiliser-2", "chemical")

--Other
repltech_item("seedling", "life", 20)
repltech_recipe("bi-wooden-fence", "shape")
repltech_recipe("bi-coke-coal", "ore")
--[[
if repl_table["006-carbon"] then
	repl_table["006-carbon"].prerequisites[1].target = "bi-coke-coal"
	repl_table["006-carbon"].prerequisites[1].type = "item"
end
]]