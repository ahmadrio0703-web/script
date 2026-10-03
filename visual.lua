-- ==========================================
-- LYNN MOD MENU - TAB VISUALS (UPDATED ESP + CUSTOM OBJECT)
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

-- ==========================================
-- 1. ESP BOX, NAMA, & JARAK PLAYER
-- ==========================================
local btnEsp, bgEsp, knobEsp, _ = BuatRowSaklar(pageVisual, 15, "ESP Player (Box+Name+Dist)", "", false)
local espOn = false
local espConnection = nil

local function refreshESP()
	for _, p in pairs(Players:GetPlayers()) do
		if p ~= player and p.Character and p.Character:FindFirstChild("KotakESP") then 
			p.Character.KotakESP:Destroy() 
		end
	end
	
	if espOn then
		for _, p in pairs(Players:GetPlayers()) do
			if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
				local bill = Instance.new("BillboardGui")
				bill.Name = "KotakESP"
				bill.Adornee = p.Character.HumanoidRootPart
				bill.Size = UDim2.new(4, 0, 5.5, 0)
				bill.AlwaysOnTop = true
				
				-- Kotak ESP
				local frame = Instance.new("Frame", bill)
				frame.Size = UDim2.new(1, 0, 1, 0)
				frame.BackgroundTransparency = 1
				local stroke = Instance.new("UIStroke", frame)
				stroke.Color = Color3.fromRGB(220, 220, 235) 
				stroke.Thickness = 1.5
				
				-- Teks Nama & Jarak di atas kotak
				local infoText = Instance.new("TextLabel", bill)
				infoText.Name = "InfoText"
				infoText.Size = UDim2.new(1, 0, 0, 25)
				infoText.Position = UDim2.new(0, 0, 0, -25)
				infoText.BackgroundTransparency = 1
				infoText.TextColor3 = Color3.fromRGB(255, 255, 255)
				infoText.Font = Enum.Font.GothamBold
				infoText.TextSize = 10
				infoText.TextStrokeTransparency = 0.5
				
				bill.Parent = p.Character
			end
		end
		
		-- Loop update jarak real-time
		espConnection = RunService.RenderStepped:Connect(function()
			pcall(function()
				local myChar = player.Character
				local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
				if not myRoot then return end
				
				for _, p in pairs(Players:GetPlayers()) do
					if p ~= player and p.Character then
						local char = p.Character
						local root = char:FindFirstChild("HumanoidRootPart")
						local bill = char:FindFirstChild("KotakESP")
						if root and bill then
							local textLabel = bill:FindFirstChild("InfoText")
							if textLabel then
								local dist = math.floor((myRoot.Position - root.Position).Magnitude)
								textLabel.Text = p.Name .. " [" .. dist .. "m]"
							end
						end
					end
				end
			end)
		end)
		TampilkanNotifikasiHijau("ESP Player Aktif!")
	else
		if espConnection then espConnection:Disconnect() end
		for _, p in pairs(Players:GetPlayers()) do
			if p ~= player and p.Character and p.Character:FindFirstChild("KotakESP") then 
				p.Character.KotakESP:Destroy() 
			end
		end
		TampilkanNotifikasiHijau("ESP Player Dimatikan.")
	end
end

btnEsp.MouseButton1Click:Connect(function() 
	espOn = not espOn 
	AnimasiSaklar(espOn, bgEsp, knobEsp) 
	refreshESP() 
end)

-- ==========================================
-- 2. FULLBRIGHT
-- ==========================================
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

-- ==========================================
-- 3. CUSTOM OBJECT ESP (KEYWORD SEARCH)
-- ==========================================
local objRow = Instance.new("Frame", pageVisual)
objRow.Size = UDim2.new(1, -20, 0, 48)
objRow.Position = UDim2.new(0, 10, 0, 105)
objRow.BackgroundTransparency = 1

local objLabel = Instance.new("TextLabel", objRow)
objLabel.Size = UDim2.new(1, 0, 0, 18)
objLabel.BackgroundTransparency = 1
objLabel.Text = "Custom Object ESP (Ketik Kata Kunci)"
objLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
objLabel.Font = Enum.Font.Gotham
objLabel.TextSize = 11
objLabel.TextXAlignment = Enum.TextXAlignment.Left

local inputObjKeyword = Instance.new("TextBox", objRow)
inputObjKeyword.Size = UDim2.new(0, 145, 0, 24)
inputObjKeyword.Position = UDim2.new(0, 0, 0, 22)
inputObjKeyword.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
inputObjKeyword.TextColor3 = Color3.fromRGB(240, 240, 250)
inputObjKeyword.PlaceholderText = "Contoh: pohon, chest..."
inputObjKeyword.Text = ""
inputObjKeyword.Font = Enum.Font.Gotham
inputObjKeyword.TextSize = 10 
Instance.new("UICorner", inputObjKeyword).CornerRadius = UDim.new(0, 4)
Instance.new("UIStroke", inputObjKeyword).Color = Color3.fromRGB(38, 38, 48)

local switchObjBg = Instance.new("Frame", objRow)
switchObjBg.Size = UDim2.new(0, 40, 0, 20)
switchObjBg.Position = UDim2.new(1, -40, 0, 24)
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
								if count > 100 then break end -- Batasi maksimal 100 objek biar nggak lag
								
								local hl = Instance.new("Highlight")
								hl.Name = "CustomObjectESP"
								hl.FillColor = Color3.fromRGB(255, 170, 0) -- Warna Oranye Menyala
								hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                                hl.FillTransparency = 0.5
								hl.OutlineTransparency = 0.2
								
								if obj:IsA("Model") then
									hl.Adornee = obj
								else
									hl.Adornee = obj
								end
								
								hl.Parent = menuGui
								table.insert(customHighlights, hl)
							end
						end
					end
				end)
				task.wait(3) -- Refresh pencarian setiap 3 detik
			end
		end)
	else
		ClearCustomHighlights()
		TampilkanNotifikasiHijau("Custom Object ESP Dimatikan.")
	end
end)
