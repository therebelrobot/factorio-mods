--if settings.startup["ru-solar-panel"].value == true then

--item
data:extend({
  {
    type = "item",
    name = "ru-big-solar-panel",
    icons = {{icon = "__base__/graphics/icons/solar-panel.png", tint = {r=132, g=180, b=181}}},
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "ru-solar-panel",
    order = "c",
    place_result = "ru-big-solar-panel",
    stack_size = 50
  },
})

--end
