--if settings.startup["ru-substation"].value == true then

--recipes
data:extend({
{
  type = "recipe",
  name = "ru-big-substation",
  hidden = "true",
  enabled = "false",
  ingredients =
  {
    {"big-electric-pole", 4},
    {"medium-electric-pole", 10},
    {"ru-medium-substation", 2}
  },
  result = "ru-big-substation",
},
})

--end
