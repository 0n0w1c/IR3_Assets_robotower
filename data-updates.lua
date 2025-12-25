if not (mods["IndustrialRevolution3Assets1"]
        and mods["IndustrialRevolution3Assets2"]
        and mods["IndustrialRevolution3Assets3"]
        and mods["IndustrialRevolution3Assets4"]
    ) then
    return
end

table.insert(data.raw["technology"]["construction-robotics"].effects, { type = "unlock-recipe", recipe = "robotower" })
table.insert(data.raw["technology"]["logistic-robotics"].effects, { type = "unlock-recipe", recipe = "robotower" })
