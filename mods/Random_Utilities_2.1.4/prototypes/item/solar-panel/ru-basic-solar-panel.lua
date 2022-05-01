--if settings.startup["ru-solar-panel"].value == true then

--item
data:extend({
  {
    type = "item",
    name = "ru-basic-solar-panel",
    icons = {{icon = "__base__/graphics/icons/solar-panel.png", tint = {r=178, g=173, b=100}}},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "ru-solar-panel",
    order = "a",
    place_result = "ru-basic-solar-panel",
    stack_size = 50
  },
})

--end
