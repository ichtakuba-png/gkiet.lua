--// 🌈 GK HUH HUB | PRO
--// WELCOME GK HUH

local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local L=game:GetService("Lighting")
local V=game:GetService("VirtualUser")

local LP=P.LocalPlayer
local PG=LP:WaitForChild("PlayerGui")

local fly=false
local invis=false
local esp=false
local noclip=false
local infjump=false
local fullbright=false
local speedOn=false
local jumpOn=false
local speed=70
local jump=100
local bv,bg,fc
local ES={}
local hue=0

--==================================================
-- LOADING
--==================================================

local Load=Instance.new("ScreenGui",PG)
Load.Name="GK_HUH_LOADING"
Load.IgnoreGuiInset=true

local BG=Instance.new("Frame",Load)
BG.Size=UDim2.fromScale(1,1)
BG.BackgroundColor3=Color3.fromRGB(8,8,12)

local W=Instance.new("TextLabel",BG)
W.Size=UDim2.new(1,0,0,70)
W.Position=UDim2.new(0,0,.36,0)
W.BackgroundTransparency=1
W.Text="WELCOME GK HUH"
W.TextColor3=Color3.new(1,1,1)
W.TextSize=32
W.Font=Enum.Font.GothamBlack

local Sub=Instance.new("TextLabel",BG)
Sub.Size=UDim2.new(1,0,0,35)
Sub.Position=UDim2.new(0,0,.45,0)
Sub.BackgroundTransparency=1
Sub.Text="Loading GK HUH PRO..."
Sub.TextColor3=Color3.fromRGB(180,180,190)
Sub.TextSize=16
Sub.Font=Enum.Font.Gotham

local BarBG=Instance.new("Frame",BG)
BarBG.Size=UDim2.fromOffset(280,8)
BarBG.Position=UDim2.new(.5,-140,.54,0)
BarBG.BackgroundColor3=Color3.fromRGB(35,35,45)
BarBG.BorderSizePixel=0

local Bar=Instance.new("Frame",BarBG)
Bar.Size=UDim2.new(0,0,1,0)
Bar.BackgroundColor3=Color3.fromRGB(120,0,255)
Bar.BorderSizePixel=0

for i=1,100 do
	Bar.Size=UDim2.new(i/100,0,1,0)
	W.TextColor3=Color3.fromHSV(i/100,1,1)
	task.wait(.012)
end

task.wait(.35)
Load:Destroy()

--==================================================
-- GUI
--==================================================

local G=Instance.new("ScreenGui",PG)
G.Name="GK_HUH_HUB"
G.ResetOnSpawn=false
G.ZIndexBehavior=Enum.ZIndexBehavior.Sibling

local M=Instance.new("Frame",G)
M.Size=UDim2.fromOffset(285,420)
M.Position=UDim2.new(.04,0,.13,0)
M.BackgroundColor3=Color3.fromRGB(15,15,22)
M.BorderSizePixel=0
M.Active=true
M.Draggable=true

local MC=Instance.new("UICorner",M)
MC.CornerRadius=UDim.new(0,16)

local ST=Instance.new("UIStroke",M)
ST.Thickness=2

local T=Instance.new("TextLabel",M)
T.Size=UDim2.new(1,-45,0,45)
T.Position=UDim2.fromOffset(10,0)
T.BackgroundTransparency=1
T.Text="🌈 GK HUH HUB"
T.TextSize=22
T.Font=Enum.Font.GothamBlack
T.TextColor3=Color3.new(1,1,1)

local X=Instance.new("TextButton",M)
X.Size=UDim2.fromOffset(35,30)
X.Position=UDim2.new(1,-42,0,7)
X.Text="—"
X.TextSize=20
X.TextColor3=Color3.new(1,1,1)
X.BackgroundColor3=Color3.fromRGB(40,40,50)
X.BorderSizePixel=0
Instance.new("UICorner",X).CornerRadius=UDim.new(0,8)

