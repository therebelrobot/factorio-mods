if settings.startup["ru-No-Crafting-Time"].value then
    local function get_recipe(name)
      local items = data.raw["recipe"]
        if recipes then
          return recipes[name]
        end
      return nil
    end
    
    local function modify_energy(name, recipe)
     if recipe.normal or recipe.expensive then
        if recipe.normal then
           data.raw["recipe"][recipe.name].normal.energy_required = 0.0011
        end
        if recipe.expensive then
           data.raw["recipe"][recipe.name].expensive.energy_required = 0.0011
        end
     else
        data.raw["recipe"][recipe.name].energy_required = 0.0011
      end
    end
    
    local function get_zero(name, recipe)
      local existing_item = get_recipe(name)
      return modify_energy(name, recipe)
    end
    
    local function process_recipe(recipe)
      for name,recipe in pairs(recipe) do
          local recipe_item = get_zero(recipe_name, recipe)
        end
    end
    
      process_recipe(data.raw["recipe"])
    end