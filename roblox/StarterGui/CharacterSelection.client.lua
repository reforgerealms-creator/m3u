local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local CharacterCatalog = require(ReplicatedStorage:WaitForChild("CharacterCatalog"))
local selectCharacterEvent = ReplicatedStorage:WaitForChild("SelectCharacter")

local gui = Instance.new("ScreenGui")
gui.Name = "CharacterSelectionGui"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local panel = Instance.new("Frame")
panel.Name = "Panel"
panel.Size = UDim2.fromScale(0.36, 0.6)
panel.Position = UDim2.fromScale(0.32, 0.2)
panel.BackgroundColor3 = Color3.fromRGB(27, 27, 35)
panel.BorderSizePixel = 0
panel.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = panel

local title = Instance.new("TextLabel")
title.Size = UDim2.fromScale(1, 0.18)
title.BackgroundTransparency = 1
title.Text = "Selecciona tu personaje"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Parent = panel

local list = Instance.new("Frame")
list.Size = UDim2.fromScale(0.95, 0.68)
list.Position = UDim2.fromScale(0.025, 0.2)
list.BackgroundTransparency = 1
list.Parent = panel

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 8)
layout.FillDirection = Enum.FillDirection.Vertical
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = list

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.fromScale(0.4, 0.11)
closeButton.Position = UDim2.fromScale(0.3, 0.86)
closeButton.BackgroundColor3 = Color3.fromRGB(56, 160, 81)
closeButton.Text = "Comenzar"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextScaled = true
closeButton.Parent = panel

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

local selectedId = CharacterCatalog[1].id

for order, option in ipairs(CharacterCatalog) do
    local button = Instance.new("TextButton")
    button.LayoutOrder = order
    button.Size = UDim2.new(1, 0, 0, 68)
    button.BackgroundColor3 = Color3.fromRGB(42, 42, 55)
    button.Text = string.format("%s\n%s", option.displayName, option.description)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.Gotham
    button.TextScaled = true
    button.Parent = list

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 8)
    buttonCorner.Parent = button

    button.MouseButton1Click:Connect(function()
        selectedId = option.id

        for _, sibling in ipairs(list:GetChildren()) do
            if sibling:IsA("TextButton") then
                sibling.BackgroundColor3 = Color3.fromRGB(42, 42, 55)
            end
        end

        button.BackgroundColor3 = Color3.fromRGB(78, 102, 216)
    end)
end

closeButton.MouseButton1Click:Connect(function()
    selectCharacterEvent:FireServer(selectedId)
    gui.Enabled = false
end)
