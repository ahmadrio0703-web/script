-- ==========================================
-- LYNN MOD MENU - TAB VISUALS (EASY COLOR PICKER)
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

-- Tabel Pilihan Warna Siap Pakai
local pilihanWarna = {
	{nama = "Putih", warna = Color3.fromRGB(255, 255, 255)},
	{nama = "Merah", warna = Color3.fromRGB(255, 50, 50)},
	{nama = "Hijau", warna = Color3.fromRGB(50, 255, 50)},
	{nama = "Biru", warna = Color3.fromRGB(50, 150, 255)},
	{nama = "Kuning", warna = Color3.fromRGB(255, 220, 50)},
	{nama = "Ungu", warna = Color3.fromRGB(180, 50, 255)},
}

local function BuatRowESP(parent, posY, judul, callbackWarnaBerubah)
	local row = Instance.new("Frame", parent)
	row.Size = UDim2.new(1, -20, 0, 35)
	row.Position = UDim2.new(0, 10, 0, posY)
	row.BackgroundTransparency = 1
	
	local label = Instance.new("TextLabel", row)
	label.Size = UDim2.new(0.35, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Text = judul
	label.TextColor3 = Color3.fromRGB(210, 210, 220)
	label.Font = Enum.Font.Gotham
	label.TextSize = 11
	label.TextXAlignment = Enum.TextXAlignment.Left
	
	-- Tombol Indikator Warna (Sekaligus untuk mengganti warna saat diklik)
	local btnWarna = Instance.new("TextButton", row)
	btnWarna.Size = UDim2.new(0, 55, 0, 22)
	btnWarna.Position = UDim2.new(1, -105, 0.5, -11)
	btnWarna.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	btnWarna.Text = "Warna"
	btnWarna.TextColor3 = Color3.fromRGB(20, 20, 20)
	btnWarna.Font = Enum.Font.GothamBold
	btnWarna.TextSize = 9
	Instance.new("UICorner", btnWarna).CornerRadius = UDim.new(0, 4)
	
	local currentIndex = 1
	btnWarna.MouseButton1Click:Connect(function()
		currentIndex = currentIndex + 1
		if currentIndex > #pilihanWarna then currentIndex = 1 end
		local selected = pilihanWarna[currentIndex]
		btnWarna.BackgroundColor3 = selected.warna
		btnWarna.Text = selected.nama
		-- Ubah teks jadi gelap/terang otomatis agar terbaca
		if selected.nama == "Putih" or selected.nama == "Kuning" then
			btnWarna.TextColor3 = Color3.fromRGB(20, 20, 20)
		else
			btnWarna.TextColor3 = Color3.fromRGB(255, 255, 255)
		end
		if callbackWarnaBerubah then
			callbackWarnaBerubah(selected.warna)
		end
	end)
	-- Set default awal
	btnWarna.BackgroundColor3 = pilihanWarna[1].warna
	btnWarna.Text = pilihanWarna[1].nama
	btnWarna.TextColor3 = Color3.fromRGB(20, 20, 20)

	-- Saklar On/Off
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
	
	return btn, switchBg, knob, function() return pilihanWarna[currentIndex].warna end
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

-- ==========================================
-- 1. ESP BOX
-- ==========================================
local warnaBoxAktif = pilihanWarna[1].warna
local btnEspBox, bgEspBox, knobEspBox, GetWarnaBox = BuatRowESP(pageVisual, 10, "ESP Box", function(w)
	warnaBoxAktif = w
	RefreshEspBoxKondisional()
end)
local espBoxOn = false

local function RefreshEspBoxKondisional()
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
				frame.BackgroundTransparency = 1
				local stroke = Instance.new("UIStroke", frame)
				stroke.Color = warnaBoxAktif
				stroke.Thickness = 1.5
				
				bill.Parent = p.Character
			end
		end
	end
end

btnEspBox.MouseButton1Click:Connect(function()
	espBoxOn = not espBoxOn
	AnimasiSaklar(espBoxOn, bgEspBox, knobEspBox)
	warnaBoxAktif = GetWarnaBox()
	RefreshEspBoxKondisional()
	TampilkanNotifikasiHijau(espBoxOn and "ESP Box Aktif!" or "ESP Box Mati.")
end)

-- ==========================================
-- 2. ESP NAMA
-- ==========================================
local warnaNamaAktif = pilihanWarna[2].warna -- Default Hijau
local btnEspName, bgEspName, knobEspName, GetWarnaName = BuatRowESP(pageVisual, 50, "ESP Nama", function(w)
	warnaNamaAktif = w
	RefreshEspNameKondisional()
end)
local espNameOn = false

local function RefreshEspNameKondisional()
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
				txt.Size = UDim2.new(1, 0, 1, 0)
				txt.BackgroundTransparency = 1
				txt.Text = p.Name
				txt.TextColor3 = warnaNamaAktif
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
	warnaNamaAktif = GetWarnaName()
	RefreshEspNameKondisional()
	TampilkanNotifikasiHijau(espNameOn and "ESP Nama Aktif!" or "ESP Nama Mati.")
end)

