require "__Random_Utilities__.prototypes.setting-mod-modifier.armor"
--armor
if mods["space-exploration"] and settings.startup["ru-space-exploration-integrations"].value == true then
  data.raw.armor["se-thruster-suit"].equipment_grid   = "ru-01-equipment-grid"
  data.raw.armor["se-thruster-suit-2"].equipment_grid   = "ru-02-equipment-grid"
  data.raw.armor["se-thruster-suit-3"].equipment_grid   = "ru-03-equipment-grid"
  data.raw.armor["se-thruster-suit-4"].equipment_grid   = "ru-04-equipment-grid"
  if mods["Krastorio2"] then
    --table.insert(data.raw["technology"]["ru-walkable-beacon-upgrade"]["effects"],{type = "unlock-recipe",  recipe = "ru-bob-walkable-big-beacon-2-Recycle"})
    table.insert(data.raw["equipment-grid"]["ru-01-equipment-grid"].equipment_categories,  "universal-equipment")
    table.insert(data.raw["equipment-grid"]["ru-01-equipment-grid"].equipment_categories,  "robot-interaction-equipment")
    table.insert(data.raw["equipment-grid"]["ru-02-equipment-grid"].equipment_categories,  "universal-equipment")
    table.insert(data.raw["equipment-grid"]["ru-02-equipment-grid"].equipment_categories,  "robot-interaction-equipment")
    table.insert(data.raw["equipment-grid"]["ru-03-equipment-grid"].equipment_categories,  "universal-equipment")
    table.insert(data.raw["equipment-grid"]["ru-03-equipment-grid"].equipment_categories,  "robot-interaction-equipment")
    table.insert(data.raw["equipment-grid"]["ru-04-equipment-grid"].equipment_categories,  "universal-equipment")
    table.insert(data.raw["equipment-grid"]["ru-04-equipment-grid"].equipment_categories,  "robot-interaction-equipment")
  end
end


