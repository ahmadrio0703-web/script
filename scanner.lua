-- ==========================================
-- LYNN MOD MENU - TAB SCANNER (EXTERNAL FILE)
-- ==========================================
local pageScanner, menuGui = ... -- Menerima parameter operan dari script utama
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

-- INISIALISASI HALAMAN SCANNER
local scanTitle = Instance.new("TextLabel", pageScanner)
scanTitle.Size = UDim2.new(1, -20, 0, 25)
scanTitle.Position = UDim2.new(0, 10, 0, 10)
scanTitle.BackgroundTransparency = 1
scanTitle.Text = "SCANNER & INSPECTION TOOLS"
scanTitle.TextColor3 = Color3.fromRGB(80, 220, 120)
scanTitle.Font = Enum.Font.GothamBold
scanTitle.TextSize = 11.5
scanTitle.TextXAlignment = Enum.TextXAlignment.Left

-- 1. ASSET INSPECTOR
local btnInsp, bgInsp, knobInsp, _ = BuatRowSaklar(pageScanner, 42, "Asset Inspector", "", false)
local inspectorActive = false
local mouse = player:GetMouse()
local inspectConn = nil
local lastDataString = ""

local inspectHighlighter = Instance.new("Highlight")
inspectHighlighter.FillColor = Color3.fromRGB(80, 240, 140)
inspectHighlighter.OutlineColor = Color3.fromRGB(255, 255, 255)
inspectHighlighter.FillTransparency = 0.4
inspectHighlighter.OutlineTransparency = 0

local popUpPanel = Instance.new("Frame", menuGui)
popUpPanel.Size = UDim2.new(0, 270, 0, 150)
popUpPanel.Position = UDim2.new(0.5, -135, 0.6, 0)
popUpPanel.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
popUpPanel.BackgroundTransparency = 0.05
popUpPanel.Visible = false
popUpPanel.ZIndex = 999999
Instance.new("UICorner", popUpPanel).CornerRadius = UDim.new(0, 8)
local popUpStroke = Instance.new("UIStroke", popUpPanel)
popUpStroke.Color = Color3.fromRGB(80, 220, 120)
popUpStroke.Thickness = 1.2

local popUpText = Instance.new("TextLabel", popUpPanel)
popUpText.Size = UDim2.new(1, -12, 0, 105)
popUpText.Position = UDim2.new(0, 6, 0, 4)
popUpText.BackgroundTransparency = 1
popUpText.TextColor3 = Color3.fromRGB(220, 220, 235)
popUpText.Font = Enum.Font.Gotham
popUpText.TextSize = 9
popUpText.TextXAlignment = Enum.TextXAlignment.Left
popUpText.TextYAlignment = Enum.TextYAlignment.Top
popUpText.TextWrapped = true
popUpText.ZIndex = 999999
popUpText.Text = "🔹 Nama: -\n📂 Path: -\n🆔 ID: -\n📍 Jarak: -\n⚙ Fisik: -"

local manualCopyBtn = Instance.new("TextButton", popUpPanel)
manualCopyBtn.Size = UDim2.new(1, -12, 0, 28)
manualCopyBtn.Position = UDim2.new(0, 6, 0, 114)
manualCopyBtn.BackgroundColor3 = Color3.fromRGB(20, 35, 25)
manualCopyBtn.Text = "📋 SALIN DATA INI"
manualCopyBtn.TextColor3 = Color3.fromRGB(120, 220, 150)
manualCopyBtn.Font = Enum.Font.GothamBold
manualCopyBtn.TextSize = 9
manualCopyBtn.ZIndex = 999999
Instance.new("UICorner", manualCopyBtn).CornerRadius = UDim.new(0, 5)
local copyStroke = Instance.new("UIStroke", manualCopyBtn)
copyStroke.Color = Color3.fromRGB(45, 90, 60)
copyStroke.Thickness = 1

-- Draggable Popup Panel
local dragging, dragInput, dragStart, startPos
popUpPanel.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true dragStart = input.Position startPos = popUpPanel.Position
		input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
	end
end)
popUpPanel.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
end)
UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		popUpPanel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

local function GetObjectPath(obj)
	local path = obj.Name
	local current = obj.Parent
	while current and current ~= game and current ~= workspace do
		path = current.Name .. " > " .. path
		current = current.Parent
	end
	if current == workspace then path = "workspace > " .. path end
	return path
end

btnInsp.MouseButton1Click:Connect(function()
	inspectorActive = not inspectorActive
	AnimasiSaklar(inspectorActive, bgInsp, knobInsp)
	
	if inspectorActive then
		TampilkanNotifikasiHijau("Asset Inspector Aktif!")
		inspectConn = RunService.RenderStepped:Connect(function()
			if inspectorActive then
				local target = mouse.Target
				local char = player.Character
				local rootPart = char and char:FindFirstChild("HumanoidRootPart")
				
				if target and target:IsA("BasePart") then
					local model = target.Parent
					if model:IsA("Model") and model ~= workspace then inspectHighlighter.Adornee = model
					else inspectHighlighter.Adornee = target end
					inspectHighlighter.Parent = menuGui
					
					local objPath = GetObjectPath(target)
					local assetId = target:IsA("MeshPart") and target.MeshId or (target:IsA("Decal") or target:IsA("Texture") and target.Texture or "Tidak ada (Part)")
					local distanceStr = rootPart and (math.floor((rootPart.Position - target.Position).Magnitude * 10) / 10 .. " meter") or "N/A"
					local collideStatus = target.CanCollide and "True" or "False"
					local anchorStatus = target.Anchored and "True" or "False"
					
					popUpText.Text = "🔹 Nama: " .. target.Name .. " (" .. target.ClassName .. ")\n📂 Path: " .. objPath .. "\n🆔 ID: " .. assetId .. "\n📍 Jarak: " .. distanceStr .. "\n⚙️️ Collide: " .. collideStatus .. " | Anchored: " .. anchorStatus
					lastDataString = "Nama: " .. target.Name .. " | Class: " .. target.ClassName .. " | Path: " .. objPath .. " | ID: " .. assetId .. " | Collide: " .. collideStatus .. " | Anchored: " .. anchorStatus
					popUpPanel.Visible = true
				else
					inspectHighlighter.Parent = nil
					popUpPanel.Visible = false
				end
			end
		end)
	else
		inspectHighlighter.Parent = nil
		popUpPanel.Visible = false
		if inspectConn then inspectConn:Disconnect() end
		TampilkanNotifikasiHijau("Asset Inspector Mati.")
	end
end)

