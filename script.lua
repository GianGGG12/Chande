local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

local box = Instance.new("Frame", gui)
box.Size = UDim2.new(0,320,0,120)
box.Position = UDim2.new(0.5,-160,0.5,-60)
box.BackgroundColor3 = Color3.fromRGB(20,20,20)

local corner = Instance.new("UICorner", box)
corner.CornerRadius = UDim.new(0,12)

local title = Instance.new("TextLabel", box)
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "Loading..."
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 20

local barBG = Instance.new("Frame", box)
barBG.Size = UDim2.new(0.85,0,0,12)
barBG.Position = UDim2.new(0.075,0,0.55,0)
barBG.BackgroundColor3 = Color3.fromRGB(40,40,40)

local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(0,200,100)

local txt = Instance.new("TextLabel", box)
txt.Size = UDim2.new(1,0,0,30)
txt.Position = UDim2.new(0,0,0.75,0)
txt.BackgroundTransparency = 1
txt.Text = "0%"
txt.TextColor3 = Color3.fromRGB(200,200,200)

for i = 1,100 do
bar.Size = UDim2.new(i/100,0,1,0)
txt.Text = i.."%"
task.wait(0.02)
end

txt.Text = "UNLOCKED!"

task.wait(0.5)
gui:Destroy() local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")

-- ================= GUI =================
local gui = Instance.new("ScreenGui")
gui.Name = "HoangGiangHub"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true

-- ================= OPEN BUTTON =================
local open = Instance.new("TextButton")
open.Parent = gui
open.Size = UDim2.new(0,55,0,55)
open.Position = UDim2.new(1,-70,0.35,0)
open.BackgroundColor3 = Color3.fromRGB(35,35,35)
open.Text = "☰"
open.TextSize = 28
open.TextColor3 = Color3.new(1,1,1)
open.BorderSizePixel = 0
open.Active = true
open.Draggable = true

local oc = Instance.new("UICorner")
oc.CornerRadius = UDim.new(1,0)
oc.Parent = open

-- ================= MENU =================
local menu = Instance.new("Frame")
menu.Parent = gui
menu.Size = UDim2.new(0,340,0,190)
menu.Position = UDim2.new(0.5,-170,0,20)
menu.BackgroundColor3 = Color3.fromRGB(18,18,18)
menu.BorderSizePixel = 0
menu.Visible = false
menu.Active = true
menu.Draggable = true

local mc = Instance.new("UICorner")
mc.CornerRadius = UDim.new(0,14)
mc.Parent = menu

-- ================= BORDER =================
local stroke = Instance.new("UIStroke")
stroke.Parent = menu
stroke.Thickness = 2

task.spawn(function()
while true do
for i = 0,1,0.01 do
stroke.Color = Color3.fromHSV(i,1,1)
task.wait(0.03)
end
end
end)

-- ================= TITLE =================
local title = Instance.new("TextLabel")
title.Parent = menu
title.Size = UDim2.new(1,0,0,35)
title.BackgroundTransparency = 1
title.Text = "chan đê🖕"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 20
title.Font = Enum.Font.GothamBold

-- ================= CLOSE =================
local close = Instance.new("TextButton")
close.Parent = menu
close.Size = UDim2.new(0,35,0,35)
close.Position = UDim2.new(1,-40,0,5)
close.BackgroundColor3 = Color3.fromRGB(45,45,45)
close.Text = "-"
close.TextSize = 28
close.TextColor3 = Color3.new(1,1,1)
close.BorderSizePixel = 0

local cc = Instance.new("UICorner")
cc.CornerRadius = UDim.new(1,0)
cc.Parent = close

close.MouseButton1Click:Connect(function()
menu.Visible = false
open.Visible = true
end)

open.MouseButton1Click:Connect(function()
menu.Visible = true
open.Visible = false
end)

-- ================= HOLDER =================
local holder = Instance.new("Frame")
holder.Parent = menu
holder.Size = UDim2.new(1,-10,1,-45)
holder.Position = UDim2.new(0,5,0,40)
holder.BackgroundTransparency = 1

local grid = Instance.new("UIGridLayout")
grid.Parent = holder
grid.CellSize = UDim2.new(0,100,0,40)
grid.CellPadding = UDim2.new(0,8,0,8)
grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
grid.VerticalAlignment = Enum.VerticalAlignment.Center

