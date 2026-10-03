-- ==========================================
-- LYNN MOD MENU - TAB PLAYER (EXTERNAL FILE)
-- ==========================================
local pagePlayer, menuGui = ... -- Menerima parameter operan dari script utama
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local function TampilkanNotifikasiHijau(pesan)
	task.spawn(function()
		local notifFrame = Instance.new("Frame", menuGui)
		notifFrame.Size = UDim2.new(0, 260, 0, 42)
		notifFrame.Position = UDim2.new(0.5, -130, 0, -60)
		notifFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
		notifFrame.BorderSizePixel = 0
		notifFrame.ZIndex = 9999999
		Instance.new("UICorner", notifFrame).CornerRadius = UDim.new(0, 8)
		
		local stroke = Instance.new("UIStroke", notifFrame)
		stroke.Color = Color3.fromRGB(60, 60, 75)
		stroke.Thickness = 1.2

		local textNotif = Instance.new("TextLabel", notifFrame)
		textNotif.Size = UDim2.new(1, 0, 1, 0)
		textNotif.BackgroundTransparency = 1
		textNotif.Text = pesan
		textNotif.TextColor3 = Color3.fromRGB(235, 235, 245)
		textNotif.Font = Enum.Font.Gotham
		textNotif.TextSize = 11
		textNotif.ZIndex = 9999999

		TweenService:Create(notifFrame, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			Position = UDim2.new(0.5, -130, 0, 25)
		}):Play()

		task.wait(2.2)
		TweenService:Create(notifFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			Position = UDim2.new(0.5, -130, 0, -60)
		}):Play()
		task.wait(0.25)
		notifFrame:Destroy()
	end)
end

local function BuatRowSaklar(parent, posY, judul, defaultAngka, butuhInput)
	local row = Instance.new("Frame", parent)
	row.Size = UDim2.new(1, -20, 0, 35)
	row.Position = UDim2.new(0, 10, 0, posY)
	row.BackgroundTransparency = 1
	
	local label = Instance.new("TextLabel", row)
	label.Size = UDim2.new(0.5, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Text = judul
	label.TextColor3 = Color3.fromRGB(210, 210, 220)
	label.Font = Enum.Font.Gotham
	label.TextSize = 12
	label.TextXAlignment = Enum.TextXAlignment.Left
	
	local inputBox = nil
	if butuhInput then
		inputBox = Instance.new("TextBox", row)
		inputBox.Size = UDim2.new(0, 45, 0, 24)
		inputBox.Position = UDim2.new(1, -100, 0.5, -12)
		inputBox.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
		inputBox.TextColor3 = Color3.fromRGB(240, 240, 250)
		inputBox.Text = defaultAngka
		inputBox.Font = Enum.Font.Gotham
		inputBox.TextSize = 11 
		Instance.new("UICorner", inputBox).CornerRadius = UDim.new(0, 4)
		Instance.new("UIStroke", inputBox).Color = Color3.fromRGB(38, 38, 48)
	end
	
	local switchBg = Instance.new("Frame", row)
	switchBg.Size = UDim2.new(0, 40, 0, 20)
	switchBg.Position = UDim2.new(1, -40, 0.5, -10)
	switchBg.BackgroundColor3 = Color3.fromRGB(18, 18, 24) 
	Instance.new("UICorner", switchBg).CornerRadius = UDim.new(1, 0)
	local switchStroke = Instance.new("UIStroke", switchBg)
	switchStroke.Color = Color3.fromRGB(40, 40, 52)
	switchStroke.Thickness = 1
	
	local knob = Instance.new("Frame", switchBg)
	knob.Size = UDim2.new(0, 14, 0, 14)
	knob.Position = UDim2.new(0, 3, 0.5, -7) 
	knob.BackgroundColor3 = Color3.fromRGB(140, 140, 155)
	Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)
	
	local btn = Instance.new("TextButton", switchBg)
	btn.Size = UDim2.new(1, 0, 1, 0)
	btn.BackgroundTransparency = 1
	btn.Text = ""
	
	return btn, switchBg, knob, inputBox
