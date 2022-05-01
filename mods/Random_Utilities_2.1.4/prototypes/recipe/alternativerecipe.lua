

data:extend({

  {
    type = "recipe",
    name = "wood-to-landfill",
    hidden = "true",
    energy_required = 0.5,
    enabled = "false",
    category = "crafting",
    ingredients =
    {
      {"wood", 20}
    },
    result = "landfill",
    result_count = 1
  },
  {
    type = "recipe",
    name = "ru-offshore-pump",
    hidden = "true",
    enabled = "true",
    ingredients =
    {
      {"iron-plate", 5},
      {"copper-plate", 2},
    },
    result = "offshore-pump"
  },
})
