--if settings.startup["ru-substation"].value == true then

--item
data:extend({
{
  type = "item",
  name = "ru-basic-substation",
  icons = {{icon = "__base__/graphics/icons/substation.png", tint = {r=178, g=173, b=100}}},
  icon_size = 64, icon_mipmaps = 4,
  subgroup = "ru-substation",
  order = "a",
  place_result = "ru-basic-substation",
  stack_size = 50
},
})

--end
