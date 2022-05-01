if settings.startup["ru-enable-bob-tweaks"] then

    if mods["Krastorio2"] and mods["bobwarfare"] then

        local grid_lists = {
            "power-armor-equipment-grid-mk3",
            "power-armor-equipment-grid-mk4",
            "power-armor-equipment-grid-mk5",
        }

        for _, grid in pairs(grid_lists) do

            local category_list = {
                "robot-interaction-equipment",
                "universal-equipment",
                "armor",
            }

            for _, category in pairs(category_list) do
                if not (data.raw["equipment-grid"][grid].equipment_categories == category) then
                    table.insert(data.raw["equipment-grid"][grid].equipment_categories, category)
                end
            end
        end
    end

end