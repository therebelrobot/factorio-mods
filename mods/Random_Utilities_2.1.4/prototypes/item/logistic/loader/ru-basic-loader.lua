--if not mods["miniloader"] then
data:extend({
    {
        type = "item",
        name = "ru-basic-loader",
        icons = {{icon = "__Random_Utilities__/graphics/icons/loader/loader-1x/loader-icon-base.png", tint = {r=178, g=173, b=100}}},
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "ru-loader-1x",
        order = "a",
        place_result = "ru-basic-loader",
        stack_size = 200
    },
})
--end