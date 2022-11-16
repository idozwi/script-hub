local ScreenGui = Instance.new("ScreenGui")
local GUI = Instance.new("Frame")
local tptoolBtn = Instance.new("TextButton")
local FlyBtn = Instance.new("TextButton")
local NoClipBtn = Instance.new("TextButton")
local ESPBtn = Instance.new("TextButton")
local OpenGUI = Instance.new("TextButton")
local CloseGUI = Instance.new("TextButton")



ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

GUI.Name = "GUI"
GUI.Parent = ScreenGui
GUI.BackgroundColor3 = Color3.fromRGB(3, 0, 79)
GUI.Position = UDim2.new(0.299197882, 0, -0.686419666, 0)
GUI.Size = UDim2.new(0, 535, 0, 555)
GUI.Active = true
GUI.Draggable = true

FlyBtn.Name = "FlyBtn"
FlyBtn.Parent = GUI
FlyBtn.BackgroundColor3 = Color3.fromRGB(0, 123, 255)
FlyBtn.Position = UDim2.new(0.0199999996, 0, 0.0199999996, 0)
FlyBtn.Size = UDim2.new(0, 89, 0, 50)
FlyBtn.Font = Enum.Font.SourceSans
FlyBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
FlyBtn.TextSize = 14.000
FlyBtn.Text = "Fly"
FlyBtn.MouseButton1Down:Connect(function()
	repeat wait()
	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
	local mouse = game.Players.LocalPlayer:GetMouse()


	repeat wait() until mouse


	local plr = game.Players.LocalPlayer
	local torso = plr.Character.Torso
	local flying = true
	local deb = true
	local ctrl = {f = 0, b = 0, l = 0, r = 0}
	local lastctrl = {f = 0, b = 0, l = 0, r = 0}
	local maxspeed = 50
	local speed = 0
	local bg = nil
	local bv = nil


	function Fly()
		game.StarterGui:SetCore("SendNotification", {Title="Fly Activated"; Text="press E to Deactivate"; Duration=2;})
		bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		repeat wait()
			plr.Character.Humanoid.PlatformStand = true
			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0.1,0)
			end
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		until not flying
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bg = nil
		bv:Destroy()
		bv = nil
		plr.Character.Humanoid.PlatformStand = false
		game.StarterGui:SetCore("SendNotification", {Title="Fly Deactivated"; Text="press E to activeate!"; Duration=2;})
	end

	--Controls
	mouse.KeyDown:connect(function(key)
		if key:lower() == "e" then
			if flying then 
				flying = false
			else
				flying = true
				Fly()
			end
		elseif key:lower() == "w" then
			ctrl.f = 1
		elseif key:lower() == "s" then
			ctrl.b = -1
		elseif key:lower() == "a" then
			ctrl.l = -1
		elseif key:lower() == "d" then
			ctrl.r = 1
		end
	end)

	mouse.KeyUp:connect(function(key)
		if key:lower() == "w" then
			ctrl.f = 0
		elseif key:lower() == "s" then
			ctrl.b = 0
		elseif key:lower() == "a" then
			ctrl.l = 0
		elseif key:lower() == "d" then
			ctrl.r = 0
		end
	end)

	Fly()
	
	
	
	
	
	
	
end)

NoClipBtn.Name = "BtoolsBtn"
NoClipBtn.Parent = GUI
NoClipBtn.BackgroundColor3 = Color3.fromRGB(0, 123, 255)
NoClipBtn.BorderColor3 = Color3.fromRGB(98, 96, 95)
NoClipBtn.Position = UDim2.new(0.0199999996, 0, 0.150000006, 0)
NoClipBtn.Size = UDim2.new(0, 89, 0, 50)
NoClipBtn.Font = Enum.Font.SourceSans
NoClipBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
NoClipBtn.TextSize = 14.000
NoClipBtn.Text = "Btools"

NoClipBtn.MouseButton1Down:Connect(function()
	


	backpack = game:GetService("Players").LocalPlayer.Backpack

	hammer = Instance.new("HopperBin")
	hammer.Name = "Hammer"
	hammer.BinType = 4
	hammer.Parent = backpack

	cloneTool = Instance.new("HopperBin")
	cloneTool.Name = "Clone"
	cloneTool.BinType = 3
	cloneTool.Parent = backpack

	grabTool = Instance.new("HopperBin")
	grabTool.Name = "Grab"
	grabTool.BinType = 2
	grabTool.Parent = backpack
	
	
	
end)





