--if settings.startup["ru-substation"].value == true then

--item
data:extend({
{
  type = "item",
  name = "ru-big-substation",
  icons = {{icon = "__base__/graphics/icons/substation.png", tint = {r=132, g=180, b=181}}},
  icon_size = 64, icon_mipmaps = 4,
  subgroup = "ru-substation",
  order = "c",
  place_result = "ru-big-substation",
  stack_size = 50
},
})

--end
