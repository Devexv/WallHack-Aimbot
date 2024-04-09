while do true
       wait(5)

local Players = game:GetService("Players")

local function highlightPlayer(player)
  local highlight = Instance.new("Highlight")
  highlight.Parent = player.Character
  highlight.FillColor = Color3.fromRGB(255, 0, 0)
  highlight.OutlineColor = Color3.fromRGB(0, 0, 255)
end

for _, player in ipairs(Players:GetPlayers()) do
  highlightPlayer(player)

local function lockOnToHead(player)
    if player.Character and player.Character:FindFirstChild("Head") then
        local headPosition = player.Character.Head.Position

        game.Workspace.CurrentCamera.CFrame = CFrame.new(headPosition + Vector3.new(0, 5, 0), headPosition)
    end
end

local function findNearestPlayer()
    local nearestDistance = math.huge
    local nearestPlayer = nil

    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character then
            local distance = (player.Character.Head.Position - game.Players.LocalPlayer.Character.Head.Position).magnitude

            if distance < nearestDistance then
                nearestDistance = distance
                nearestPlayer = player
            end
        end
    end

    return nearestPlayer
end

while true do
    local nearestPlayer = findNearestPlayer()

    if nearestPlayer then
        lockOnToHead(nearestPlayer)
    end

    wait(0.1)
end