local Holder=Instance.new("ScrollingFrame",M)
Holder.Size=UDim2.new(1,-20,1,-58)
Holder.Position=UDim2.fromOffset(10,52)
Holder.BackgroundTransparency=1
Holder.BorderSizePixel=0
Holder.ScrollBarThickness=4
Holder.CanvasSize=UDim2.new()

local Layout=Instance.new("UIListLayout",Holder)
Layout.Padding=UDim.new(0,7)

local function BTN(txt)
	local b=Instance.new("TextButton",Holder)
	b.Size=UDim2.new(1,-8,0,40)
	b.BackgroundColor3=Color3.fromRGB(30,30,40)
	b.Text=txt
	b.TextColor3=Color3.new(1,1,1)
	b.TextSize=15
	b.Font=Enum.Font.GothamBold
	b.BorderSizePixel=0
	Instance.new("UICorner",b).CornerRadius=UDim.new(0,10)
	return b
end

--==================================================
-- BUTTONS
--==================================================

local F=BTN("✈️ FLY : OFF")
local E=BTN("👁 ULTRA ESP : OFF")
local I=BTN("👻 INVISIBLE : OFF")
local N=BTN("🚫 NOCLIP : OFF")
local S=BTN("⚡ SPEED : OFF")
local J=BTN("🦘 INFINITE JUMP : OFF")
local B=BTN("💡 FULLBRIGHT : OFF")
local Q=BTN("🎥 FOV : 70")
local RST=BTN("🔄 RESET CHARACTER")

--==================================================
-- SHOW BUTTON
--==================================================

local SHOW=Instance.new("TextButton",G)
SHOW.Size=UDim2.fromOffset(60,60)
SHOW.Position=UDim2.new(.03,0,.65,0)
SHOW.Text="🌈"
SHOW.TextSize=27
SHOW.Visible=false
SHOW.Active=true
SHOW.Draggable=true
SHOW.TextColor3=Color3.new(1,1,1)
SHOW.BackgroundColor3=Color3.fromRGB(20,20,28)
SHOW.BorderSizePixel=0

Instance.new("UICorner",SHOW).CornerRadius=UDim.new(1,0)

local SST=Instance.new("UIStroke",SHOW)
SST.Thickness=2

--==================================================
-- FLY
--==================================================

local function stopFly()
	fly=false

	if fc then
		fc:Disconnect()
		fc=nil
	end

	if bv then
		bv:Destroy()
		bv=nil
	end

	if bg then
		bg:Destroy()
		bg=nil
	end

	F.Text="✈️ FLY : OFF"
	F.BackgroundColor3=Color3.fromRGB(30,30,40)
end

local function startFly()
	local c=LP.Character
	if not c then return end

	local h=c:FindFirstChildOfClass("Humanoid")
	local r=c:FindFirstChild("HumanoidRootPart")

	if not h or not r then return end

	stopFly()
	fly=true

	bv=Instance.new("BodyVelocity",r)
	bv.MaxForce=Vector3.new(math.huge,math.huge,math.huge)
	bv.P=50000

	bg=Instance.new("BodyGyro",r)
	bg.MaxTorque=Vector3.new(math.huge,math.huge,math.huge)
	bg.P=50000
	bg.D=1000

	F.Text="✈️ FLY : ON"
	F.BackgroundColor3=Color3.fromRGB(0,170,80)

	fc=R.RenderStepped:Connect(function()

		if not fly or not r.Parent or h.Health<=0 then
			stopFly()
			return
		end

		local m=h.MoveDirection
		local v=m.Magnitude>0 and m.Unit*70 or Vector3.zero

		local y=0

		if U:IsKeyDown(Enum.KeyCode.LeftShift)
		or U:IsKeyDown(Enum.KeyCode.RightShift) then
			y=70
		elseif U:IsKeyDown(Enum.KeyCode.Z) then
			y=-70
		end

		bv.Velocity=Vector3.new(v.X,y,v.Z)

		local l=workspace.CurrentCamera.CFrame.LookVector
		l=Vector3.new(l.X,0,l.Z)

		if l.Magnitude>0 then
			bg.CFrame=CFrame.lookAt(r.Position,r.Position+l)
		end
	end)
