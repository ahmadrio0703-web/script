-- ==========================================
-- LYNN MOD MENU - TAB MOUNT (EXTERNAL FILE)
-- ==========================================
local pageMount, menuGui = ... -- Menerima parameter operan dari script utama
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

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

local warnaBgOff = Color3.fromRGB(18, 18, 24)
local warnaBgOn = Color3.fromRGB(220, 220, 235) 
local posKnobOff = UDim2.new(0, 3, 0.5, -7)
local posKnobOn = UDim2.new(1, -17, 0.5, -7)

-- DATA CHECKPOINT MOUNT SAWIT & SOREYA
local listCheckpoint = {
	{nama = "Checkpoint 1", pos = Vector3.new(821.59, 29.54, 85.44)},
	{nama = "Checkpoint 2", pos = Vector3.new(1586.00, 29.29, 115.09)},
	{nama = "Checkpoint 3", pos = Vector3.new(2323.10, 41.16, 453.19)},
	{nama = "Checkpoint 4", pos = Vector3.new(2991.60, 124.88, 364.5)},
	{nama = "Checkpoint 5", pos = Vector3.new(3848.47, 260.14, -581.52)},
	{nama = "Checkpoint 6", pos = Vector3.new(4410.46, 300.17, -122.09)},
	{nama = "Checkpoint 7", pos = Vector3.new(4793.06, 341.70, 871.44)},
	{nama = "Checkpoint 8", pos = Vector3.new(5327.41, 398.79, 1421.41)},
	{nama = "Checkpoint 9", pos = Vector3.new(5676.41, 409.12, 1763.41)},
}

local listCheckpointSoreya = {
	{nama = "Soreya 1", pos = Vector3.new(465.72, 447.48, -8944.45)},
	{nama = "Soreya 2", pos = Vector3.new(449.5, 500, -9568)},
	{nama = "Soreya 3", pos = Vector3.new(398.27, 640, -10113.52)},
	{nama = "Soreya 4", pos = Vector3.new(483.27, 650.17, -10677.48)},
	{nama = "Soreya 5", pos = Vector3.new(1094.64, 736.96, -11158.20)},
	{nama = "Soreya 6", pos = Vector3.new(973.63, 734.01, -11821.70)},
	{nama = "Soreya 7", pos = Vector3.new(390.99, 887.37, -11833.52)},
	{nama = "Soreya 8", pos = Vector3.new(-331.34, 854.85, -11735.73)},
}

-- 1. AUTO TP MOUNT SAWIT
local autoTpRow = Instance.new("Frame", pageMount)
autoTpRow.Size = UDim2.new(1, -20, 0, 35)
autoTpRow.Position = UDim2.new(0, 10, 0, 15)
autoTpRow.BackgroundTransparency = 1

local autoTpLabel = Instance.new("TextLabel", autoTpRow)
autoTpLabel.Size = UDim2.new(0.7, 0, 1, 0)
autoTpLabel.BackgroundTransparency = 1
autoTpLabel.Text = "Auto TP Mount Sawit"
autoTpLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
autoTpLabel.Font = Enum.Font.Gotham
autoTpLabel.TextSize = 12
autoTpLabel.TextXAlignment = Enum.TextXAlignment.Left

local switchAutoBg = Instance.new("Frame", autoTpRow)
switchAutoBg.Size = UDim2.new(0, 40, 0, 20)
switchAutoBg.Position = UDim2.new(1, -40, 0.5, -10)
switchAutoBg.BackgroundColor3 = Color3.fromRGB(18, 18, 24) 
Instance.new("UICorner", switchAutoBg).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", switchAutoBg).Color = Color3.fromRGB(40, 40, 52)

local knobAuto = Instance.new("Frame", switchAutoBg)
knobAuto.Size = UDim2.new(0, 14, 0, 14)
knobAuto.Position = UDim2.new(0, 3, 0.5, -7) 
knobAuto.BackgroundColor3 = Color3.fromRGB(140, 140, 155)
Instance.new("UICorner", knobAuto).CornerRadius = UDim.new(1, 0)

local btnAutoTp = Instance.new("TextButton", switchAutoBg)
btnAutoTp.Size = UDim2.new(1, 0, 1, 0)
btnAutoTp.BackgroundTransparency = 1
btnAutoTp.Text = ""

