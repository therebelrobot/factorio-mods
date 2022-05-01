--if not mods["miniloader"] then
data:extend({
    {
        type = "recipe",
        name = "ru-big-loader",
        hidden = "true",
        enabled = "false",
        ingredients =
        {
          {"iron-gear-wheel", 20},
          {"ru-big-transport-belt", 2},
          {"ru-big-stack-inserter", 1},
          {"ru-medium-loader", 1},
          {"advanced-circuit", 4}
        },
        result = "ru-big-loader",
        result_count = 1,
      },
})
--end