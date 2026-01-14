local InsertService = game:GetService("InsertService")
local Workspace = game:GetService("Workspace")

local assetId = 10342559018
local cloneName = "LQRB0X_GIANT_CLONE"
local scaleMultiplier = 20

local function createGiantClone()
    local success, result = pcall(function()
        print("Asset yükleniyor: " .. assetId)
        local asset = InsertService:LoadAsset(assetId)
        local originalModel = asset:GetChildren()[1]
        
        if originalModel and originalModel:IsA("Model") then
            print("Model bulundu, klonlanıyor...")
            local giantClone = originalModel:Clone()
            giantClone.Name = cloneName
            
            for _, part in ipairs(giantClone:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Size = part.Size * scaleMultiplier
                    part.BrickColor = BrickColor.new("Bright red")
                    part.Material = Enum.Material.Neon
                    part.Reflectance = 0.8
                    part.Anchored = true
                    part.CanCollide = false
                    
                    local light = Instance.new("PointLight")
                    light.Brightness = 20
                    light.Range = 150
                    light.Color = Color3.new(1, 0, 0)
                    light.Parent = part
                end
            end
            
            local root = giantClone:FindFirstChild("HumanoidRootPart") or giantClone:FindFirstChild("Torso")
            if root then
                root.CFrame = CFrame.new(0, 100, 0)
                print("Klon konumlandırıldı: " .. root.Position)
            end
            
            local head = giantClone:FindFirstChild("Head")
            if head then
                local billboard = Instance.new("BillboardGui")
                billboard.Size = UDim2.new(0, 1200, 0, 400)
                billboard.StudsOffset = Vector3.new(0, 30, 0)
                billboard.AlwaysOnTop = true
                billboard.MaxDistance = 15000
                billboard.Parent = head
                
                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(1, 0, 1, 0)
                label.BackgroundTransparency = 1
                label.Text = "LQRB0X"
                label.TextColor3 = Color3.new(1, 0, 0)
                label.Font = Enum.Font.GothamBlack
                label.TextSize = 120
                label.TextStrokeTransparency = 0
                label.TextStrokeColor3 = Color3.new(1, 1, 1)
                label.TextStrokeThickness = 10
                label.Parent = billboard
            end
            
            giantClone.Parent = Workspace
            print("Dev klon başarıyla oluşturuldu!")
            print("İsim: " .. cloneName)
            print("Boyut Çarpanı: " .. scaleMultiplier .. "x")
            print("Asset ID: " .. assetId)
            
            return giantClone
        else
            warn("Asset yüklenemedi veya model bulunamadı!")
            return nil
        end
    end)
    
    if not success then
        warn("Hata oluştu: " .. tostring(result))
        
        local fallback = Instance.new("Part")
        fallback.Name = cloneName .. "_FALLBACK"
        fallback.Size = Vector3.new(100, 200, 100)
        fallback.Position = Vector3.new(0, 100, 0)
        fallback.BrickColor = BrickColor.new("Bright red")
        fallback.Material = Enum.Material.Neon
        fallback.Anchored = true
        fallback.CanCollide = false
        fallback.Parent = Workspace
        
        local billboard = Instance.new("BillboardGui", fallback)
        billboard.Size = UDim2.new(0, 800, 0, 200)
        billboard.StudsOffset = Vector3.new(0, 120, 0)
        billboard.AlwaysOnTop = true
        
        local label = Instance.new("TextLabel", billboard)
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = "LQRB0X\nID: " .. assetId
        label.TextColor3 = Color3.new(1, 0, 0)
        label.Font = Enum.Font.GothamBlack
        label.TextSize = 60
        label.TextStrokeTransparency = 0
        
        print("Fallback heykel oluşturuldu")
        return fallback
    end
end

wait(3)
createGiantClone()