-- ==========================================
-- 3. ESP JARAK (DISTANCE)
-- ==========================================
local warnaDistAktif = pilihanWarna[5].warna -- Default Kuning
local btnEspDist, bgEspDist, knobEspDist, GetWarnaDist = BuatRowESP(pageVisual, 90, "ESP Jarak", function(w)
	warnaDistAktif = w
	RefreshEspDistKondisional()
end)
local espDistOn = false
local distConnection = nil

local function RefreshEspDistKondisional()
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
				txt.TextColor3 = warnaDistAktif
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
								txt.TextColor3 = warnaDistAktif
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
	warnaDistAktif = GetWarnaDist()
	RefreshEspDistKondisional()
	TampilkanNotifikasiHijau(espDistOn and "ESP Jarak Aktif!" or "ESP Jarak Mati.")
end)

-- ==========================================
-- 4. FULLBRIGHT
-- ==========================================
local fbRow = Instance.new("Frame", pageVisual)
fbRow.Size = UDim2.new(1, -20, 0, 35)
fbRow.Position = UDim2.new(0, 10, 0, 135)
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
-- 5. CUSTOM OBJECT ESP (KEYWORD SEARCH + BUTTON COLOR)
-- ==========================================
local objRow = Instance.new("Frame", pageVisual)
objRow.Size = UDim2.new(1, -20, 0, 55)
objRow.Position = UDim2.new(0, 10, 0, 178)
objRow.BackgroundTransparency = 1

local objLabel = Instance.new("TextLabel", objRow)
objLabel.Size = UDim2.new(1, 0, 0, 18)
objLabel.BackgroundTransparency = 1
objLabel.Text = "Custom Object ESP"
objLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
objLabel.Font = Enum.Font.Gotham
objLabel.TextSize = 11
objLabel.TextXAlignment = Enum.TextXAlignment.Left

-- TextBox Keyword Objek
local inputObjKeyword = Instance.new("TextBox", objRow)
inputObjKeyword.Size = UDim2.new(0, 95, 0, 24)
inputObjKeyword.Position = UDim2.new(0, 0, 0, 24)
inputObjKeyword.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
inputObjKeyword.TextColor3 = Color3.fromRGB(240, 240, 250)
inputObjKeyword.PlaceholderText = "kata kunci..."
inputObjKeyword.Text = ""
inputObjKeyword.Font = Enum.Font.Gotham
inputObjKeyword.TextSize = 10 
Instance.new("UICorner", inputObjKeyword).CornerRadius = UDim.new(0, 4)
Instance.new("UIStroke", inputObjKeyword).Color = Color3.fromRGB(38, 38, 48)

-- Tombol Ganti Warna Object ESP
local btnObjWarna = Instance.new("TextButton", objRow)
btnObjWarna.Size = UDim2.new(0, 55, 0, 24)
btnObjWarna.Position = UDim2.new(0, 101, 0, 24)
btnObjWarna.BackgroundColor3 = pilihanWarna[5].warna -- Kuning
btnObjWarna.Text = "Kuning"
btnObjWarna.TextColor3 = Color3.fromRGB(20, 20, 20)
btnObjWarna.Font = Enum.Font.GothamBold
btnObjWarna.TextSize = 9
Instance.new("UICorner", btnObjWarna).CornerRadius = UDim.new(0, 4)

local objColorIndex = 5
btnObjWarna.MouseButton1Click:Connect(function()
	objColorIndex = objColorIndex + 1
	if objColorIndex > #pilihanWarna then objColorIndex = 1 end
	local selected = pilihanWarna[objColorIndex]
	btnObjWarna.BackgroundColor3 = selected.warna
	btnObjWarna.Text = selected.nama
	if selected.nama == "Putih" or selected.nama == "Kuning" then
		btnObjWarna.TextColor3 = Color3.fromRGB(20, 20, 20)
	else
		btnObjWarna.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end)

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
					local warnaObjPilihan = pilihanWarna[objColorIndex].warna
					local count = 0
					
					for _, obj in pairs(workspace:GetDescendants()) do
						if (obj:IsA("BasePart") or obj:IsA("Model")) then
							if string.find(string.lower(obj.Name), keyword) then
								count = count + 1
								if count > 100 then break end
								
								local hl = Instance.new("Highlight")
								hl.Name = "CustomObjectESP"
								hl.FillColor = warnaObjPilihan
								hl.OutlineColor = Color3.fromRGB(255, 255, 255)
								hl.FillTransparency = 0.5
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
