--if settings.startup["ru-solar-panel"].value == true then

--item
data:extend({
  {
    type = "item",
    name = "ru-medium-solar-panel",
    icons = {{icon = "__base__/graphics/icons/solar-panel.png", tint = {r=202, g=154, b=152}}},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "ru-solar-panel",
    order = "b",
    place_result = "ru-medium-solar-panel",
    stack_size = 50
  },
})

--end
