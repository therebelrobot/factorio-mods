--if settings.startup["ru-solar-panel"].value == true then

--recipes
data:extend(
{
  {
    type = "recipe",
    name = "ru-behemoth-solar-panel",
    hidden = "true",
    enabled = "false",
    ingredients =
    {
      {"ru-big-solar-panel", 8},
      {"low-density-structure", 8},
      {"processing-unit", 3},
    },
    result = "ru-behemoth-solar-panel",
  },
}
)

--end
