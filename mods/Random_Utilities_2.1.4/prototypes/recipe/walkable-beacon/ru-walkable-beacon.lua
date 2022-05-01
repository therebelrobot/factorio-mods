--Recipe
data:extend(
{
  {
    type = "recipe",
    name = "ru-walkable-beacon",
    hidden = "true",
    enabled = "false",
    ingredients =
    {
      {"beacon", 1},
      {"concrete", 18},
    },
    result = "ru-walkable-beacon"
  },
})
--Recipe
data:extend(
{
  {
    type = "recipe",
    name = "ru-walkable-beacon-Recycle",
    hidden = "true",
    enabled = "false",
    ingredients =
    {
      {"ru-walkable-beacon", 1},
    },
    result = "beacon"
  },
})