end

F.MouseButton1Click:Connect(function()
	if fly then stopFly() else startFly() end
end)

--==================================================
-- INVISIBLE
--==================================================

local function setInvisible(x)
	invis=x

	local c=LP.Character
	if not c then return end

	for _,o in ipairs(c:GetDescendants()) do
		if o:IsA("BasePart") then
			o.LocalTransparencyModifier=x and 1 or 0
		elseif o:IsA("Decal") or o:IsA("Texture") then
			o.Transparency=x and 1 or 0
		end
	end

	I.Text=x and"👻 INVISIBLE : ON"or"👻 INVISIBLE : OFF"
	I.BackgroundColor3=x and Color3.fromRGB(120,0,180)or Color3.fromRGB(30,30,40)
end

I.MouseButton1Click:Connect(function()
	setInvisible(not invis)
end)

--==================================================
-- ESP
--==================================================

local function removeESP(p)
	if ES[p] then
		ES[p]:Destroy()
		ES[p]=nil
	end
end

local function addESP(p)
	if p==LP or not esp or not p.Character then return end

	removeESP(p)

	local c=p.Character
	local h=c:FindFirstChildOfClass("Humanoid")

	if not h then return end

	local hi=Instance.new("Highlight",c)
	hi.Name="GK_HUH_ESP"
	hi.Adornee=c
	hi.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
	hi.FillTransparency=.72
	hi.OutlineTransparency=0

	local head=c:FindFirstChild("Head")

	if head then

		local gui=Instance.new("BillboardGui",head)
		gui.Name="GK_HUH_INFO"
		gui.Adornee=head
		gui.Size=UDim2.fromOffset(200,55)
		gui.StudsOffset=Vector3.new(0,3,0)
		gui.AlwaysOnTop=true

		local tx=Instance.new("TextLabel",gui)
		tx.Size=UDim2.fromScale(1,1)
		tx.BackgroundTransparency=1
		tx.TextColor3=Color3.new(1,1,1)
		tx.TextStrokeTransparency=0
		tx.Font=Enum.Font.GothamBold
		tx.TextSize=14

		task.spawn(function()
			while gui.Parent and esp and p.Parent do

				local me=LP.Character
				local mr=me and me:FindFirstChild("HumanoidRootPart")
				local pr=c:FindFirstChild("HumanoidRootPart")

				local d=mr and pr and math.floor((mr.Position-pr.Position).Magnitude)or 0

				tx.Text=string.format(
					"%s\n❤️ %d/%d  •  📏 %dm",
					p.DisplayName,
					h.Health,
					h.MaxHealth,
					d
				)

				task.wait(.15)
			end
		end)
	end

	ES[p]=hi
end

local function setESP(x)
	esp=x

	E.Text=x and"👁 ULTRA ESP : ON"or"👁 ULTRA ESP : OFF"
	E.BackgroundColor3=x and Color3.fromRGB(0,130,255)or Color3.fromRGB(30,30,40)

	if x then
		for _,p in ipairs(P:GetPlayers())do
			addESP(p)
		end
	else
		for p in pairs(ES)do
			removeESP(p)
		end
	end
end

E.MouseButton1Click:Connect(function()
	setESP(not esp)
end)

P.PlayerAdded:Connect(function(p)
	p.CharacterAdded:Connect(function()
		task.wait(.4)
		if esp then addESP(p) end
	end)
end)

P.PlayerRemoving:Connect(removeESP)

--==================================================
-- NOCLIP
--==================================================

N.MouseButton1Click:Connect(function()
	noclip=not noclip
	N.Text=noclip and"🚫 NOCLIP : ON"or"🚫 NOCLIP : OFF"
	N.BackgroundColor3=noclip and Color3.fromRGB(255,100,0)or Color3.fromRGB(30,30,40)
end)

