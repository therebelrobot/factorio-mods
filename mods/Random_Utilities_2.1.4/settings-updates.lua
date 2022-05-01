if mods["angelsindustries"] then
  data.raw["bool-setting"]["ru-angel-integrations"].hidden = false
end

if mods["angelsaddons-storage"] then
  data.raw["int-setting"]["ru-angels-warehouse"].hidden = false
  data.raw["int-setting"]["ru-angels-silo"].hidden = false
  data.raw["int-setting"]["ru-angels-logistic-warehouse"].hidden = false
  data.raw["int-setting"]["ru-angels-logistic-silo"].hidden = false
  data.raw["int-setting"]["ru-angels-pressuretank"].hidden = false
  data.raw["int-setting"]["ru-angels-storage-tank-3"].hidden = false
end

if mods["Krastorio2"] then
  data.raw["bool-setting"]["ru-krastorio2-integrations"].hidden = false
  data.raw["int-setting"]["ru-Krastorio2-medium-container"].hidden = false
  data.raw["int-setting"]["ru-Krastorio2-medium-logistic-container"].hidden = false
  data.raw["int-setting"]["ru-Krastorio2-big-container"].hidden = false
  data.raw["int-setting"]["ru-Krastorio2-big-logistic-container"].hidden = false
  data.raw["int-setting"]["ru-kr-fluid-storage-1"].hidden = false
  data.raw["int-setting"]["ru-kr-fluid-storage-2"].hidden = false
end

if mods["LiquifyScienceandLab"] then
  data.raw["bool-setting"]["ru-LiquifyScienceandLab-integrations"].hidden = false
end

if mods["space-exploration"] then
  data.raw["bool-setting"]["ru-space-exploration-integrations"].hidden = false
end

if mods["boblibrary"] then
  data.raw["bool-setting"]["ru-bob-integrations"].hidden = false
end

if mods["omnimatter_fluid"] then
  data.raw["bool-setting"]["ru-Machine-liquid-Imput-Output"].hidden = true
  data.raw["bool-setting"]["ru-Assembling-Machine-Imput-Output"].hidden = true
  data.raw["bool-setting"]["ru-Chemical-Plant-Imput-Output"].hidden = true
  data.raw["bool-setting"]["ru-Oil-Refineries-Imput-Output"].hidden = true
end

if mods["Juicy_mods"] then
  data.raw["int-setting"]["ru-juicy-mods-big-generic-chest"].hidden = false
  data.raw["int-setting"]["ru-juicy-mods-big-logistic-chest"].hidden = false
  data.raw["int-setting"]["ru-juicy-mods-generic-warehoude"].hidden = false
  data.raw["int-setting"]["ru-juicy-mods-logistic-warehoude"].hidden = false
  --data.raw["int-setting"]["ru-juicy-mods-fs-50"].hidden = false
  --data.raw["int-setting"]["ru-juicy-mods-fs-200"].hidden = false
end