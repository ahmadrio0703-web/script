-- ==========================================
-- LYNN MOD MENU - TAB SETTINGS (EXTERNAL FILE)
-- ==========================================
local pagePerf, menuGui = ... -- Menerima parameter operan dari script utama
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local PlaceId = game.PlaceId

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

local warnaBgOff = Color3.fromRGB(18, 18, 24)
local warnaBgOn = Color3.fromRGB(220, 220, 235) 
local posKnobOff = UDim2.new(0, 3, 0.5, -7)
local posKnobOn = UDim2.new(1, -17, 0.5, -7)

local function AnimasiSaklar(isOn, bg, knob)
	TweenService:Create(bg, TweenInfo.new(0.25), {BackgroundColor3 = isOn and warnaBgOn or warnaBgOff}):Play()
	TweenService:Create(knob, TweenInfo.new(0.25), {Position = isOn and posKnobOn or posKnobOff}):Play()
end

-- INISIALISASI HALAMAN SETTINGS
local settingsTitle = Instance.new("TextLabel", pagePerf)
settingsTitle.Size = UDim2.new(1, -20, 0, 25)
settingsTitle.Position = UDim2.new(0, 10, 0, 10)
settingsTitle.BackgroundTransparency = 1
settingsTitle.Text = "SYSTEM & PERFORMANCE SETTINGS"
settingsTitle.TextColor3 = Color3.fromRGB(220, 220, 235)
settingsTitle.Font = Enum.Font.GothamBold
settingsTitle.TextSize = 11.5
settingsTitle.TextXAlignment = Enum.TextXAlignment.Left

-- 1. Anti-AFK
local btnAfk, bgAfk, knobAfk, _ = BuatRowSaklar(pagePerf, 42, "Anti-AFK", "", false)
local afkOn = false
local afkConn

btnAfk.MouseButton1Click:Connect(function()
	afkOn = not afkOn
	AnimasiSaklar(afkOn, bgAfk, knobAfk)
	if afkOn then
		afkConn = player.Idled:Connect(function()
			pcall(function()
				local vu = game:GetService("VirtualUser")
				vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
				task.wait(1)
				vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
			end)
		end)
		TampilkanNotifikasiHijau("Anti-AFK Aktif!")
	else
		if afkConn then afkConn:Disconnect() end
		TampilkanNotifikasiHijau("Anti-AFK Mati.")
	end
end)

-- 2. World Time (Jam Dunia)
local timeRow = Instance.new("Frame", pagePerf)
timeRow.Size = UDim2.new(1, -20, 0, 35)
timeRow.Position = UDim2.new(0, 10, 0, 85)
timeRow.BackgroundTransparency = 1

local timeLabel = Instance.new("TextLabel", timeRow)
timeLabel.Size = UDim2.new(0.5, 0, 1, 0)
timeLabel.BackgroundTransparency = 1
timeLabel.Text = "World Time"
timeLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
timeLabel.Font = Enum.Font.Gotham
timeLabel.TextSize = 12
timeLabel.TextXAlignment = Enum.TextXAlignment.Left

local inputTime = Instance.new("TextBox", timeRow)
inputTime.Size = UDim2.new(0, 45, 0, 24)
inputTime.Position = UDim2.new(1, -100, 0.5, -12)
inputTime.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
inputTime.TextColor3 = Color3.fromRGB(240, 240, 250)
inputTime.Text = "14"
inputTime.Font = Enum.Font.Gotham
inputTime.TextSize = 11 
Instance.new("UICorner", inputTime).CornerRadius = UDim.new(0, 4)
Instance.new("UIStroke", inputTime).Color = Color3.fromRGB(38, 38, 48)

local switchTimeBg = Instance.new("Frame", timeRow)
switchTimeBg.Size = UDim2.new(0, 40, 0, 20)
switchTimeBg.Position = UDim2.new(1, -40, 0.5, -10)
switchTimeBg.BackgroundColor3 = Color3.fromRGB(18, 18, 24) 
Instance.new("UICorner", switchTimeBg).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", switchTimeBg).Color = Color3.fromRGB(40, 40, 52)

local knobTime = Instance.new("Frame", switchTimeBg)
knobTime.Size = UDim2.new(0, 14, 0, 14)
knobTime.Position = UDim2.new(0, 3, 0.5, -7) 
knobTime.BackgroundColor3 = Color3.fromRGB(140, 140, 155)
Instance.new("UICorner", knobTime).CornerRadius = UDim.new(1, 0)

local btnTime = Instance.new("TextButton", switchTimeBg)
btnTime.Size = UDim2.new(1, 0, 1, 0)
btnTime.BackgroundTransparency = 1
btnTime.Text = ""

local timeOn = false
btnTime.MouseButton1Click:Connect(function()
	timeOn = not timeOn
	AnimasiSaklar(timeOn, switchTimeBg, knobTime)
	if timeOn then
		pcall(function()
			Lighting.ClockTime = tonumber(inputTime.Text) or 14
		end)
		TampilkanNotifikasiHijau("Custom World Time Aktif!")
	else
		Lighting.ClockTime = 12
		TampilkanNotifikasiHijau("World Time Direset.")
	end
end)

