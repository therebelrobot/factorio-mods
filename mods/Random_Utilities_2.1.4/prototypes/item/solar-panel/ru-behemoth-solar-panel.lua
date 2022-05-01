--if settings.startup["ru-solar-panel"].value == true then

--item
data:extend({
  {
    type = "item",
    name = "ru-behemoth-solar-panel",
    icons = {{icon = "__base__/graphics/icons/solar-panel.png", tint = {r=80, g=80, b=80}}},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "ru-solar-panel",
    order = "d",
    place_result = "ru-behemoth-solar-panel",
    stack_size = 50
  },
})

--end
