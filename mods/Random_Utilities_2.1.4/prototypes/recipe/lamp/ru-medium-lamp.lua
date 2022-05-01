--if settings.startup["ru-lamp"].value == true then

--Recipe
data:extend(
{
  {
    type = "recipe",
    name = "ru-medium-lamp",
    hidden = "true",
    enabled = "false",
    ingredients =
    {
      {"electronic-circuit", 4},
      {"ru-basic-lamp", 1},
      {"steel-plate", 4},
    },
    result = "ru-medium-lamp"
  },
})

--end
