--if settings.startup["ru-substation"].value == true then

--item
data:extend({
{
  type = "item",
  name = "ru-behemoth-substation",
  icons = {{icon = "__base__/graphics/icons/substation.png", tint = {r=80, g=80, b=80}}},
  icon_size = 64, icon_mipmaps = 4,
  subgroup = "ru-substation",
  order = "d",
  place_result = "ru-behemoth-substation",
  stack_size = 50
},
})

--end
