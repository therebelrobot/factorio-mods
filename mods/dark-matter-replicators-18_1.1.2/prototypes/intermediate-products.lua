data:extend({
  {
      type = "recipe",
      name = gprefix.."dark-matter-scoop",
      enabled = "false",
      ingredients = {
        {gprefix..'tenemut', 4},
        {'iron-plate', 1}
      },
      result = gprefix.."dark-matter-scoop"
  },
  {
    type = "tool",
    name = gprefix.."dark-matter-scoop",
    icon = "__dark-matter-replicators-18__/graphics/icons/dark-matter-scoop.png",
	icon_size = 32,
    subgroup = gprefix.."replication-resources",
    order = "a[matter-conduit]-a",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount"
  },
  {
      type = "recipe",
      name = gprefix.."dark-matter-transducer",
      enabled = "false",
      ingredients = {
        {gprefix..'dark-matter-scoop', 4},
        {'steel-plate', 1}
      },
      result = gprefix.."dark-matter-transducer"
  },
  {
    type = "tool",
    name = gprefix.."dark-matter-transducer",
    icon = "__dark-matter-replicators-18__/graphics/icons/dark-matter-transducer.png",
	icon_size = 32,
    subgroup = gprefix.."replication-resources",
    order = "a[matter-conduit]-b",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount"
  },
  {
      type = "recipe",
      name = gprefix.."matter-conduit",
      enabled = "false",
      ingredients = {
        {gprefix..'dark-matter-transducer', 4},
        {gprefix..'dark-matter-scoop', 1}
      },
      result = gprefix.."matter-conduit"
  },
  {
    type = "tool",
    name = gprefix.."matter-conduit",
    icon = "__dark-matter-replicators-18__/graphics/icons/matter-conduit.png",
	icon_size = 32,
    subgroup = gprefix.."replication-resources",
    order = "a[matter-conduit]-c",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount"
  },
})