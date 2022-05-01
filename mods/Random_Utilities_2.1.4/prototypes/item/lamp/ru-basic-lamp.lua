--if settings.startup["ru-lamp"].value == true then

-- Item
data:extend({
  {
    type = "item",
    name = "ru-basic-lamp",
    icons = {{icon = "__base__/graphics/icons/small-lamp.png", tint = {r=178, g=173, b=100}}},
    -- flags = {"goes-to-quickbar"},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "ru-lamp",
    order = "a",
    place_result = "ru-basic-lamp",
    stack_size = 50
  },
})

--end
