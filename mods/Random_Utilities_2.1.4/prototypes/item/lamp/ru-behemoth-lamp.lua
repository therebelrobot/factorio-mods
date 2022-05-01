--if settings.startup["ru-lamp"].value == true then

-- Item
data:extend({
  {
    type = "item",
    name = "ru-behemoth-lamp",
    icons = {{icon = "__base__/graphics/icons/small-lamp.png", tint = {r=80, g=80, b=80}}},
    -- flags = {"goes-to-quickbar"},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "ru-lamp",
    order = "c",
    place_result = "ru-behemoth-lamp",
    stack_size = 50
  },
})

--end
