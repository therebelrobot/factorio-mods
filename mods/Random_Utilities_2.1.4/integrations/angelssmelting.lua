-- modify multi fluid recipes to not be crafted in assembling machines

local liquid_recipes = {
    ['concrete-mixture-1'] = true,
    ['concrete-mixture-2'] = true,
}

for k, v in pairs (data.raw.recipe) do
    -- statements
    if liquid_recipes[k] then
        log(k)
        data.raw.recipe[k].category = 'chemistry'
    end
end

-- add multi pipe machines to black list

appmod.blacklist['washing-plant'] = true
appmod.blacklist['washing-plant-2'] = true
appmod.blacklist['barreling-pump'] = true

appmod.blacklist['casting-machine'] = true
appmod.blacklist['casting-machine-2'] = true
appmod.blacklist['casting-machine-3'] = true
appmod.blacklist['casting-machine-4'] = true
appmod.blacklist['strand-casting-machine'] = true
appmod.blacklist['strand-casting-machine-2'] = true
appmod.blacklist['strand-casting-machine-3'] = true
appmod.blacklist['strand-casting-machine-4'] = true
