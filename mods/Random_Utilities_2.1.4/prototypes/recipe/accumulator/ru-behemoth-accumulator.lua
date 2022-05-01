--if settings.startup["ru-accumulator"].value == true then

--recipes
data:extend(
{
  {
    type = "recipe",
    name = "ru-behemoth-accumulator",
    hidden = "true",
--    hidden = is_Behemoth_accumulator_hidden ,
    enabled = "false",
    ingredients =
    {
      {"ru-big-accumulator", 8},
      {"low-density-structure", 8},
      {"processing-unit", 3},
    },
    result = "ru-behemoth-accumulator",
  },
}
)

--end
