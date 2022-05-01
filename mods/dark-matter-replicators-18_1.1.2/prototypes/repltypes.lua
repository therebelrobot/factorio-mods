repltypes = {
	ore = {name = "ore", tier = 1, order = 'aa'}, --Semi-Random
	--Uusally one tech per item, mainly used for directly mineable ores and for directly pumpable fluids, tech image shows item
	
	element = {name = "element", tier = 2, research_multiplier = 0.5, order = 'ba'}, --Pure Element
	--One tech per used element, tech image is a periodic square containing a Bohr model
	
	shape = {name = "shape", tier = 2, order = 'bb'}, --Shaped Object
	--One tech per homogeneous semi-random or pure element substance that is shaped into items, tech image shows one or (preferably) more items
	
	alloy = {name = "alloy", tier = 3, order = 'bc'}, --Alloy & Shape
	--One tech per alloy, contains all items made entirely from said alloy
	
	chemical = {name = "chemical", tier = 3, order = 'bd'}, --Chemical & Shape
	--One tech per chemical, contains all items made entirely from said alloy
	
	device2 = {name = "device2", tier = 2, order = 'ca'}, --Very Simple
	device3 = {name = "device3", tier = 3, order = 'cb'}, --Simple
	device4 = {name = "device4", tier = 4, order = 'cc'}, --Complex
	device5 = {name = "device5", tier = 5, order = 'cd'}, --Very Complex
	--One tech per item or group of very similar items
	
	life = {name = "life", tier = 5, order = 'ea'}, --Living Thing
	--One tech per item, no image guidelines
	
	module = {name = "module", tier = 5, order = 'eb', upgrade = true}, --Module (sorting and border category only)
	--One tech per item
	--Unique in that technologies which unlock modules default to being upgrades; this should be set to false for the -1 modules
	--The tier should be overridden to 4 for -1 modules
	
	exotic = {name = "exotic", order = 'ec'}, --Exotic Matter (sorting and border category only)
	--Substances that cannot be categorized by normal matter, use guidelines for the closest real category
	
	magic = {name = "magic", order = 'ed'}, --Fantasy Material (sorting and border category only)
	--Supernatural substances originating from mythology, use guidelines for the closest real category
	
	alien = {name = "alien", order = 'ee'}, --??? (sorting and border category only)
	--Substances of alien origin, use guidelines for the closest real category
	
	science = {name = "science", order = 'ef'}, --Science Pack (related techs must include manual tier and rep values)
	--One tech per pack, no image guidelines
}