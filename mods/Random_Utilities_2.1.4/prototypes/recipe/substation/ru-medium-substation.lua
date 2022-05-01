--if settings.startup["ru-substation"].value == true then

--recipes
data:extend({
{
  type = "recipe",
  name = "ru-medium-substation",
  hidden = "true",
  enabled = "false",
  ingredients =
  {
    {"big-electric-pole", 4},
    {"medium-electric-pole", 10},
    {"ru-basic-substation", 2}
  },
  result = "ru-medium-substation",
},
})

--end