R.Stepped:Connect(function()
	if noclip and LP.Character then
		for _,o in ipairs(LP.Character:GetDescendants())do
			if o:IsA("BasePart") then
				o.CanCollide=false
			end
		end
	end
end)

--==================================================
-- SPEED
--==================================================

S.MouseButton1Click:Connect(function()
	speedOn=not speedOn

	S.Text=speedOn and"⚡ SPEED : ON"or"⚡ SPEED : OFF"
	S.BackgroundColor3=speedOn and Color3.fromRGB(255,150,0)or Color3.fromRGB(30,30,40)

	local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")

	if h then
		h.WalkSpeed=speedOn and speed or 16
	end
end)

--==================================================
-- INFINITE JUMP
--==================================================

J.MouseButton1Click:Connect(function()
	infjump=not infjump

	J.Text=infjump and"🦘 INFINITE JUMP : ON"or"🦘 INFINITE JUMP : OFF"
	J.BackgroundColor3=infjump and Color3.fromRGB(0,180,120)or Color3.fromRGB(30,30,40)
end)

U.JumpRequest:Connect(function()
	if infjump then
		local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
		if h then h:ChangeState(Enum.HumanoidStateType.Jumping)end
	end
end)

--==================================================
-- FULLBRIGHT
--==================================================

B.MouseButton1Click:Connect(function()
	fullbright=not fullbright

	B.Text=fullbright and"💡 FULLBRIGHT : ON"or"💡 FULLBRIGHT : OFF"

	if fullbright then
		L.Brightness=2
		L.ClockTime=14
		L.FogEnd=1e6
		L.GlobalShadows=false
	else
		L.Brightness=1
		L.ClockTime=14
		L.FogEnd=100000
		L.GlobalShadows=true
	end
end)

--==================================================
-- FOV
--==================================================

Q.MouseButton1Click:Connect(function()
	local cam=workspace.CurrentCamera
	local f=cam.FieldOfView

	if f==70 then f=90
	elseif f==90 then f=110
	elseif f==110 then f=120
	else f=70 end

	cam.FieldOfView=f
	Q.Text="🎥 FOV : "..f
end)

--==================================================
-- CTRL INVIS
--==================================================

U.InputBegan:Connect(function(i,gp)

	if gp then return end

	if i.KeyCode==Enum.KeyCode.LeftControl
	or i.KeyCode==Enum.KeyCode.RightControl then
		setInvisible(not invis)
	end
end)

--==================================================
-- HIDE GUI
--==================================================

X.MouseButton1Click:Connect(function()
	M.Visible=false
	SHOW.Visible=true
end)

SHOW.MouseButton1Click:Connect(function()
	M.Visible=true
	SHOW.Visible=false
end)

--==================================================
-- RESET
--==================================================

RST.MouseButton1Click:Connect(function()
	local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
	if h then h.Health=0 end
end)

--==================================================
-- RESPAWN
--==================================================

LP.CharacterAdded:Connect(function(c)

	stopFly()

	task.wait(.6)

	local h=c:FindFirstChildOfClass("Humanoid")

	if h and speedOn then
		h.WalkSpeed=speed
	end

	if h and jumpOn then
		h.JumpPower=jump
	end

	if invis then
		setInvisible(true)
	end

	if esp then
		for _,p in ipairs(P:GetPlayers())do
			if p~=LP then addESP(p)end
		end
	end
end)

--==================================================
-- RAINBOW
--==================================================

R.RenderStepped:Connect(function(dt)

	hue=(hue+dt*.22)%1

	local c=Color3.fromHSV(hue,1,1)

	ST.Color=c
	SST.Color=c
	T.TextColor3=c

	if esp then
		for _,h in pairs(ES)do
			if h then
				h.FillColor=c
				h.OutlineColor=Color3.new(1,1,1)
			end
		end
	end
end)

print("🌈 GK HUH HUB LOADED")
print("WELCOME GK HUH")
