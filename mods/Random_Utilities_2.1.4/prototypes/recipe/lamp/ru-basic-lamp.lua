--if settings.startup["ru-lamp"].value == true then

--Recipe
data:extend(
{
  {
    type = "recipe",
    name = "ru-basic-lamp",
    hidden = "true",
    enabled = "false",
    ingredients =
    {
      {"electronic-circuit", 2},
      {"small-lamp", 1},
      {"iron-plate", 5},
      {"steel-plate", 2},
    },
    result = "ru-basic-lamp"
  },
})

--end
