if settings.startup["ru-LiquifyScienceandLab-integrations"] then

    -- apm power
    if mods["LiquifyScienceandLab"] and mods["apm-power-notnotmelon"] then
        local lab = data.raw.lab["big-lab"]
        table.insert(lab.inputs, "apm_industrial_science_pack")
        table.insert(lab.inputs, "apm_steam_science_pack")
    end

    -- krastorio 2
    if mods["LiquifyScienceandLab"] and mods["Krastorio2"] then
        local lab = data.raw.lab["big-lab"]
        table.insert(lab.inputs, "basic-tech-card")
        table.insert(lab.inputs, "matter-tech-card")
        table.insert(lab.inputs, "advanced-tech-card")
        table.insert(lab.inputs, "singularity-tech-card")
    end

end