end

-- INISIALISASI FITUR PLAYER
local btnSpeed, bgSpeed, knobSpeed, inputSpeed = BuatRowSaklar(pagePlayer, 15, "Walk Speed", "100", true)
local btnJump, bgJump, knobJump, inputJump = BuatRowSaklar(pagePlayer, 60, "Jump Power", "150", true)
local btnInfJump, bgInfJump, knobInfJump, _ = BuatRowSaklar(pagePlayer, 105, "Infinite Jump", "", false)
local btnNoclip, bgNoclip, knobNoclip, _ = BuatRowSaklar(pagePlayer, 150, "Noclip", "", false)
local btnFly, bgFly, knobFly, _ = BuatRowSaklar(pagePlayer, 195, "Smooth Fly", "", false)

local speedOn, jumpOn, infJumpOn, noclipOn, flyOn = false, false, false, false, false
local warnaBgOff = Color3.fromRGB(18, 18, 24)
local warnaBgOn = Color3.fromRGB(220, 220, 235) 
local posKnobOff = UDim2.new(0, 3, 0.5, -7)
local posKnobOn = UDim2.new(1, -17, 0.5, -7)
local warnaKnobOn = Color3.fromRGB(10, 10, 15)
local warnaKnobOff = Color3.fromRGB(140, 140, 155)

local function AnimasiSaklar(isOn, bg, knob)
	TweenService:Create(bg, TweenInfo.new(0.25), {BackgroundColor3 = isOn and warnaBgOn or warnaBgOff}):Play()
	TweenService:Create(knob, TweenInfo.new(0.25), {Position = isOn and posKnobOn or posKnobOff, BackgroundColor3 = isOn and warnaKnobOn or warnaKnobOff}):Play()
end

local function UpdatePlayer()
	pcall(function()
		local char = player.Character
		local hum = char and char:FindFirstChild("Humanoid")
		if hum then
			hum.WalkSpeed = speedOn and (tonumber(inputSpeed.Text) or 100) or 16
			hum.UseJumpPower = true
			hum.JumpPower = jumpOn and (tonumber(inputJump.Text) or 150) or 50 
		end
	end)
end

player.CharacterAdded:Connect(function() task.wait(0.5) UpdatePlayer() end)

btnSpeed.MouseButton1Click:Connect(function() speedOn = not speedOn AnimasiSaklar(speedOn, bgSpeed, knobSpeed) UpdatePlayer() end)
btnJump.MouseButton1Click:Connect(function() jumpOn = not jumpOn AnimasiSaklar(jumpOn, bgJump, knobJump) UpdatePlayer() end)
if inputSpeed then inputSpeed.FocusLost:Connect(function() if speedOn then UpdatePlayer() end end) end
if inputJump then inputJump.FocusLost:Connect(function() if jumpOn then UpdatePlayer() end end) end

local infJumpConnection
btnInfJump.MouseButton1Click:Connect(function()
	infJumpOn = not infJumpOn
	AnimasiSaklar(infJumpOn, bgInfJump, knobInfJump)
	if infJumpOn then
		infJumpConnection = UserInputService.JumpRequest:Connect(function()
			pcall(function()
				local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
				if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
			end)
		end)
	else
		if infJumpConnection then infJumpConnection:Disconnect() end
	end
end)

local noclipConnection
btnNoclip.MouseButton1Click:Connect(function()
	noclipOn = not noclipOn
	AnimasiSaklar(noclipOn, bgNoclip, knobNoclip)
	if noclipOn then
		noclipConnection = RunService.Stepped:Connect(function()
			pcall(function()
				for _, part in pairs(player.Character:GetDescendants()) do
					if part:IsA("BasePart") then part.CanCollide = false end
				end
			end)
		end)
	else
		if noclipConnection then noclipConnection:Disconnect() end
	end
end)