-- ================= CHARACTER =================
local function getChar()
local c = player.Character or player.CharacterAdded:Wait()
local root = c:FindFirstChild("HumanoidRootPart")
local hum = c:FindFirstChildOfClass("Humanoid")
return c,root,hum
end

-- ================= BUTTON =================
local function makeButton(name)

local enabled = false  

local b = Instance.new("TextButton")  
b.Parent = holder  
b.Size = UDim2.new(0,100,0,40)  
b.BackgroundColor3 = Color3.fromRGB(40,40,40)  
b.TextColor3 = Color3.new(1,1,1)  
b.Text = name  
b.TextSize = 16  
b.Font = Enum.Font.GothamBold  
b.BorderSizePixel = 0  

local bc = Instance.new("UICorner")  
bc.CornerRadius = UDim.new(0,10)  
bc.Parent = b  

local function toggle()  

	enabled = not enabled  

	if enabled then  
		b.BackgroundColor3 = Color3.fromRGB(0,170,70)  
	else  
		b.BackgroundColor3 = Color3.fromRGB(40,40,40)  
	end  

	return enabled  
end  

return b,toggle

end

-- ================= FLY =================
local flyBtn = makeButton("FLY")

local flyLoaded = false
local flyGui

flyBtn.MouseButton1Click:Connect(function()

if not flyLoaded then  

	flyLoaded = true  
	flyBtn.BackgroundColor3 = Color3.fromRGB(0,170,70)  

	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-fly-45749"))()  

	task.wait(1.5)  

	for _,v in pairs(game.CoreGui:GetChildren()) do  

		if v:IsA("ScreenGui") then  

			local found = false  

			for _,x in pairs(v:GetDescendants()) do  

				if x:IsA("TextLabel") then  

					local txt = string.lower(x.Text)  

					if string.find(txt,"fly") then  
						found = true  
						break  
					end  
				end  
			end  

			if found then  
				flyGui = v  
				break  
			end  
		end  
	end  

	if flyGui then  
		flyGui.Enabled = true  
	end  

else  

	flyLoaded = false  
	flyBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)  

	if flyGui then  
		flyGui.Enabled = false  
	end  
end

end)

-- ================= SPEED =================
local speedBtn,speedToggle = makeButton("SPEED")

speedBtn.MouseButton1Click:Connect(function()

local enabled = speedToggle()  

local _,_,hum = getChar()  

if hum then  
	hum.WalkSpeed = enabled and 60 or 16  
end

end)

-- ================= NOCLIP =================
local noclip = false
local noclipBtn,noclipToggle = makeButton("NOCLIP")

noclipBtn.MouseButton1Click:Connect(function()
noclip = noclipToggle()
end)

runService.Stepped:Connect(function()

if noclip then  

	local char = player.Character  

	if char then  
		for _,v in pairs(char:GetDescendants()) do  
			if v:IsA("BasePart") then  
				v.CanCollide = false  
			end  
		end  
	end  
end

end)

-- ================= ESP =================
local esp = false
local espBtn,espToggle = makeButton("ESP")

local function applyESP(char)

if char:FindFirstChild("ESP_HL") then  
	char.ESP_HL:Destroy()  
end  

local h = Instance.new("Highlight")  
h.Name = "ESP_HL"  
h.FillColor = Color3.fromRGB(255,0,0)  
h.OutlineColor = Color3.new(1,1,1)  
h.FillTransparency = 0.5  
h.Parent = char

end

espBtn.MouseButton1Click:Connect(function()

esp = espToggle()  

for _,p in pairs(game.Players:GetPlayers()) do  

	if p ~= player and p.Character then  

		if esp then  
			applyESP(p.Character)  
		else  
			local hl = p.Character:FindFirstChild("ESP_HL")  
			if hl then  
				hl:Destroy()  
			end  
		end  
	end  
end

end)

-- ================= TP =================
local tpBtn = makeButton("TP")

tpBtn.MouseButton1Click:Connect(function()

local _,root = getChar()  
if not root then return end  

local players = game.Players:GetPlayers()  
local target  

repeat  
	target = players[math.random(1,#players)]  
until target ~= player  

if target.Character then  

	local troot = target.Character:FindFirstChild("HumanoidRootPart")  

	if troot then  
		root.CFrame = troot.CFrame + Vector3.new(0,3,0)  
	end  
end

end)

-- ================= RESET =================
local resetBtn = makeButton("RESET")

resetBtn.MouseButton1Click:Connect(function()

local _,_,hum = getChar()  

if hum then  
	hum.Health = 0  
end

end)
