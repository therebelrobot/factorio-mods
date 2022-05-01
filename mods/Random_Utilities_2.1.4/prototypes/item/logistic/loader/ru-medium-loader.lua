--if not mods["miniloader"] then
data:extend({
    {
        type = "item",
        name = "ru-medium-loader",
        icons = {{icon = "__Random_Utilities__/graphics/icons/loader/loader-1x/loader-icon-base.png", tint = {r=202, g=154, b=152}}},
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "ru-loader-1x",
        order = "b",
        place_result = "ru-medium-loader",
        stack_size = 200
    },
})
--end