data:extend({
	{
		type = "bool-setting",
		name = "micro-tech",
		setting_type = "startup",
		default_value = "true",
		order = "a-a"
	},
	{
		type = "bool-setting",
		name = "micro-alt-info",
		order = "a-b",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "int-setting",
		name = "micro-balance-recipe",
		setting_type = "startup",
		default_value = 200,
		allowed_values  = {50, 75, 100, 200, 300, 400, 500},
		order = "b-a"
	},
	{
		type = "bool-setting",
		name = "micro-assembler",
		setting_type = "startup",
		default_value = "true",
		order = "c-a"
	},
	{
		type = "bool-setting",
		name = "micro-furnace",
		setting_type = "startup",
		default_value = "true",
		order = "c-b"
	},
	{
		type = "bool-setting",
		name = "micro-miner",
		setting_type = "startup",
		default_value = "true",
		order = "c-c"
	},
	{
		type = "bool-setting",
		name = "micro-beacon",
		setting_type = "startup",
		default_value = "true",
		order = "c-d"
	},
	{
		type = "bool-setting",
		name = "micro-radar",
		setting_type = "startup",
		default_value = "true",
		order = "c-e"
	},
	--[[{
		type = "bool-setting",
		name = "micro-pumpjack",
		setting_type = "startup",
		default_value = "false",
		order = "c-h"
	},]]--
})