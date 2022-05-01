
--Angel Warehouse Size/ pressure tank 
if mods["angelsaddons-storage"] then
	data.raw.container["silo"].inventory_size = settings.startup["ru-angels-silo"].value
	data.raw["logistic-container"]["silo-passive-provider"].inventory_size = settings.startup["ru-angels-logistic-silo"].value
	data.raw["logistic-container"]["silo-active-provider"].inventory_size = settings.startup["ru-angels-logistic-silo"].value
	data.raw["logistic-container"]["silo-storage"].inventory_size = settings.startup["ru-angels-logistic-silo"].value
	data.raw["logistic-container"]["silo-requester"].inventory_size = settings.startup["ru-angels-logistic-silo"].value
	data.raw["logistic-container"]["silo-buffer"].inventory_size = settings.startup["ru-angels-logistic-silo"].value
	data.raw.container["angels-warehouse"].inventory_size = settings.startup["ru-angels-warehouse"].value
	data.raw["logistic-container"]["angels-warehouse-passive-provider"].inventory_size = settings.startup["ru-angels-logistic-warehouse"].value
	data.raw["logistic-container"]["angels-warehouse-active-provider"].inventory_size = settings.startup["ru-angels-logistic-warehouse"].value
	data.raw["logistic-container"]["angels-warehouse-storage"].inventory_size = settings.startup["ru-angels-logistic-warehouse"].value
	data.raw["logistic-container"]["angels-warehouse-requester"].inventory_size = settings.startup["ru-angels-logistic-warehouse"].value
	data.raw["logistic-container"]["angels-warehouse-buffer"].inventory_size = settings.startup["ru-angels-logistic-warehouse"].value
	data.raw["storage-tank"]["angels-storage-tank-3"]["fluid_box"].base_area = settings.startup["ru-angels-storage-tank-3"].value
	data.raw["storage-tank"]["angels-pressure-tank-1"]["fluid_box"].base_area = settings.startup["ru-angels-pressuretank"].value
end

if settings.startup["ru-angel-integrations"] then
	--spidetrontiers compatibility
	if mods["angelsindustries"] and mods["spidertrontiers"] then
		if mods["bobvehicleequipment"] and mods["spidertrontiers"] then
			if not(settings.startup["bobmods-vehicleequipment-enablevehiclegrids"] == nil) then
				local spidertrontiers_grid_list = {
					"spidertron-mk-1-equipment-grid",
					"spidertron-mk0-equipment-grid",
					"spidertron-mk2-equipment-grid",
					"spidertron-mk3-equipment-grid",
					"prototype-spidertron-equipment-grid",
					"assault-spidertron-mk1-equipment-grid",
					"assault-spidertron-mk2-equipment-grid",
					"bulwark-spidertron-mk1-equipment-grid",
					"bulwark-spidertron-mk2-equipment-grid",
					"scout-spidertron-mk1-equipment-grid",
					"scout-spidertron-mk2-equipment-grid",
					"voyage-spidertron-mk1-equipment-grid",
					"voyage-spidertron-mk2-equipment-grid",
				}
				for index,grid in pairs(spidertrontiers_grid_list) do
					data.raw["equipment-grid"][grid].equipment_categories = {"car", "vehicle", "generator"}
				end
			end
		end
	end
end