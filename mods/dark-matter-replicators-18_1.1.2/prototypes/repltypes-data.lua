--Create item groups and subgroups for replication-related things, the replicators and their materials
data:extend({
	{
		type = "item-group",
		name = gprefix.."replication",
		icon = "__dark-matter-replicators-18__/graphics/icons/category-replicators.png",
		icon_size = 128,
		inventory_order = "g",
		order = "e"
	},
	{
		type = 'item-subgroup',
		name = gprefix..'replication-resources',
		group = gprefix..'replication',
		order = 'eb',
	},
	{
		type = 'item-subgroup',
		name = gprefix..'replicators',
		group = gprefix..'replication',
		order = 'ec'
	}
})

local repltype_data = {}
for name,repltype in pairs(repltypes) do
	--Also log whether or not each repltype is enabled
	repltype.enabled = settings.startup["repltype-"..name].value
	--Create an item subgroup for each enabled repltype
	if repltype.enabled then
		repltype_data[#repltype_data + 1] = {
			type = "item-subgroup",
			name = gprefix.."replication-recipes-"..name,
			group = gprefix.."replication",
			order = "ed-"..repltype.order,
		}
	end
end
data:extend(repltype_data)