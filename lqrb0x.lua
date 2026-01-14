local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local targetName = "lqrb0x"
local adminPlayer = nil
local chaosEnabled = true

local function findAdmin()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name == targetName then
            adminPlayer = player
            return true
        end
    end
    return false
end

local function protectAdmin()
    if not adminPlayer then return end
    
    spawn(function()
        while adminPlayer and adminPlayer.Parent do
            if adminPlayer.Character then
                local humanoid = adminPlayer.Character:FindFirstChildWhichIsA("Humanoid")
                if humanoid then
                    humanoid.MaxHealth = math.huge
                    humanoid.Health = math.huge
                    humanoid.WalkSpeed = 50
                    humanoid.JumpPower = 100
                    
                    local forceField = Instance.new("ForceField")
                    forceField.Visible = false
                    forceField.Parent = adminPlayer.Character
                    
                    for _, part in ipairs(adminPlayer.Character:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.BrickColor = BrickColor.new("Bright yellow")
                            part.Material = Enum.Material.Neon
                            
                            local light = Instance.new("PointLight")
                            light.Brightness = 10
                            light.Range = 30
                            light.Color = Color3.new(1, 1, 0)
                            light.Parent = part
                        end
                    end
                    
                    local head = adminPlayer.Character:FindFirstChild("Head")
                    if head then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Size = UDim2.new(0, 300, 0, 100)
                        billboard.StudsOffset = Vector3.new(0, 5, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = head
                        
                        local label = Instance.new("TextLabel")
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.BackgroundTransparency = 1
                        label.Text = "👑 LQRB0X - GOD MODE 👑"
                        label.TextColor3 = Color3.new(1, 1, 0)
                        label.Font = Enum.Font.GothamBlack
                        label.TextSize = 20
                        label.Parent = billboard
                    end
                end
            end
            wait(0.5)
        end
    end)
end

local function applyChaosToPlayer(player)
    if player == adminPlayer then return end
    
    spawn(function()
        while player and player.Parent do
            if player.Character then
                local char = player.Character
                
                for _, part in ipairs(char:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.BrickColor = BrickColor.new("Bright red")
                        part.Material = Enum.Material.Neon
                        
                        local fire = Instance.new("Fire")
                        fire.Size = 10
                        fire.Heat = 20
                        fire.Parent = part
                        
                        local sparkles = Instance.new("Sparkles")
                        sparkles.SparkleColor = Color3.new(1, 0, 0)
                        sparkles.Parent = part
                    end
                end
                
                local humanoid = char:FindFirstChildWhichIsA("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = 0
                    humanoid.JumpPower = 0
                    humanoid.MaxHealth = 5
                    humanoid.Health = 1
                end
                
                local head = char:FindFirstChild("Head")
                if head then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Size = UDim2.new(0, 200, 0, 80)
                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                    billboard.AlwaysOnTop = true
                    billboard.Parent = head
                    
                    local label = Instance.new("TextLabel")
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.BackgroundTransparency = 1
                    label.Text = "CHAOS BY LQRB0X"
                    label.TextColor3 = Color3.new(1, 0, 0)
                    label.Font = Enum.Font.GothamBlack
                    label.TextSize = 16
                    label.Parent = billboard
                end
                
                if adminPlayer and adminPlayer.Character then
                    local adminHrp = adminPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local playerHrp = char:FindFirstChild("HumanoidRootPart")
                    
                    if adminHrp and playerHrp then
                        playerHrp.CFrame = adminHrp.CFrame + Vector3.new(
                            math.random(-15, 15),
                            0,
                            math.random(-15, 15)
                        )
                    end
                end
            end
            wait(0.1)
        end
    end)
end

local function createExplosions()
    while chaosEnabled do
        if adminPlayer and adminPlayer.Character then
            local adminHrp = adminPlayer.Character:FindFirstChild("HumanoidRootPart")
            if adminHrp then
                for i = 1, 10 do
                    local explosion = Instance.new("Explosion")
                    explosion.Position = adminHrp.Position + Vector3.new(
                        math.random(-20, 20),
                        math.random(0, 10),
                        math.random(-20, 20)
                    )
                    explosion.BlastRadius = 15
                    explosion.Parent = Workspace
                end
            end
        end
        wait(0.3)
    end
end

local function changeSkybox()
    local skyboxIds = {264909758, 5772456607, 2529729649}
    
    while chaosEnabled do
        local sky = Instance.new("Sky")
        for _, face in ipairs({"SkyboxBk", "SkyboxDn", "SkyboxFt", "SkyboxLf", "SkyboxRt", "SkyboxUp"}) do
            sky[face] = "rbxassetid://" .. skyboxIds[math.random(1, #skyboxIds)]
        end
        sky.Parent = Lighting
        wait(1)
        if sky then sky:Destroy() end
    end
end

local function spamDecals()
    while chaosEnabled do
        for _, part in ipairs(Workspace:GetChildren()) do
            if part:IsA("BasePart") and math.random(1, 5) == 1 then
                local decal = Instance.new("Decal")
                decal.Face = Enum.NormalId[{"Top", "Bottom", "Left", "Right", "Front", "Back"}[math.random(1, 6)]]
                decal.Texture = "rbxassetid://" .. math.random(1000000, 9999999)
                decal.Parent = part
                game:GetService("Debris"):AddItem(decal, 2)
            end
        end
        wait(0.2)
    end
end

local function crazyLighting()
    while chaosEnabled do
        Lighting.Ambient = Color3.new(math.random(), math.random(), math.random())
        Lighting.Brightness = math.random(5, 15)
        Lighting.FogColor = Color3.new(math.random(), math.random(), math.random())
        wait(0.1)
    end
end

local function screenEffects()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= adminPlayer then
            local gui = player:FindFirstChild("PlayerGui")
            if gui then
                local screenGui = Instance.new("ScreenGui")
                screenGui.Name = "ChaosScreen"
                screenGui.ResetOnSpawn = false
                
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 1, 0)
                frame.BackgroundColor3 = Color3.new(1, 0, 0)
                frame.BackgroundTransparency = 0.5
                frame.Parent = screenGui
                
                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(1, 0, 0.1, 0)
                label.Position = UDim2.new(0, 0, 0.45, 0)
                label.BackgroundTransparency = 1
                label.Text = "CHAOS BY LQRB0X"
                label.TextColor3 = Color3.new(1, 1, 1)
                label.Font = Enum.Font.GothamBlack
                label.TextSize = 24
                label.Parent = screenGui
                
                screenGui.Parent = gui
            end
        end
    end
end

local function chatSpam()
    while chaosEnabled do
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= adminPlayer then
                local gui = player:FindFirstChild("PlayerGui")
                if gui then
                    local message = Instance.new("Message")
                    message.Text = "LQRB0X OWNS YOU"
                    message.Parent = gui
                    game:GetService("Debris"):AddItem(message, 1)
                end
            end
        end
        wait(0.5)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player.Name == targetName then
        adminPlayer = player
        protectAdmin()
    else
        wait(1)
        applyChaosToPlayer(player)
    end
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player.Name == targetName then
        adminPlayer = player
        protectAdmin()
    else
        applyChaosToPlayer(player)
    end
end

wait(2)

spawn(createExplosions)
spawn(changeSkybox)
spawn(spamDecals)
spawn(crazyLighting)
spawn(screenEffects)
spawn(chatSpam)

print("CHAOS MODE ACTIVATED")
print("Admin: lqrb0x (Protected)")
print("Others: Chaos Applied")

while true do
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= adminPlayer then
            applyChaosToPlayer(player)
        end
    end
    wait(0.5)
end
