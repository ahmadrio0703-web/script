-- ==========================================
-- LYNN MOD MENU - TAB VISUALS (MASTER COLOR ESP)
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

-- Daftar Pilihan Warna Master yang Jauh Lebih Banyak & Lengkap
local daftarWarnaMaster = {
	{nama = "Putih Bersih", warna = Color3.fromRGB(255, 255, 255)},
	{nama = "Merah Menyala", warna = Color3.fromRGB(255, 40, 40)},
	{nama = "Hijau Terang", warna = Color3.fromRGB(40, 255, 90)},
	{nama = "Biru Elektrik", warna = Color3.fromRGB(40, 140, 255)},
	{nama = "Kuning Emas", warna = Color3.fromRGB(255, 215, 0)},
	{nama = "Ungu Neon", warna = Color3.fromRGB(190, 50, 255)},
	{nama = "Pink Magenta", warna = Color3.fromRGB(255, 50, 180)},
	{nama = "Cyan / Tosca", warna = Color3.fromRGB(0, 255, 230)},
	{nama = "Oranye Sunset", warna = Color3.fromRGB(255, 120, 20)},
	{nama = "Lime Terang", warna = Color3.fromRGB(170, 255, 0)},
}
local warnaGlobalIndex = 1

-- ==========================================
-- MENU UTAMA: MASTER COLOR PICKER (PENGATUR WARNA GLOBAL ESP PLAYER)
-- ==========================================
local colorRow = Instance.new("Frame", pageVisual)
colorRow.Size = UDim2.new(1, -20, 0, 35)
colorRow.Position = UDim2.new(0, 10, 0, 10)
colorRow.BackgroundTransparency = 1

local colorLabel = Instance.new("TextLabel", colorRow)
colorLabel.Size = UDim2.new(0.45, 0, 1, 0)
colorLabel.BackgroundTransparency = 1
colorLabel.Text = "Warna ESP Player"
colorLabel.TextColor3 = Color3.fromRGB(230, 230, 240)
colorLabel.Font = Enum.Font.GothamBold
colorLabel.TextSize = 11.5
colorLabel.TextXAlignment = Enum.TextXAlignment.Left

local btnMasterColor = Instance.new("TextButton", colorRow)
btnMasterColor.Size = UDim2.new(0, 130, 0, 24)
btnMasterColor.Position = UDim2.new(1, -130, 0.5, -12)
btnMasterColor.BackgroundColor3 = daftarWarnaMaster[1].warna
btnMasterColor.Text = daftarWarnaMaster[1].nama
btnMasterColor.TextColor3 = Color3.fromRGB(20, 20, 20)
btnMasterColor.Font = Enum.Font.GothamBold
btnMasterColor.TextSize = 10
Instance.new("UICorner", btnMasterColor).CornerRadius = UDim.new(0, 5)
Instance.new("UIStroke", btnMasterColor).Color = Color3.fromRGB(50, 50, 70)

-- Fungsi Global Update Warna ke Semua ESP yang Aktif
local RefreshEspPlayerGlobal = nil -- Akan diisi nanti

btnMasterColor.MouseButton1Click:Connect(function()
	warnaGlobalIndex = warnaGlobalIndex + 1
	if warnaGlobalIndex > #daftarWarnaMaster then warnaGlobalIndex = 1 end
	local selected = daftarWarnaMaster[warnaGlobalIndex]
	
	btnMasterColor.BackgroundColor3 = selected.warna
	btnMasterColor.Text = selected.nama
	
	-- Menyesuaikan warna teks tombol agar tetap terbaca jelas
	if selected.nama == "Putih Bersih" or selected.nama == "Kuning Emas" or selected.nama == "Lime Terang" or selected.nama == "Cyan / Tosca" then
		btnMasterColor.TextColor3 = Color3.fromRGB(20, 20, 20)
	else
		btnMasterColor.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
	
	TampilkanNotifikasiHijau("Warna ESP diubah ke: "  .. selected.nama)
	
	-- Refresh otomatis semua ESP player yang sedang aktif
	if RefreshEspPlayerGlobal then
		RefreshEspPlayerGlobal()
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
local btnEspBox, bgEspBox, knobEspBox = BuatRowSaklarStandar(pageVisual, 50, "ESP Box Player")
local espBoxOn = false

local function RebuildEspBox()
	for _, p in pairs(Players:GetPlayers()) do
		if p ~= player and p.Character and p.Character:FindFirstChild("LynnBoxESP") then 
			p.Character.LynnBoxESP:Destroy() 
		end
	end
	if espBoxOn then
		local warnaAktif = daftarWarnaMaster[warnaGlobalIndex].warna
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
				stroke.Color = warnaAktif
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
local btnEspName, bgEspName, knobEspName = BuatRowSaklarStandar(pageVisual, 90, "ESP Nama Player")
local espNameOn = false

local function RebuildEspName()
	for _, p in pairs(Players:GetPlayers()) do
		if p ~= player and p.Character and p.Character:FindFirstChild("LynnNameESP") then 
			p.Character.LynnNameESP:Destroy() 
		end
	end
	if espNameOn then
		local warnaAktif = daftarWarnaMaster[warnaGlobalIndex].warna
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
				txt.TextColor3 = warnaAktif
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
local btnEspDist, bgEspDist, knobEspDist = BuatRowSaklarStandar(pageVisual, 130, "ESP Jarak (Distance)")
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
		local warnaAktif = daftarWarnaMaster[warnaGlobalIndex].warna
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
				txt.TextColor3 = warnaAktif
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
				
				local warnaAktif = daftarWarnaMaster[warnaGlobalIndex].warna
				for _, p in pairs(Players:GetPlayers()) do
					if p ~= player and p.Character then
						local root = p.Character:FindFirstChild("HumanoidRootPart")
						local bill = p.Character:FindFirstChild("LynnDistESP")
						if root and bill then
							local txt = bill:FindFirstChild("DistText")
							if txt then
								local dist = math.floor((myRoot.Position - root.Position).Magnitude)
								txt.Text = "[" .. dist .. "m]"
								txt.TextColor3 = warnaAktif
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

-- Hubungkan Fungsi Global untuk Master Color Picker
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
fbRow.Position = UDim2.new(0, 10, 0, 175)
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
-- 5. CUSTOM OBJECT ESP (KEYWORD SEARCH)
-- ==========================================
local objRow = Instance.new("Frame", pageVisual)
objRow.Size = UDim2.new(1, -20, 0, 55)
objRow.Position = UDim2.new(0, 10, 0, 218)
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
					local warnaObjPilihan = daftarWarnaMaster[warnaGlobalIndex].warna
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
