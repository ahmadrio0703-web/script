-- ==========================================
-- LYNN MOD MENU - TAB VISUALS (EXTERNAL FILE)
-- ==========================================
local pageVisual, menuGui = ... -- Menerima parameter operan dari script utama
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

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
local warnaKnobOn = Color3.fromRGB(10, 10, 15)
local warnaKnobOff = Color3.fromRGB(140, 140, 155)

local function AnimasiSaklar(isOn, bg, knob)
	TweenService:Create(bg, TweenInfo.new(0.25), {BackgroundColor3 = isOn and warnaBgOn or warnaBgOff}):Play()
	TweenService:Create(knob, TweenInfo.new(0.25), {Position = isOn and posKnobOn or posKnobOff, BackgroundColor3 = isOn and warnaKnobOn or warnaKnobOff}):Play()
end

-- INISIALISASI FITUR VISUALS
local btnEsp, bgEsp, knobEsp, _ = BuatRowSaklar(pageVisual, 15, "ESP Box", "", false)
local espOn = false

local fbRow = Instance.new("Frame", pageVisual)
fbRow.Size = UDim2.new(1, -20, 0, 35)
fbRow.Position = UDim2.new(0, 10, 0, 60)
fbRow.BackgroundTransparency = 1

local fbLabel = Instance.new("TextLabel", fbRow)
fbLabel.Size = UDim2.new(0.5, 0, 1, 0)
fbLabel.BackgroundTransparency = 1
fbLabel.Text = "Fullbright"
fbLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
fbLabel.Font = Enum.Font.Gotham
fbLabel.TextSize = 12
fbLabel.TextXAlignment = Enum.TextXAlignment.Left

local inputBrightness = Instance.new("TextBox", fbRow)
inputBrightness.Size = UDim2.new(0, 45, 0, 24)
inputBrightness.Position = UDim2.new(1, -100, 0.5, -12)
inputBrightness.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
inputBrightness.TextColor3 = Color3.fromRGB(240, 240, 250)
inputBrightness.Text = "3" 
inputBrightness.Font = Enum.Font.Gotham 
inputBrightness.TextSize = 11 
Instance.new("UICorner", inputBrightness).CornerRadius = UDim.new(0, 4)
Instance.new("UIStroke", inputBrightness).Color = Color3.fromRGB(38, 38, 48)

local switchFbBg = Instance.new("Frame", fbRow)
switchFbBg.Size = UDim2.new(0, 40, 0, 20)
switchFbBg.Position = UDim2.new(1, -40, 0.5, -10)
switchFbBg.BackgroundColor3 = Color3.fromRGB(18, 18, 24) 
Instance.new("UICorner", switchFbBg).CornerRadius = UDim.new(1, 0)
local fbStroke = Instance.new("UIStroke", switchFbBg)
fbStroke.Color = Color3.fromRGB(40, 40, 52)
fbStroke.Thickness = 1

local knobFb = Instance.new("Frame", switchFbBg)
knobFb.Size = UDim2.new(0, 14, 0, 14)
knobFb.Position = UDim2.new(0, 3, 0.5, -7) 
knobFb.BackgroundColor3 = Color3.fromRGB(140, 140, 155)
Instance.new("UICorner", knobFb).CornerRadius = UDim.new(1, 0)

local btnFullbright = Instance.new("TextButton", switchFbBg)
btnFullbright.Size = UDim2.new(1, 0, 1, 0)
btnFullbright.BackgroundTransparency = 1
btnFullbright.Text = ""

local fullbrightOn = false
local originalBrightness = Lighting.Brightness
local originalClock = Lighting.ClockTime
local originalShadows = Lighting.GlobalShadows

local function UpdateFullbright()
	if fullbrightOn then
		local customBrightness = tonumber(inputBrightness.Text) or 3
		Lighting.Brightness = customBrightness
		Lighting.ClockTime = 14 
		Lighting.GlobalShadows = false
		Lighting.FogEnd = 99999
	else
		Lighting.Brightness = originalBrightness
		Lighting.ClockTime = originalClock
		Lighting.GlobalShadows = originalShadows
	end
end

btnFullbright.MouseButton1Click:Connect(function()
	fullbrightOn = not fullbrightOn
	AnimasiSaklar(fullbrightOn, switchFbBg, knobFb)
	UpdateFullbright()
	if fullbrightOn then
		TampilkanNotifikasiHijau("Fullbright Aktif!")
	else
		TampilkanNotifikasiHijau("Fullbright Dimatikan.")
	end
end)

local function refreshESP()
	for _, p in pairs(Players:GetPlayers()) do
		if p ~= player and p.Character and p.Character:FindFirstChild("KotakESP") then p.Character.KotakESP:Destroy() end
	end
	if espOn then
		for _, p in pairs(Players:GetPlayers()) do
			if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
				local bill = Instance.new("BillboardGui")
				bill.Name = "KotakESP"
				bill.Adornee = p.Character.HumanoidRootPart
				bill.Size = UDim2.new(4, 0, 5.5, 0)
				bill.AlwaysOnTop = true
				
				local frame = Instance.new("Frame", bill)
				frame.Size = UDim2.new(1, 0, 1, 0)
				frame.BackgroundTransparency = 1
				local stroke = Instance.new("UIStroke", frame)
				stroke.Color = Color3.fromRGB(220, 220, 235) 
				stroke.Thickness = 1.5
				bill.Parent = p.Character
			end
		end
		TampilkanNotifikasiHijau("ESP Box Aktif!")
	else
		TampilkanNotifikasiHijau("ESP Box Dimatikan.")
	end
end

btnEsp.MouseButton1Click:Connect(function() 
	espOn = not espOn 
	AnimasiSaklar(espOn, bgEsp, knobEsp) 
	refreshESP() 
end)