ESPBtn.Name = "ESPBtn"
ESPBtn.Parent = GUI
ESPBtn.BackgroundColor3 = Color3.fromRGB(0, 123, 255)
ESPBtn.Position = UDim2.new(0.0199999996, 0, 0.280000001, 0)
ESPBtn.Size = UDim2.new(0, 89, 0, 43)
ESPBtn.Font = Enum.Font.SourceSans
ESPBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ESPBtn.TextSize = 14.000
ESPBtn.Text = "ESP"
ESPBtn.MouseButton1Down:Connect(function()
	
	local color = BrickColor.new(50,0,250)
	local transparency = .8

	local Players = game:GetService("Players")
	local function _ESP(c)
		repeat wait() until c.PrimaryPart ~= nil
		for i,p in pairs(c:GetChildren()) do
			if p.ClassName == "Part" or p.ClassName == "MeshPart" then
				if p:FindFirstChild("shit") then p.shit:Destroy() end
				local a = Instance.new("BoxHandleAdornment",p)
				a.Name = "shit"
				a.Size = p.Size
				a.Color = color
				a.Transparency = transparency
				a.AlwaysOnTop = true    
				a.Visible = true    
				a.Adornee = p
				a.ZIndex = true    

			end
		end
	end
	local function ESP()
		for i,v in pairs(Players:GetChildren()) do
			if v ~= game.Players.LocalPlayer then
				if v.Character then
					_ESP(v.Character)
				end
				v.CharacterAdded:Connect(function(chr)
					_ESP(chr)
				end)
			end
		end
		Players.PlayerAdded:Connect(function(player)
			player.CharacterAdded:Connect(function(chr)
				_ESP(chr)
			end)  
		end)
	end
	ESP()
	
	
	
end)




tptoolBtn.Name = "tptoolBtn"
tptoolBtn.Parent = GUI
tptoolBtn.BackgroundColor3 = Color3.fromRGB(0, 123, 255)
tptoolBtn.Position = UDim2.new(0.0199999996, 0, 0.38, 0)
tptoolBtn.Size = UDim2.new(0, 89, 0, 50)
tptoolBtn.Font = Enum.Font.SourceSans
tptoolBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
tptoolBtn.TextSize = 14.000
tptoolBtn.Text = "Tp Tool"
tptoolBtn.MouseButton1Down:Connect(function()

mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Tp tool"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack

end)
















OpenGUI.Name = "OpenGUI"
OpenGUI.Parent = ScreenGui
OpenGUI.BackgroundColor3 = Color3.fromRGB(0, 38, 255)
OpenGUI.Position = UDim2.new(-0.000250067562, 0, 0.422222227, 0)
OpenGUI.Size = UDim2.new(0, 104, 0, 67)
OpenGUI.Font = Enum.Font.SourceSans
OpenGUI.TextColor3 = Color3.fromRGB(0, 0, 0)
OpenGUI.TextSize = 20.000

CloseGUI.Name = "CloseGUI"
CloseGUI.Parent = ScreenGui
CloseGUI.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
CloseGUI.Position = UDim2.new(-0.000250067562, 0, 0.524691343, 0)
CloseGUI.Size = UDim2.new(0, 104, 0, 67)
CloseGUI.Font = Enum.Font.SourceSans
CloseGUI.TextColor3 = Color3.fromRGB(0, 0, 0)
CloseGUI.TextSize = 20.000

-- Scripts:

local function YEHIGBH_fake_script() -- ScreenGui.OpenGUI 
	local script = Instance.new('LocalScript', ScreenGui)

	local GUI = script.Parent.GUI
	local OpenGUI = script.Parent.OpenGUI
	
	
	OpenGUI.MouseButton1Up:Connect(function()
		
		
		
		GUI:TweenPosition(
			UDim2.new(0.335, 0, 0.143, 0),
			"Out",
			"Quad",
			1,
			false
			)
		
		
		
		
		
		
		GUI:TweenSize(
			UDim2.new(0, 535,0, 555), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2, true
		)
		
	end)
	
end
coroutine.wrap(YEHIGBH_fake_script)()
local function MVVYZFL_fake_script() -- ScreenGui.CloseGUI 
	local script = Instance.new('LocalScript', ScreenGui)

	local GUI = script.Parent.GUI
	local CloseGUI = script.Parent.CloseGUI
	
	
	CloseGUI.MouseButton1Up:Connect(function()
		
		
		GUI.Size = UDim2.new (-2, 535,-2, 555)
		
	end)
	
	
	
	
	CloseGUI.MouseButton1Up:Connect(function()
	
	
		GUI:TweenPosition(
			UDim2.new(0.325, 0, -0.657, 0),
			"Out",
			"Quad",
			1,
			false
		)
	
	end)
	
	
	
	
	
end
coroutine.wrap(MVVYZFL_fake_script)()
