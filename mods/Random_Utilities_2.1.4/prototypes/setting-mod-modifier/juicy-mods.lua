
if mods["Juicy_mods"] 
--and settings.startup["ru-juicy-mods-integrations"] 
then
    
    --big generic chest size
    data.raw.container["k-medium-g"].inventory_size = settings.startup["ru-juicy-mods-big-generic-chest"].value
    data.raw["logistic-container"]["k-medium-pp"].inventory_size = settings.startup["ru-juicy-mods-big-logistic-chest"].value
    data.raw["logistic-container"]["k-medium-s"].inventory_size = settings.startup["ru-juicy-mods-big-logistic-chest"].value
    data.raw["logistic-container"]["k-medium-ap"].inventory_size = settings.startup["ru-juicy-mods-big-logistic-chest"].value
    data.raw["logistic-container"]["k-medium-b"].inventory_size = settings.startup["ru-juicy-mods-big-logistic-chest"].value
    data.raw["logistic-container"]["k-medium-r"].inventory_size = settings.startup["ru-juicy-mods-big-logistic-chest"].value
    --big container storage size
    data.raw.container["k-big-g"].inventory_size = settings.startup["ru-juicy-mods-generic-warehoude"].value
    data.raw["logistic-container"]["k-big-pp"].inventory_size = settings.startup["ru-juicy-mods-logistic-warehoude"].value
    data.raw["logistic-container"]["k-big-s"].inventory_size = settings.startup["ru-juicy-mods-logistic-warehoude"].value
    data.raw["logistic-container"]["k-big-ap"].inventory_size = settings.startup["ru-juicy-mods-logistic-warehoude"].value
    data.raw["logistic-container"]["k-big-b"].inventory_size = settings.startup["ru-juicy-mods-logistic-warehoude"].value
    data.raw["logistic-container"]["k-big-r"].inventory_size = settings.startup["ru-juicy-mods-logistic-warehoude"].value
    --fs 50
    --data.raw["storage-tank"]["fs-50"]["fluid_box"].base_area = settings.startup["ru-juicy-mods-fs-50"].value
    --fs 200
    --data.raw["storage-tank"]["fs-200"]["fluid_box"].base_area = settings.startup["ru-juicy-mods-fs-200"].value
end