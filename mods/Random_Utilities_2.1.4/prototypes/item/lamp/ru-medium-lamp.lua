--if settings.startup["ru-lamp"].value == true then

-- Item
data:extend({
  {
    type = "item",
    name = "ru-medium-lamp",
    icons = {{icon = "__base__/graphics/icons/small-lamp.png", tint = {r=202, g=154, b=152}}},
    -- flags = {"goes-to-quickbar"},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "ru-lamp",
    order = "b",
    place_result = "ru-medium-lamp",
    stack_size = 50
  },
})

--end
