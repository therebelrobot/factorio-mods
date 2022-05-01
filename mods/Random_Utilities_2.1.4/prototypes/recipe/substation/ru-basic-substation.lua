--if settings.startup["ru-substation"].value == true then

--recipes
data:extend({
{
  type = "recipe",
  name = "ru-basic-substation",
  hidden = "true",
  enabled = "false",
  ingredients =
  {
    {"big-electric-pole", 1},
    {"medium-electric-pole", 2}
  },
  result = "ru-basic-substation",
},
})

--end