local autoTpOn = false
btnAutoTp.MouseButton1Click:Connect(function()
	autoTpOn = not autoTpOn
	TweenService:Create(switchAutoBg, TweenInfo.new(0.25), {BackgroundColor3 = autoTpOn and warnaBgOn or warnaBgOff}):Play()
	TweenService:Create(knobAuto, TweenInfo.new(0.25), {Position = autoTpOn and posKnobOn or posKnobOff}):Play()
	
	if autoTpOn then
		TampilkanNotifikasiHijau("Auto TP Sawit Aktif!")
		task.spawn(function()
			local idx = 1
			while autoTpOn do
				pcall(function()
					local cp = listCheckpoint[idx]
					local char = player.Character
					if char and char:FindFirstChild("HumanoidRootPart") then
						char.HumanoidRootPart.CFrame = CFrame.new(cp.pos + Vector3.new(0, 3, 0))
					end
				end)
				for _ = 1, 200 do
					if not autoTpOn then break end
					task.wait(0.1)
				end
				idx = idx + 1
				if idx > #listCheckpoint then idx = 1 end
			end
		end)
	else
		TampilkanNotifikasiHijau("Auto TP Sawit Mati.")
	end
end)

-- 2. AUTO TP MOUNT SOREYA
local autoTpSoreyaRow = Instance.new("Frame", pageMount)
autoTpSoreyaRow.Size = UDim2.new(1, -20, 0, 35)
autoTpSoreyaRow.Position = UDim2.new(0, 10, 0, 60)
autoTpSoreyaRow.BackgroundTransparency = 1

local autoTpSoreyaLabel = Instance.new("TextLabel", autoTpSoreyaRow)
autoTpSoreyaLabel.Size = UDim2.new(0.7, 0, 1, 0)
autoTpSoreyaLabel.BackgroundTransparency = 1
autoTpSoreyaLabel.Text = "Auto TP Mount Soreya"
autoTpSoreyaLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
autoTpSoreyaLabel.Font = Enum.Font.Gotham
autoTpSoreyaLabel.TextSize = 12
autoTpSoreyaLabel.TextXAlignment = Enum.TextXAlignment.Left

local switchAutoSoreyaBg = Instance.new("Frame", autoTpSoreyaRow)
switchAutoSoreyaBg.Size = UDim2.new(0, 40, 0, 20)
switchAutoSoreyaBg.Position = UDim2.new(1, -40, 0.5, -10)
switchAutoSoreyaBg.BackgroundColor3 = Color3.fromRGB(18, 18, 24) 
Instance.new("UICorner", switchAutoSoreyaBg).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", switchAutoSoreyaBg).Color = Color3.fromRGB(40, 40, 52)

local knobAutoSoreya = Instance.new("Frame", switchAutoSoreyaBg)
knobAutoSoreya.Size = UDim2.new(0, 14, 0, 14)
knobAutoSoreya.Position = UDim2.new(0, 3, 0.5, -7) 
knobAutoSoreya.BackgroundColor3 = Color3.fromRGB(140, 140, 155)
Instance.new("UICorner", knobAutoSoreya).CornerRadius = UDim.new(1, 0)

local btnAutoTpSoreya = Instance.new("TextButton", switchAutoSoreyaBg)
btnAutoTpSoreya.Size = UDim2.new(1, 0, 1, 0)
btnAutoTpSoreya.BackgroundTransparency = 1
btnAutoTpSoreya.Text = ""

local autoTpSoreyaOn = false
btnAutoTpSoreya.MouseButton1Click:Connect(function()
	autoTpSoreyaOn = not autoTpSoreyaOn
	TweenService:Create(switchAutoSoreyaBg, TweenInfo.new(0.25), {BackgroundColor3 = autoTpSoreyaOn and warnaBgOn or warnaBgOff}):Play()
	TweenService:Create(knobAutoSoreya, TweenInfo.new(0.25), {Position = autoTpSoreyaOn and posKnobOn or posKnobOff}):Play()
	
	if autoTpSoreyaOn then
		TampilkanNotifikasiHijau("Auto TP Soreya Aktif!")
		task.spawn(function()
			local idx = 1
			while autoTpSoreyaOn do
				pcall(function()
					local cp = listCheckpointSoreya[idx]
					local char = player.Character
					if char and char:FindFirstChild("HumanoidRootPart") then
						char.HumanoidRootPart.CFrame = CFrame.new(cp.pos + Vector3.new(0, 3, 0))
					end
				end)
				for _ = 1, 200 do
					if not autoTpSoreyaOn then break end
					task.wait(0.1)
				end
				idx = idx + 1
				if idx > #listCheckpointSoreya then idx = 1 end
			end
		end)
	else
		TampilkanNotifikasiHijau("Auto TP Soreya Mati.")
	end
end)