local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local CharacterCatalog = require(ReplicatedStorage:WaitForChild("CharacterCatalog"))

local selectCharacterEvent = Instance.new("RemoteEvent")
selectCharacterEvent.Name = "SelectCharacter"
selectCharacterEvent.Parent = ReplicatedStorage

local playerSelections = {}

local function applyCharacterAppearance(character, selection)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then
        return
    end

    local shirt = character:FindFirstChildOfClass("Shirt") or Instance.new("Shirt")
    shirt.ShirtTemplate = selection.shirtTemplate
    shirt.Parent = character

    local pants = character:FindFirstChildOfClass("Pants") or Instance.new("Pants")
    pants.PantsTemplate = selection.pantsTemplate
    pants.Parent = character

    local bodyColors = character:FindFirstChildOfClass("BodyColors") or Instance.new("BodyColors")
    bodyColors.HeadColor3 = selection.bodyColor
    bodyColors.LeftArmColor3 = selection.bodyColor
    bodyColors.RightArmColor3 = selection.bodyColor
    bodyColors.LeftLegColor3 = selection.bodyColor
    bodyColors.RightLegColor3 = selection.bodyColor
    bodyColors.TorsoColor3 = selection.bodyColor
    bodyColors.Parent = character
end

selectCharacterEvent.OnServerEvent:Connect(function(player, characterId)
    local selection = CharacterCatalog.getById(characterId)
    if not selection then
        return
    end

    playerSelections[player.UserId] = selection.id
    if player.Character then
        applyCharacterAppearance(player.Character, selection)
    end
end)

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        local selectedId = playerSelections[player.UserId] or CharacterCatalog[1].id
        local selection = CharacterCatalog.getById(selectedId)
        if selection then
            applyCharacterAppearance(character, selection)
        end
    end)
end)

Players.PlayerRemoving:Connect(function(player)
    playerSelections[player.UserId] = nil
end)
