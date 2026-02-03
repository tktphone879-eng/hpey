--====================================
-- HPEY HUB | HACKER LOADING SYSTEM
--====================================

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

pcall(function()
    for _,v in ipairs(CoreGui:GetChildren()) do
        if v.Name == "HPEY_HUB_GUI" then
            v:Destroy()
        end
    end
end)

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "HPEY_HUB_GUI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = CoreGui

-- BG
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.fromScale(1,1)
bg.BackgroundColor3 = Color3.fromRGB(5,5,7)

local grad = Instance.new("UIGradient", bg)
grad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(5,10,8)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20,30,25))
}
grad.Rotation = 45

-- BOX
local box = Instance.new("Frame", bg)
box.Size = UDim2.fromOffset(360,140)
box.Position = UDim2.fromScale(0.5,0.5)
box.AnchorPoint = Vector2.new(0.5,0.5)
box.BackgroundColor3 = Color3.fromRGB(10,15,12)
box.BackgroundTransparency = 0.05
box.BorderSizePixel = 0
Instance.new("UICorner", box).CornerRadius = UDim.new(0,16)

-- TITLE
local title = Instance.new("TextLabel", box)
title.Size = UDim2.fromScale(1,0.35)
title.Position = UDim2.fromScale(0.5,0.05)
title.AnchorPoint = Vector2.new(0.5,0)
title.BackgroundTransparency = 1
title.Text = ""
title.Font = Enum.Font.Code
title.TextSize = 28
title.TextColor3 = Color3.fromRGB(0,255,140)
title.TextXAlignment = Enum.TextXAlignment.Center
title.TextYAlignment = Enum.TextYAlignment.Center

local stroke = Instance.new("UIStroke", title)
stroke.Color = Color3.fromRGB(0,120,80)
stroke.Thickness = 1.4
stroke.Transparency = 0.2

-- STATUS TEXT
local txt = Instance.new("TextLabel", box)
txt.Size = UDim2.fromScale(1,0.25)
txt.Position = UDim2.fromScale(0.5,0.45)
txt.AnchorPoint = Vector2.new(0.5,0)
txt.BackgroundTransparency = 1
txt.TextColor3 = Color3.fromRGB(200,255,220)
txt.Font = Enum.Font.Code
txt.TextSize = 14
txt.Text = "initializing..."
txt.TextXAlignment = Enum.TextXAlignment.Center

-- BAR BG
local barBG = Instance.new("Frame", box)
barBG.Size = UDim2.fromOffset(260,5)
barBG.Position = UDim2.fromScale(0.5,0.8)
barBG.AnchorPoint = Vector2.new(0.5,0.5)
barBG.BackgroundColor3 = Color3.fromRGB(40,60,50)
barBG.BorderSizePixel = 0
Instance.new("UICorner", barBG).CornerRadius = UDim.new(1,0)

-- BAR
local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.fromScale(0,1)
bar.BackgroundColor3 = Color3.fromRGB(0,255,140)
bar.BorderSizePixel = 0
Instance.new("UICorner", bar).CornerRadius = UDim.new(1,0)

--====================================
-- HACKER TYPING TITLE
--====================================
local titleText = "hpey Hub"
task.spawn(function()
    for i = 1, #titleText do
        title.Text = string.sub(titleText,1,i)
        task.wait(0.08)
    end
end)

--====================================
-- LOADING LOOP (~5s)
--====================================
for i = 1,100 do
    bar.Size = UDim2.fromScale(i/100,1)

    if i < 30 then
        txt.Text = "injecting modules..."
        task.wait(0.04)
    elseif i < 65 then
        txt.Text = "bypassing limits..."
        task.wait(0.045)
    elseif i < 90 then
        txt.Text = "optimizing system..."
        task.wait(0.06)
    else
        txt.Text = "finalizing..."
        task.wait(0.08)
    end
end

--====================================
-- FADE OUT
--====================================
TweenService:Create(box, TweenInfo.new(0.45), {
    BackgroundTransparency = 1
}):Play()

TweenService:Create(bg, TweenInfo.new(0.45), {
    BackgroundTransparency = 1
}):Play()

task.wait(0.5)
gui:Destroy()

--====================================
-- ULTRA LIGHT OPTIMIZER
--====================================
pcall(function()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    Lighting.GlobalShadows = false
    Lighting.EnvironmentDiffuseScale = 0
    Lighting.EnvironmentSpecularScale = 0
    Lighting.Brightness = 1
    Lighting.FogEnd = 9e9

    local function optimize(v)
        if v:IsA("BasePart") then
            v.Material = Enum.Material.Plastic
            v.CastShadow = false
            if v.Transparency < 0.8 then
                v.Transparency = 0.85
            end
        end

        if v:IsA("ParticleEmitter") then
            v.Rate = 0
            v.Enabled = false
        end

        if v:IsA("PointLight") or v:IsA("SpotLight") or v:IsA("SurfaceLight") then
            v.Enabled = false
        end
    end

    for _,v in ipairs(Workspace:GetDescendants()) do
        optimize(v)
    end

    Workspace.DescendantAdded:Connect(optimize)
end)
