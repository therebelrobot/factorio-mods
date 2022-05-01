--if settings.startup["ru-solar-panel"].value == true then

--technologies

data:extend(
{
  {
    type = "technology",
    name = "ru-Advanced-Solar-Energy-d",
    hidden = "true",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/solar-energy.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "ru-behemoth-solar-panel"
      }
    },
    prerequisites = {"ru-Advanced-Solar-Energy-c"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 34
    },
    order = "a-h-c"
  },
}
)

--end
