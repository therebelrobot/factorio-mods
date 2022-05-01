--if not mods["miniloader"] then
data:extend({
    {
        type = "item",
        name = "ru-big-loader",
        icons = {{icon = "__Random_Utilities__/graphics/icons/loader/loader-1x/loader-icon-base.png", tint = {r=132, g=180, b=181}}},
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "ru-loader-1x",
        order = "c",
        place_result = "ru-big-loader",
        stack_size = 200
    },
})
--end