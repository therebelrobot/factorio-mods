--if settings.startup["ru-substation"].value == true then

--item
data:extend({
{
  type = "item",
  name = "ru-medium-substation",
  icons = {{icon = "__base__/graphics/icons/substation.png", tint = {r=202, g=154, b=152}}},
  icon_size = 64, icon_mipmaps = 4,
  subgroup = "ru-substation",
  order = "b",
  place_result = "ru-medium-substation",
  stack_size = 50
},
})

--end