-- 3. FOV Customizer
local fovRow = Instance.new("Frame", pagePerf)
fovRow.Size = UDim2.new(1, -20, 0, 35)
fovRow.Position = UDim2.new(0, 10, 0, 128)
fovRow.BackgroundTransparency = 1

local fovLabel = Instance.new("TextLabel", fovRow)
fovLabel.Size = UDim2.new(0.5, 0, 1, 0)
fovLabel.BackgroundTransparency = 1
fovLabel.Text = "Custom FOV"
fovLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
fovLabel.Font = Enum.Font.Gotham
fovLabel.TextSize = 12
fovLabel.TextXAlignment = Enum.TextXAlignment.Left

local inputFov = Instance.new("TextBox", fovRow)
inputFov.Size = UDim2.new(0, 45, 0, 24)
inputFov.Position = UDim2.new(1, -100, 0.5, -12)
inputFov.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
inputFov.TextColor3 = Color3.fromRGB(240, 240, 250)
inputFov.Text = "90"
inputFov.Font = Enum.Font.Gotham
inputFov.TextSize = 11 
Instance.new("UICorner", inputFov).CornerRadius = UDim.new(0, 4)
Instance.new("UIStroke", inputFov).Color = Color3.fromRGB(38, 38, 48)

local switchFovBg = Instance.new("Frame", fovRow)
switchFovBg.Size = UDim2.new(0, 40, 0, 20)
switchFovBg.Position = UDim2.new(1, -40, 0.5, -10)
switchFovBg.BackgroundColor3 = Color3.fromRGB(18, 18, 24) 
Instance.new("UICorner", switchFovBg).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", switchFovBg).Color = Color3.fromRGB(40, 40, 52)

local knobFov = Instance.new("Frame", switchFovBg)
knobFov.Size = UDim2.new(0, 14, 0, 14)
knobFov.Position = UDim2.new(0, 3, 0.5, -7) 
knobFov.BackgroundColor3 = Color3.fromRGB(140, 140, 155)
Instance.new("UICorner", knobFov).CornerRadius = UDim.new(1, 0)

local btnFov = Instance.new("TextButton", switchFovBg)
btnFov.Size = UDim2.new(1, 0, 1, 0)
btnFov.BackgroundTransparency = 1
btnFov.Text = ""

local fovOn = false
btnFov.MouseButton1Click:Connect(function()
	fovOn = not fovOn
	AnimasiSaklar(fovOn, switchFovBg, knobFov)
	pcall(function()
		if fovOn then
			workspace.CurrentCamera.FieldOfView = tonumber(inputFov.Text) or 90
			TampilkanNotifikasiHijau("FOV Diubah!")
		else
			workspace.CurrentCamera.FieldOfView = 70
			TampilkanNotifikasiHijau("FOV Direset ke Default.")
		end
	end)
end)

-- 4. Tombol Rejoin & Server Hop
local actionRow = Instance.new("Frame", pagePerf)
actionRow.Size = UDim2.new(1, -20, 0, 35)
actionRow.Position = UDim2.new(0, 10, 0, 172)
actionRow.BackgroundTransparency = 1

local btnRejoin = Instance.new("TextButton", actionRow)
btnRejoin.Size = UDim2.new(0.48, 0, 0, 28)
btnRejoin.Position = UDim2.new(0, 0, 0.5, -14)
btnRejoin.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
btnRejoin.Text = "REJOIN SERVER"
btnRejoin.TextColor3 = Color3.fromRGB(220, 220, 235)
btnRejoin.Font = Enum.Font.GothamBold
btnRejoin.TextSize = 10
Instance.new("UICorner", btnRejoin).CornerRadius = UDim.new(0, 5)
Instance.new("UIStroke", btnRejoin).Color = Color3.fromRGB(45, 45, 58)

local btnHop = Instance.new("TextButton", actionRow)
btnHop.Size = UDim2.new(0.48, 0, 0, 28)
btnHop.Position = UDim2.new(0.52, 0, 0.5, -14)
btnHop.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
btnHop.Text = "SERVER HOP"
btnHop.TextColor3 = Color3.fromRGB(220, 220, 235)
btnHop.Font = Enum.Font.GothamBold
btnHop.TextSize = 10
Instance.new("UICorner", btnHop).CornerRadius = UDim.new(0, 5)
Instance.new("UIStroke", btnHop).Color = Color3.fromRGB(45, 45, 58)

btnRejoin.MouseButton1Click:Connect(function()
	pcall(function()
		TampilkanNotifikasiHijau("Rejoining server...")
		TeleportService:Teleport(PlaceId, player)
	end)
end)

btnHop.MouseButton1Click:Connect(function()
	pcall(function()
		TampilkanNotifikasiHijau("Mencari server lain...")
		local servers = game:GetService("HttpService")íst and game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=10"))
		if servers and servers.data then
			for _, s in pairs(servers.data) do
				if s.id ~= game.JobId and s.playing < s.maxPlayers then
					TeleportService:TeleportToPlaceInstance(PlaceId, s.id, player)
					break
				end
			end
		end
	end)
end)