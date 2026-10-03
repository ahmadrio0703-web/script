-- ==========================================
-- LYNN MOD MENU - TAB VISUALS (CUSTOM COLOR & TRANSPARENCY)
-- ==========================================
local pageVisual, menuGui = ... -- Menerima parameter operan dari script utama
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
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

-- Variabel Pengaturan Warna Global & Transparansi Default
local customWarnaGlobal = Color3.fromRGB(255, 255, 255)
local customTransparanGlobal = 0.5 -- 0.0 (Solid/Pekat) sampai 1.0 (Transparan total)
local RefreshEspPlayerGlobal = nil

-- ==========================================
-- MENU PENGATURAN WARNA CUSTOM & TRANSPARANSI
-- ==========================================
local settingsColorRow = Instance.new("Frame", pageVisual)
settingsColorRow.Size = UDim2.new(1, -20, 0, 70)
settingsColorRow.Position = UDim2.new(0, 10, 0, 10)
settingsColorRow.BackgroundTransparency = 1

local colorTitle = Instance.new("TextLabel", settingsColorRow)
colorTitle.Size = UDim2.new(1, 0, 0, 20)
colorTitle.BackgroundTransparency = 1
colorTitle.Text = "PENGATURAN WARNA & TRANSPARANSI ESP"
colorTitle.TextColor3 = Color3.fromRGB(220, 220, 235)
colorTitle.Font = Enum.Font.GothamBold
colorTitle.TextSize = 11
colorTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Input Custom RGB (Contoh: 255,100,50)
local labelRgb = Instance.new("TextLabel", settingsColorRow)
labelRgb.Size = UDim2.new(0.4, 0, 0, 24)
labelRgb.Position = UDim2.new(0, 0, 0, 28)
labelRgb.BackgroundTransparency = 1
labelRgb.Text = "Kode Warna (R,G,B):"
labelRgb.TextColor3 = Color3.fromRGB(180, 180, 195)
labelRgb.Font = Enum.Font.Gotham
labelRgb.TextSize = 10.5
labelRgb.TextXAlignment = Enum.TextXAlignment.Left

local inputCustomRgb = Instance.new("TextBox", settingsColorRow)
inputCustomRgb.Size = UDim2.new(0, 110, 0, 24)
inputCustomRgb.Position = UDim2.new(1, -110, 0, 28)
inputCustomRgb.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
inputCustomRgb.TextColor3 = Color3.fromRGB(240, 240, 250)
inputCustomRgb.Text = "255,255,255"
inputCustomRgb.PlaceholderText = "255,255,255"
inputCustomRgb.Font = Enum.Font.Gotham
inputCustomRgb.TextSize = 10 
Instance.new("UICorner", inputCustomRgb).CornerRadius = UDim.new(0, 4)
Instance.new("UIStroke", inputCustomRgb).Color = Color3.fromRGB(38, 38, 48)

-- Input Transparansi (Angka 0.0 sampai 1.0)
local labelAlpha = Instance.new("TextLabel", settingsColorRow)
labelAlpha.Size = UDim2.new(0.4, 0, 0, 24)
labelAlpha.Position = UDim2.new(0, 0, 0, 56)
labelAlpha.BackgroundTransparency = 1
labelAlpha.Text = "Transparansi (0 - 1):"
labelAlpha.TextColor3 = Color3.fromRGB(180, 180, 195)
labelAlpha.Font = Enum.Font.Gotham
labelAlpha.TextSize = 10.5
labelAlpha.TextXAlignment = Enum.TextXAlignment.Left

local inputCustomAlpha = Instance.new("TextBox", settingsColorRow)
inputCustomAlpha.Size = UDim2.new(0, 110, 0, 24)
inputCustomAlpha.Position = UDim2.new(1, -110, 0, 56)
inputCustomAlpha.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
inputCustomAlpha.TextColor3 = Color3.fromRGB(240, 240, 250)
inputCustomAlpha.Text = "0.5"
inputCustomAlpha.PlaceholderText = "0.0 - 1.0"
inputCustomAlpha.Font = Enum.Font.Gotham
inputCustomAlpha.TextSize = 10 
Instance.new("UICorner", inputCustomAlpha).CornerRadius = UDim.new(0, 4)
Instance.new("UIStroke", inputCustomAlpha).Color = Color3.fromRGB(38, 38, 48)

local function ParseCustomColor(text)
	local r, g, b = text:match("([^,]+),([^,]+),([^,]+)")
	if r and g and b then
		return Color3.fromRGB(tonumber(r) or 255, tonumber(g) or 255, tonumber(b) or 255)
	end
	return Color3.fromRGB(255, 255, 255)
end

