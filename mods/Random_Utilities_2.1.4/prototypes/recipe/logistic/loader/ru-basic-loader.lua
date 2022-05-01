--if not mods["miniloader"] then
data:extend({
    {
        type = "recipe",
        name = "ru-basic-loader",
        hidden = "true",
        enabled = "false",
        ingredients =
        {
          {"iron-gear-wheel", 20},
          {"ru-basic-transport-belt", 2},
          {"ru-basic-stack-inserter", 1},
          {"electronic-circuit", 4}
        },
        result = "ru-basic-loader",
        result_count = 1,
      },
})
--end