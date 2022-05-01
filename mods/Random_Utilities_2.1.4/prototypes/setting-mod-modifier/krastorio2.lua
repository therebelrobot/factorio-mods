
if mods["Krastorio2"] and settings.startup["ru-krastorio2-integrations"] then
  --medium container storage size
  data.raw.container["kr-medium-container"].inventory_size = settings.startup["ru-Krastorio2-medium-container"].value
  data.raw["logistic-container"]["kr-medium-passive-provider-container"].inventory_size = settings.startup["ru-Krastorio2-medium-logistic-container"].value
  data.raw["logistic-container"]["kr-medium-active-provider-container"].inventory_size = settings.startup["ru-Krastorio2-medium-logistic-container"].value
  data.raw["logistic-container"]["kr-medium-storage-container"].inventory_size = settings.startup["ru-Krastorio2-medium-logistic-container"].value
  data.raw["logistic-container"]["kr-medium-requester-container"].inventory_size = settings.startup["ru-Krastorio2-medium-logistic-container"].value
  data.raw["logistic-container"]["kr-medium-buffer-container"].inventory_size = settings.startup["ru-Krastorio2-medium-logistic-container"].value
  --big container storage size
  data.raw.container["kr-big-container"].inventory_size = settings.startup["ru-Krastorio2-big-container"].value
  data.raw["logistic-container"]["kr-big-passive-provider-container"].inventory_size = settings.startup["ru-Krastorio2-big-logistic-container"].value
  data.raw["logistic-container"]["kr-big-active-provider-container"].inventory_size = settings.startup["ru-Krastorio2-big-logistic-container"].value
  data.raw["logistic-container"]["kr-big-storage-container"].inventory_size = settings.startup["ru-Krastorio2-big-logistic-container"].value
  data.raw["logistic-container"]["kr-big-requester-container"].inventory_size = settings.startup["ru-Krastorio2-big-logistic-container"].value
  data.raw["logistic-container"]["kr-big-buffer-container"].inventory_size = settings.startup["ru-Krastorio2-big-logistic-container"].value
  --medium tank
  data.raw["storage-tank"]["kr-fluid-storage-1"]["fluid_box"].base_area = settings.startup["ru-kr-fluid-storage-1"].value
  --big tank
  data.raw["storage-tank"]["kr-fluid-storage-2"]["fluid_box"].base_area = settings.startup["ru-kr-fluid-storage-2"].value
  --boiler
  table.insert(data.raw.boiler["ru-basic-boiler"].energy_source.fuel_categories, "vehicle-fuel")
  table.insert(data.raw.boiler["ru-medium-boiler"].energy_source.fuel_categories, "vehicle-fuel")
  table.insert(data.raw.boiler["ru-big-boiler"].energy_source.fuel_categories, "vehicle-fuel")
  table.insert(data.raw.boiler["ru-behemoth-boiler"].energy_source.fuel_categories, "vehicle-fuel")
end