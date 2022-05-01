

function ru_create_module(module_name, module_icon, module_icon_size, module_icon_mipmaps, module_subgroup, module_category, module_tier, module_order, module_effect, module_beacon_tint, module_art_style, module_requires_beacon_alt_mode)
    --local module_name = {}
    --icon = "__base__/graphics/icons/speed-module.png",
    if module_icon_size == nil then
        module_icon_size = 64
    end
    if module_icon_mipmaps == nil then
        module_icon_mipmaps = 4
    end
    if module_subgroup == nil then
        module_subgroup = "module"
    end
    if module_tier == nil then
        module_tier = 1
    end
    if module_art_style == nil then
        module_art_style = "vanilla"
    end
    if module_requires_beacon_alt_mode == nil then
        module_requires_beacon_alt_mode = false
    end

    return {
        type = "module",
        name = module_name,
        icon = module_icon,
        icon_size = module_icon_size, 
        icon_mipmaps = module_icon_mipmaps,
        subgroup = module_subgroup,
        category = module_category,
        tier = module_tier,
        order = module_order,
        stack_size = 50,
        effect = module_effect,
        --{ speed = {bonus = 0.2}, consumption = {bonus = 0.5}}
        beacon_tint = module_beacon_tint,
        --{
        --  primary = {r = 0.441, g = 0.714, b = 1.000, a = 1.000}, -- #70b6ffff
        --  secondary = {r = 0.388, g = 0.976, b = 1.000, a = 1.000}, -- #63f8ffff
        --},
        art_style = module_art_style,
        requires_beacon_alt_mode = module_requires_beacon_alt_mode
    }

end

ru_create_module = {
    module_name = "ru-basic-speed-module",
    module_icon = "",
    module_subgroup = "ru-module",
    module_category = "",
    module_order = "",
    module_effect = {
        speed = {bonus = 0.5},
        consumption = {bonus = 0.5}
    },
    module_beacon_tint = "",
}