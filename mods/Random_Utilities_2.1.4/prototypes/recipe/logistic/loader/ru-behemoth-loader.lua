--if not mods["miniloader"] then
data:extend({
    {
        type = "recipe",
        name = "ru-behemoth-loader",
        hidden = "true",
        enabled = "false",
        ingredients =
        {
          {"iron-gear-wheel", 20},
          {"ru-behemoth-transport-belt", 2},
          {"ru-behemoth-stack-inserter", 1},
          {"ru-big-loader", 1},
          {"processing-unit", 4}
        },
        result = "ru-behemoth-loader",
        result_count = 1,
      },
})
--end