-- Update otomatis saat kotak teks RGB/Alpha selesai diketik
inputCustomRgb.FocusLost:Connect(function()
	customWarnaGlobal = ParseCustomColor(inputCustomRgb.Text)
	TampilkanNotifikasiHijau("Warna Custom Diperbarui!")
	if RefreshEspPlayerGlobal then RefreshEspPlayerGlobal() end
end)

inputCustomAlpha.FocusLost:Connect(function()
	local val = tonumber(inputCustomAlpha.Text)
	if val then
		if val < 0 then val = 0 elseif val > 1 then val = 1 end
		customTransparanGlobal = val
		TampilkanNotifikasiHijau("Transparansi Diatur ke: " .. val)
		if RefreshEspPlayerGlobal then RefreshEspPlayerGlobal() end
	end
end)

local function BuatRowSaklarStandar(parent, posY, judul)
	local row = Instance.new("Frame", parent)
	row.Size = UDim2.new(1, -20, 0, 35)
	row.Position = UDim2.new(0, 10, 0, posY)
	row.BackgroundTransparency = 1
	
	local label = Instance.new("TextLabel", row)
	label.Size = UDim2.new(0.6, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Text = judul
	label.TextColor3 = Color3.fromRGB(210, 210, 220)
	label.Font = Enum.Font.Gotham
	label.TextSize = 11
	label.TextXAlignment = Enum.TextXAlignment.Left
	
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
	
	return btn, switchBg, knob
end

local warnaBgOff = Color3.fromRGB(18, 18, 24)
local warnaBgOn = Color3.fromRGB(220, 220, 235) 
local posKnobOff = UDim2.new(0, 3, 0.5, -7)
local posKnobOn = UDim2.new(1, -17, 0.5, -7)

local function AnimasiSaklar(isOn, bg, knob)
	TweenService:Create(bg, TweenInfo.new(0.25), {BackgroundColor3 = isOn and warnaBgOn or warnaBgOff}):Play()
	TweenService:Create(knob, TweenInfo.new(0.25), {Position = isOn and posKnobOn or posKnobOff, BackgroundColor3 = isOn and Color3.fromRGB(10,10,15) or Color3.fromRGB(140,140,155)}):Play()
end

-- ==========================================
-- 1. ESP BOX
-- ==========================================
local btnEspBox, bgEspBox, knobEspBox = BuatRowSaklarStandar(pageVisual, 85, "ESP Box Player")
local espBoxOn = false

local function RebuildEspBox()
	for _, p in pairs(Players:GetPlayers()) do
		if p ~= player and p.Character and p.Character:FindFirstChild("LynnBoxESP") then 
			p.Character.LynnBoxESP:Destroy() 
		end
	end
	if espBoxOn then
		for _, p in pairs(Players:GetPlayers()) do
			if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
				local bill = Instance.new("BillboardGui")
				bill.Name = "LynnBoxESP"
				bill.Adornee = p.Character.HumanoidRootPart
				bill.Size = UDim2.new(4, 0, 5.5, 0)
				bill.AlwaysOnTop = true
				
				local frame = Instance.new("Frame", bill)
				frame.Size = UDim2.new(1, 0, 1, 0)
				frame.BackgroundTransparency = customTransparanGlobal -- Mengikuti tingkat transparansi
				frame.BackgroundColor3 = customWarnaGlobal
				
				local stroke = Instance.new("UIStroke", frame)
				stroke.Color = customWarnaGlobal
				stroke.Thickness = 1.5
				
				bill.Parent = p.Character
			end
		end
	end
end

btnEspBox.MouseButton1Click:Connect(function()
	espBoxOn = not espBoxOn
	AnimasiSaklar(espBoxOn, bgEspBox, knobEspBox)
	RebuildEspBox()
	TampilkanNotifikasiHijau(espBoxOn and "ESP Box Aktif!" or "ESP Box Mati.")
end)

-- ==========================================
-- 2. ESP NAMA
-- ==========================================
local btnEspName, bgEspName, knobEspName = BuatRowSaklarStandar(pageVisual, 125, "ESP Nama Player")
local espNameOn = false

local function RebuildEspName()
	for _, p in pairs(Players:GetPlayers()) do
		if p ~= player and p.Character and p.Character:FindFirstChild("LynnNameESP") then 
			p.Character.LynnNameESP:Destroy() 
		end
	end
	if espNameOn then
		for _, p in pairs(Players:GetPlayers()) do
			if p ~= player and p.Character and p.Character:FindFirstChild("Head") then
				local bill = Instance.new("BillboardGui")
				bill.Name = "LynnNameESP"
				bill.Adornee = p.Character.Head
				bill.Size = UDim2.new(0, 100, 0, 30)
				bill.StudsOffset = Vector3.new(0, 2, 0)
				bill.AlwaysOnTop = true
				
				local txt = Instance.new("TextLabel", bill)
				txt.Name = "NameText"
				txt.Size = UDim2.new(1, 0, 1, 0)
				txt.BackgroundTransparency = 1
				txt.Text = p.Name
				txt.TextColor3 = customWarnaGlobal
				txt.TextTransparency = customTransparanGlobal -- Mengikuti transparansi teks
				txt.Font = Enum.Font.GothamBold
				txt.TextSize = 11
				txt.TextStrokeTransparency = 0.4
				
				bill.Parent = p.Character
			end
		end
	end
end

btnEspName.MouseButton1Click:Connect(function()
	espNameOn = not espNameOn
	AnimasiSaklar(espNameOn, bgEspName, knobEspName)
	RebuildEspName()
	TampilkanNotifikasiHijau(espNameOn and "ESP Nama Aktif!" or "ESP Nama Mati.")
end)

-- ==========================================
-- 3. ESP JARAK (DISTANCE)
-- ==========================================
local btnEspDist, bgEspDist, knobEspDist = BuatRowSaklarStandar(pageVisual, 165, "ESP Jarak (Distance)")
local espDistOn = false
local distConnection = nil

local function RebuildEspDist()
	for _, p in pairs(Players:GetPlayers()) do
		if p ~= player and p.Character and p.Character:FindFirstChild("LynnDistESP") then 
			p.Character.LynnDistESP:Destroy() 
		end
	end
	if distConnection then distConnection:Disconnect() end
	
	if espDistOn then
		for _, p in pairs(Players:GetPlayers()) do
			if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
				local bill = Instance.new("BillboardGui")
				bill.Name = "LynnDistESP"
				bill.Adornee = p.Character.HumanoidRootPart
				bill.Size = UDim2.new(0, 100, 0, 30)
				bill.StudsOffset = Vector3.new(0, -3, 0)
				bill.AlwaysOnTop = true
				
				local txt = Instance.new("TextLabel", bill)
				txt.Name = "DistText"
				txt.Size = UDim2.new(1, 0, 1, 0)
				txt.BackgroundTransparency = 1
				txt.TextColor3 = customWarnaGlobal
				txt.TextTransparency = customTransparanGlobal
				txt.Font = Enum.Font.GothamBold
				txt.TextSize = 10
				txt.TextStrokeTransparency = 0.4
				
				bill.Parent = p.Character
			end
		end
		
		distConnection = RunService.RenderStepped:Connect(function()
			pcall(function()
				local myChar = player.Character
				local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
				if not myRoot then return end
				
				for _, p in pairs(Players:GetPlayers()) do
					if p ~= player and p.Character then
						local root = p.Character:FindFirstChild("HumanoidRootPart")
						local bill = p.Character:FindFirstChild("LynnDistESP")
						if root and bill then
							local txt = bill:FindFirstChild("DistText")
							if txt then
								local dist = math.floor((myRoot.Position - root.Position).Magnitude)
								txt.Text = "[" .. dist .. "m]"
								txt.TextColor3 = customWarnaGlobal
								txt.TextTransparency = customTransparanGlobal
							end
						end
					end
				end
			end)
		end)
	end
end

btnEspDist.MouseButton1Click:Connect(function()
	espDistOn = not espDistOn
	AnimasiSaklar(espDistOn, bgEspDist, knobEspDist)
	RebuildEspDist()
	TampilkanNotifikasiHijau(espDistOn and "ESP Jarak Aktif!" or "ESP Jarak Mati.")
end)

-- Hubungkan Fungsi Global
RefreshEspPlayerGlobal = function()
	if espBoxOn then RebuildEspBox() end
	if espNameOn then RebuildEspName() end
	if espDistOn then RebuildEspDist() end
end

-- ==========================================
-- 4. FULLBRIGHT
-- ==========================================
local fbRow = Instance.new("Frame", pageVisual)
fbRow.Size = UDim2.new(1, -20, 0, 35)
fbRow.Position = UDim2.new(0, 10, 0, 210)
fbRow.BackgroundTransparency = 1

local fbLabel = Instance.new("TextLabel", fbRow)
fbLabel.Size = UDim2.new(0.5, 0, 1, 0)
fbLabel.BackgroundTransparency = 1
fbLabel.Text = "Fullbright"
fbLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
fbLabel.Font = Enum.Font.Gotham
fbLabel.TextSize = 11
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

btnFullbright.MouseButton1Click:Connect(function()
	fullbrightOn = not fullbrightOn
	AnimasiSaklar(fullbrightOn, switchFbBg, knobFb)
	if fullbrightOn then
		Lighting.Brightness = tonumber(inputBrightness.Text) or 3
		Lighting.ClockTime = 14 
		Lighting.GlobalShadows = false
		Lighting.FogEnd = 99999
		TampilkanNotifikasiHijau("Fullbright Aktif!")
	else
		Lighting.Brightness = originalBrightness
		Lighting.ClockTime = originalClock
		Lighting.GlobalShadows = originalShadows
		TampilkanNotifikasiHijau("Fullbright Dimatikan.")
	end
end)

-- ==========================================
-- 5. CUSTOM OBJECT ESP
-- ==========================================
local objRow = Instance.new("Frame", pageVisual)
objRow.Size = UDim2.new(1, -20, 0, 55)
objRow.Position = UDim2.new(0, 10, 0, 255)
objRow.BackgroundTransparency = 1

local objLabel = Instance.new("TextLabel", objRow)
objLabel.Size = UDim2.new(1, 0, 0, 18)
objLabel.BackgroundTransparency = 1
objLabel.Text = "Custom Object ESP"
objLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
objLabel.Font = Enum.Font.Gotham
objLabel.TextSize = 11
objLabel.TextXAlignment = Enum.TextXAlignment.Left

local inputObjKeyword = Instance.new("TextBox", objRow)
inputObjKeyword.Size = UDim2.new(0, 115, 0, 24)
inputObjKeyword.Position = UDim2.new(0, 0, 0, 24)
inputObjKeyword.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
inputObjKeyword.TextColor3 = Color3.fromRGB(240, 240, 250)
inputObjKeyword.PlaceholderText = "kata kunci..."
inputObjKeyword.Text = ""
inputObjKeyword.Font = Enum.Font.Gotham
inputObjKeyword.TextSize = 10 
Instance.new("UICorner", inputObjKeyword).CornerRadius = UDim.new(0, 4)
Instance.new("UIStroke", inputObjKeyword).Color = Color3.fromRGB(38, 38, 48)

local switchObjBg = Instance.new("Frame", objRow)
switchObjBg.Size = UDim2.new(0, 40, 0, 20)
switchObjBg.Position = UDim2.new(1, -40, 0, 26)
switchObjBg.BackgroundColor3 = Color3.fromRGB(18, 18, 24) 
Instance.new("UICorner", switchObjBg).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", switchObjBg).Color = Color3.fromRGB(40, 40, 52)

local knobObj = Instance.new("Frame", switchObjBg)
knobObj.Size = UDim2.new(0, 14, 0, 14)
knobObj.Position = UDim2.new(0, 3, 0.5, -7) 
knobObj.BackgroundColor3 = Color3.fromRGB(140, 140, 155)
Instance.new("UICorner", knobObj).CornerRadius = UDim.new(1, 0)

local btnObjEsp = Instance.new("TextButton", switchObjBg)
btnObjEsp.Size = UDim2.new(1, 0, 1, 0)
btnObjEsp.BackgroundTransparency = 1
btnObjEsp.Text = ""

local objEspActive = false
local customHighlights = {}

local function ClearCustomHighlights()
	for _, h in pairs(customHighlights) do
		if h then h:Destroy() end
	end
	customHighlights = {}
end

btnObjEsp.MouseButton1Click:Connect(function()
	objEspActive = not objEspActive
	AnimasiSaklar(objEspActive, switchObjBg, knobObj)
	
	if objEspActive then
		local keyword = string.lower(inputObjKeyword.Text)
		if keyword == "" then
			TampilkanNotifikasiHijau("⚠️ Masukkan kata kunci objek dulu!")
			objEspActive = false
			AnimasiSaklar(false, switchObjBg, knobObj)
			return
		end
		
		TampilkanNotifikasiHijau("Mencari objek '" .. keyword .. "'...")
		task.spawn(function()
			while objEspActive do
				pcall(function()
					ClearCustomHighlights()
					local count = 0
					
					for _, obj in pairs(workspace:GetDescendants()) do
						if (obj:IsA("BasePart") or obj:IsA("Model")) then
							if string.find(string.lower(obj.Name), keyword) then
								count = count + 1
								if count > 100 then break end
								
								local hl = Instance.new("Highlight")
								hl.Name = "CustomObjectESP"
								hl.FillColor = customWarnaGlobal
								hl.OutlineColor = Color3.fromRGB(255, 255, 255)
								hl.FillTransparency = customTransparanGlobal -- Mengikuti tingkat transparansi custom
								hl.OutlineTransparency = 0.2
								hl.Adornee = obj
								hl.Parent = menuGui
								
								table.insert(customHighlights, hl)
							end
						end
					end
				end)
				task.wait(3)
			end
		end)
	else
		ClearCustomHighlights()
		TampilkanNotifikasiHijau("Custom Object ESP Dimatikan.")
	end
end)
