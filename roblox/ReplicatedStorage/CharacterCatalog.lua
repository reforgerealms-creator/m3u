local CharacterCatalog = {
    {
        id = "Warrior",
        displayName = "Guerrero",
        description = "Alta vida y daño cuerpo a cuerpo.",
        shirtTemplate = "rbxassetid://144076760",
        pantsTemplate = "rbxassetid://144076760",
        bodyColor = Color3.fromRGB(205, 140, 85),
    },
    {
        id = "Mage",
        displayName = "Mago",
        description = "Ataques a distancia con magia.",
        shirtTemplate = "rbxassetid://144076436",
        pantsTemplate = "rbxassetid://144076436",
        bodyColor = Color3.fromRGB(140, 110, 255),
    },
    {
        id = "Ninja",
        displayName = "Ninja",
        description = "Rápido y sigiloso.",
        shirtTemplate = "rbxassetid://271164392",
        pantsTemplate = "rbxassetid://271164392",
        bodyColor = Color3.fromRGB(70, 70, 70),
    },
}

function CharacterCatalog.getById(id)
    for _, option in ipairs(CharacterCatalog) do
        if option.id == id then
            return option
        end
    end

    return nil
end

return CharacterCatalog
