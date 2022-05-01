--Instantiate global table
micro = {}
if mini then
	micro.mini = mini.tech
end
--List of individual mods
micro.bobs = {}
micro.angels = {}
micro.shinybobs = {}
micro.shinyangels = {}
micro.fxp = {}
micro.elecfurnaces = false
micro.aai = false
micro.fantario = false
micro.krastorio = false
micro.krastorio2 = false
micro.opteratanks = false
micro.industrevolution = false
micro.modmash = false
--List of  micro machine settings
micro.tech = settings.startup["micro-tech"].value
micro.recipeCost = settings.startup["micro-balance-recipe"].value
micro.altInfo = settings.startup["micro-alt-info"].value

--List of enabled micro machines
micro.assembler = settings.startup["micro-assembler"].value
micro.furnace = settings.startup["micro-furnace"].value
micro.miner = settings.startup["micro-miner"].value
micro.beacon = settings.startup["micro-beacon"].value
micro.radar = settings.startup["micro-radar"].value

require('dbug')

--Bobs mods takes priority over most
if bobmods then
	--Enable micro machines if they are enabled in bobassembly
	if bobmods.assembly then
		micro.bobs.assembler = true
		micro.bobs.furnace = settings.startup["bobmods-assembly-furnaces"].value
	end
	--Enable micro machines if they are enabled in bobmicrong
	if bobmods.mining then
		micro.bobs.miner = settings.startup["bobmods-mining-miningdrills"].value
		--micro.bobs.pumpjack = settings.startup["bobmods-mining-pumpjacks"].value
	end
	--Enable mini machines if they are enabled in bobmodules
	if bobmods.modules then
		micro.bobs.beacon = true
	end
	--Enable mini machines if they are enabled in bobwarfare
	if bobmods.warfare then
		micro.bobs.radar = true
	end
end

if mods["Electric Furnaces"] then
	micro.elecfurnaces = true
end

if mods["IndustrialRevolution"] then
	micro.industrevolution = true
end

if mods["Krastorio2"] then
	micro.krastorio2 = true
end

--Factorio Extended Plus has complete compatibility with micro machines.
if factorioextendedplus then
	micro.fxp.enabled = true
	if mods["FactorioExtended-Plus-Machines"] then
		micro.fxp.assembler = true
		micro.fxp.furnace = true
		micro.fxp.miner = true
		micro.fxp.radar = true
	end
	if mods["FactorioExtended-Plus-Module"] then
		micro.fxp.beacon = true
	end
end

if mods["Fantario"] then
	micro.fantario = true
end

if mods["MicroFurnaceWipMod"] then
	micro.furnace = false
end

if mods["modmash"] then
	micro.modmash = true
end









