data:extend({

	{
		type = "technology",
		name = "ru-Infinite-Repairer",
		hidden = "true",
		icons = {{icon = "__base__/graphics/icons/repair-pack.png", tint ={r=80, g=80, b=80}}},
		icon_size = 64,
		effects =
		{
		  {
			type = "unlock-recipe",
			recipe = "ru-Infinite-Repairer"
		  },
		},
		prerequisites = {"automobilism"},
		unit =
		{
		  count = 500,
		  ingredients =
		  {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"chemical-science-pack", 1},
		  },
		  time = 30
		},
		order = "e-c"
	}  
	})