manualCopyBtn.MouseButton1Click:Connect(function()
	if lastDataString ~= "" and setclipboard then
		setclipboard(lastDataString)
		TampilkanNotifikasiHijau("Data Berhasil Disalin!")
	end
end)

-- 2. X-RAY / RADIUS SCANNER
local scanRow = Instance.new("Frame", pageScanner)
scanRow.Size = UDim2.new(1, -20, 0, 35)
scanRow.Position = UDim2.new(0, 10, 0, 87)
scanRow.BackgroundTransparency = 1

local scanLabel = Instance.new("TextLabel", scanRow)
scanLabel.Size = UDim2.new(0.4, 0, 1, 0)
scanLabel.BackgroundTransparency = 1
scanLabel.Text = "X-Ray Scanner"
scanLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
scanLabel.Font = Enum.Font.Gotham
scanLabel.TextSize = 12
scanLabel.TextXAlignment = Enum.TextXAlignment.Left

local inputRadius = Instance.new("TextBox", scanRow)
inputRadius.Size = UDim2.new(0, 45, 0, 24)
inputRadius.Position = UDim2.new(1, -100, 0.5, -12)
inputRadius.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
inputRadius.TextColor3 = Color3.fromRGB(240, 240, 250)
inputRadius.Text = "30"
inputRadius.Font = Enum.Font.Gotham
inputRadius.TextSize = 11
Instance.new("UICorner", inputRadius).CornerRadius = UDim.new(0, 4)
Instance.new("UIStroke", inputRadius).Color = Color3.fromRGB(38, 38, 48)

local switchScanBg = Instance.new("Frame", scanRow)
switchScanBg.Size = UDim2.new(0, 40, 0, 20)
switchScanBg.Position = UDim2.new(1, -40, 0.5, -10)
switchScanBg.BackgroundColor3 = Color3.fromRGB(18, 18, 24) 
Instance.new("UICorner", switchScanBg).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", switchScanBg).Color = Color3.fromRGB(40, 40, 52)

local knobScan = Instance.new("Frame", switchScanBg)
knobScan.Size = UDim2.new(0, 14, 0, 14)
knobScan.Position = UDim2.new(0, 3, 0.5, -7) 
knobScan.BackgroundColor3 = Color3.fromRGB(140, 140, 155)
Instance.new("UICorner", knobScan).CornerRadius = UDim.new(1, 0)

local btnScan = Instance.new("TextButton", switchScanBg)
btnScan.Size = UDim2.new(1, 0, 1, 0)
btnScan.BackgroundTransparency = 1
btnScan.Text = ""

local scannerActive = false
local scanHighlights = {}
local function ClearScanHighlights()
	for _, h in pairs(scanHighlights) do
		if h then h:Destroy() end
	end
	scanHighlights = {}
end

btnScan.MouseButton1Click:Connect(function()
	scannerActive = not scannerActive
	AnimasiSaklar(scannerActive, switchScanBg, knobScan)
	
	if scannerActive then
		TampilkanNotifikasiHijau("X-Ray Radius Scanner Aktif!")
		task.spawn(function()
			while scannerActive do
				pcall(function()
					local char = player.Character
					local rootPart = char and char:FindFirstChild("HumanoidRootPart")
					local maxDist = tonumber(inputRadius.Text) or 30
					
					if rootPart then
						ClearScanHighlights()
						local count = 0
						for _, obj in pairs(workspace:GetDescendants()) do
							if obj:IsA("BasePart") and obj.Name ~= "HumanoidRootPart" then
								local dist = (rootPart.Position - obj.Position).Magnitude
								if dist <= maxDist then
									count = count + 1
									if count > 80 then break end
									
									local hl = Instance.new("Highlight")
									hl.FillColor = Color3.fromRGB(40, 200, 120)
									hl.OutlineColor = Color3.fromRGB(180, 255, 210)
									hl.FillTransparency = 0.65
									hl.OutlineTransparency = 0.3
									
									local model = obj.Parent
									if model:IsA("Model") and model ~= workspace then
										hl.Adornee = model
									else
										hl.Adornee = obj
									end
									
									hl.Parent = menuGui
									table.insert(scanHighlights, hl)
								end
							end
						end
					end
				end)
				task.wait(2)
			end
		end)
	else
		scannerActive = false
		ClearScanHighlights()
		TampilkanNotifikasiHijau("X-Ray Radius Scanner Mati.")
	end
end)