local bgGyro, bvVel
btnFly.MouseButton1Click:Connect(function()
	flyOn = not flyOn
	AnimasiSaklar(flyOn, bgFly, knobFly)
	pcall(function()
		local char = player.Character
		if not char or not char:FindFirstChild("HumanoidRootPart") then return end
		local root = char.HumanoidRootPart
		local hum = char:FindFirstChildOfClass("Humanoid")
		
		if flyOn then
			hum.PlatformStand = true
			bgGyro = Instance.new("BodyGyro", root)
			bgGyro.P = 9e4
			bgGyro.maxTorque = Vector3.new(9e4, 9e4, 9e4)
			
			bvVel = Instance.new("BodyVelocity", root)
			bvVel.velocity = Vector3.new(0, 0.1, 0)
			bvVel.maxForce = Vector3.new(9e4, 9e4, 9e4)
			
			task.spawn(function()
				while flyOn and char and root.Parent do
					local cam = workspace.CurrentCamera
					local moveDir = Vector3.new()
					if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
					if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
					if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
					if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
					bvVel.velocity = moveDir * 50
					bgGyro.cframe = cam.CFrame
					task.wait()
				end
			end)
			TampilkanNotifikasiHijau("Smooth Fly Aktif!")
		else
			hum.PlatformStand = false
			if bgGyro then bgGyro:Destroy() end
			if bvVel then bvVel:Destroy() end
			TampilkanNotifikasiHijau("Smooth Fly Mati.")
		end
	end)
end)

-- WAYPOINT SYSTEM
local wpRow = Instance.new("Frame", pagePlayer)
wpRow.Size = UDim2.new(1, -20, 0, 35)
wpRow.Position = UDim2.new(0, 10, 0, 240)
wpRow.BackgroundTransparency = 1

local wpLabel = Instance.new("TextLabel", wpRow)
wpLabel.Size = UDim2.new(0.4, 0, 1, 0)
wpLabel.BackgroundTransparency = 1
wpLabel.Text = "Waypoint"
wpLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
wpLabel.Font = Enum.Font.Gotham
wpLabel.TextSize = 12
wpLabel.TextXAlignment = Enum.TextXAlignment.Left

local btnSavePos = Instance.new("TextButton", wpRow)
btnSavePos.Size = UDim2.new(0, 48, 0, 24)
btnSavePos.Position = UDim2.new(1, -102, 0.5, -12)
btnSavePos.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
btnSavePos.Text = "SAVE"
btnSavePos.TextColor3 = Color3.fromRGB(210, 210, 220)
btnSavePos.Font = Enum.Font.GothamMedium
btnSavePos.TextSize = 10
Instance.new("UICorner", btnSavePos).CornerRadius = UDim.new(0, 4)
Instance.new("UIStroke", btnSavePos).Color = Color3.fromRGB(45, 45, 58)

local btnLoadPos = Instance.new("TextButton", wpRow)
btnLoadPos.Size = UDim2.new(0, 48, 0, 24)
btnLoadPos.Position = UDim2.new(1, -50, 0.5, -12)
btnLoadPos.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
btnLoadPos.Text = "LOAD"
btnLoadPos.TextColor3 = Color3.fromRGB(210, 210, 220)
btnLoadPos.Font = Enum.Font.GothamMedium
btnLoadPos.TextSize = 10
Instance.new("UICorner", btnLoadPos).CornerRadius = UDim.new(0, 4)
Instance.new("UIStroke", btnLoadPos).Color = Color3.fromRGB(45, 45, 58)

local savedCFrame = nil
btnSavePos.MouseButton1Click:Connect(function()
	pcall(function()
		local char = player.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			savedCFrame = char.HumanoidRootPart.CFrame
			TampilkanNotifikasiHijau("Posisi Disimpan!")
		end
	end)
end)

btnLoadPos.MouseButton1Click:Connect(function()
	pcall(function()
		if savedCFrame then
			local char = player.Character
			if char and char:FindFirstChild("HumanoidRootPart") then
				char.HumanoidRootPart.CFrame = savedCFrame
				TampilkanNotifikasiHijau("Teleport ke Saved Position!")
			end
		else
			TampilkanNotifikasiHijau("Belum ada posisi!")
		end
	end)
end)