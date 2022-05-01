--if not mods["miniloader"] then
data:extend({
    {
        type = "recipe",
        name = "ru-medium-loader",
        hidden = "true",
        enabled = "false",
        ingredients =
        {
          {"iron-gear-wheel", 20},
          {"ru-medium-transport-belt", 2},
          {"ru-medium-stack-inserter", 1},
          {"ru-basic-loader", 1},
          {"electronic-circuit", 4}
        },
        result = "ru-medium-loader",
        result_count = 1,
      },
})
--end