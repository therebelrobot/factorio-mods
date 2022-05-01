require("defines")
--Generate the checkboxes which allow the user to disable specific replication types
require("prototypes.repltypes")
local repltype_settings = {}
for name,repltype in pairs(repltypes) do
	repltype_settings[#repltype_settings + 1] = {
		name = "repltype-"..name,
		type = "bool-setting",
		localised_name = {"repltype-setting.display", {"repltype-setting."..repltype.name}},
		order = "2-"..string.format("%2d", #repltype_settings + 1),
		setting_type = "startup",
		default_value = true
	}
end
data:extend(repltype_settings)

--These are the other mod settings.  They're fairly straightforward.
data:extend({
	{
		name = "tenemut-near-spawn",
		type = "bool-setting",
		order = "1-1-0",
		setting_type = "startup",
		default_value = true,
	},
	{
		name = "replstats-speed-base",
		type = "double-setting",
		order = "1-1-1",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0.001
	}, {
		name = "replstats-speed-factor",
		type = "double-setting",
		order = "1-1-2",
		setting_type = "startup",
		default_value = 2,
		minimum_value = 0.001
	}, {
		name = "replstats-energy-base",
		type = "double-setting",
		order = "1-2-1",
		setting_type = "startup",
		default_value = 256,
		minimum_value = 0.001
	}, {
		name = "replstats-energy-factor",
		type = "double-setting",
		order = "1-2-2",
		setting_type = "startup",
		default_value = 2.5,
		minimum_value = 0.001
	}, {
		name = "replstats-pollution-base",
		type = "double-setting",
		order = "1-3-1",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0
	}, {
		name = "replstats-pollution-factor",
		type = "double-setting",
		order = "1-3-2",
		setting_type = "startup",
		default_value = 1.75,
		minimum_value = 0
	}, {
		name = "replstats-size-base",
		type = "double-setting",
		order = "1-4-1",
		setting_type = "startup",
		default_value = 2,
		minimum_value = 1
	}, {
		name = "replstats-size-addend",
		type = "double-setting",
		order = "1-4-3",
		setting_type = "startup",
		default_value = 0
	}, {
		name = "replstats-modules-base",
		type = "double-setting",
		order = "1-5-1",
		setting_type = "startup",
		default_value = 1,
		minimum_value = 0
	}, {
		name = "replstats-modules-addend",
		type = "double-setting",
		order = "1-5-3",
		setting_type = "startup",
		default_value = 0.5
	}, {
		name = "replresearch-item-multiplier",
		type = "double-setting",
		order = "3-1-1",
		setting_type = "startup",
		default_value = 25,
		minimum_value = 0.001
	}, {
		name = "replresearch-item-time",
		type = "double-setting",
		order = "3-1-2",
		setting_type = "startup",
		default_value = 5,
		minimum_value = 0.001
	}, {
		name = "replresearch-space-lock",
		type = "int-setting",
		order = "3-2-1",
		setting_type = "startup",
		default_value = 6,
		allowed_values = {1, 2, 3, 4, 5, 6}
	}, {
		name = "replication-penalty",
		type = "double-setting",
		order = "4-1",
		setting_type = "startup",
		default_value = 0.5,
		minimum_value = 0
	}, {
		name = "replication-fluid-quantity",
		type = "int-setting",
		order = "4-2",
		setting_type = "startup",
		default_value = 25,
		minimum_value = 1
	}, {
		name = "replication-in-space",
		type = "bool-setting",
		order = "9-1", --other mod stuff?
		setting_type = "startup",
		default_value = false,
	}

})