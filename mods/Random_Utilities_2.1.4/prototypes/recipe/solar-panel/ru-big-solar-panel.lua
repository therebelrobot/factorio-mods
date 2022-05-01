--if settings.startup["ru-solar-panel"].value == true then

--recipes
data:extend(
{
  {
    type = "recipe",
    name = "ru-big-solar-panel",
    hidden = "true",
    enabled = "false",
    ingredients =
    {
      {"ru-medium-solar-panel", 8},
      {"low-density-structure", 8},
      {"processing-unit", 3},
    },
    result = "ru-big-solar-panel",
  },
}
)

--end
