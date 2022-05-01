--if settings.startup["ru-lamp"].value == true then

-- Item
data:extend({
  {
    type = "item",
    name = "ru-big-lamp",
    icons = {{icon = "__base__/graphics/icons/small-lamp.png", tint = {r=132, g=180, b=181}}},
    -- flags = {"goes-to-quickbar"},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "ru-lamp",
    order = "c",
    place_result = "ru-big-lamp",
    stack_size = 50
  },
})

--end
