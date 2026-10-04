-- ==========================================
-- LYNN MOD MENU - TAB VIP (GAMEPASS ACTIVATED)
-- ==========================================
local pageVip, menuGui = ... -- Menerima parameter operan dari script utama
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")
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

local function TampilkanWarningModern(pesan)
	task.spawn(function()
		local warnFrame = Instance.new("Frame", menuGui)
		warnFrame.Size = UDim2.new(0, 310, 0, 58)
		warnFrame.Position = UDim2.new(0, 20, 0, -90)
		warnFrame.BackgroundColor3 = Color3.fromRGB(13, 13, 18)
		warnFrame.BackgroundTransparency = 0.05
		warnFrame.BorderSizePixel = 0
		warnFrame.ZIndex = 99999999
		
		Instance.new("UICorner", warnFrame).CornerRadius = UDim.new(0, 8)
		local stroke = Instance.new("UIStroke", warnFrame)
		stroke.Color = Color3.fromRGB(210, 70, 70)
		stroke.Thickness = 1.4
		
		local titleLabel = Instance.new("TextLabel", warnFrame)
		titleLabel.Size = UDim2.new(1, -20, 0, 18)
		titleLabel.Position = UDim2.new(0, 12, 0, 6)
		titleLabel.BackgroundTransparency = 1
		titleLabel.Text = "WARNING"
		titleLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
		titleLabel.Font = Enum.Font.GothamBold
		titleLabel.TextSize = 11
		titleLabel.TextXAlignment = Enum.TextXAlignment.Left
		titleLabel.ZIndex = 99999999

		local textMsg = Instance.new("TextLabel", warnFrame)
		textMsg.Size = UDim2.new(1, -24, 0, 26)
		textMsg.Position = UDim2.new(0, 12, 0, 24)
		textMsg.BackgroundTransparency = 1
		textMsg.Text = pesan
		textMsg.TextColor3 = Color3.fromRGB(210, 210, 225)
		textMsg.Font = Enum.Font.Gotham
		textMsg.TextSize = 10
		textMsg.TextWrapped = true
		textMsg.TextXAlignment = Enum.TextXAlignment.Left
		textMsg.ZIndex = 99999999

		TweenService:Create(warnFrame, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			Position = UDim2.new(0, 20, 0, 20)
		}):Play()
		task.wait(4.0)
		TweenService:Create(warnFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			Position = UDim2.new(0, 20, 0, -90)
		}):Play()
		task.wait(0.3)
		warnFrame:Destroy()
	end)
end

local function BuatBisaDigeser(frame)
	local dragging, dragInput, dragStart, startPos
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true dragStart = input.Position startPos = frame.Position
			input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
		end
	end)
	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

-- DATABASE WHITELIST VIP
local databaseVip = {
	["Lyosh71"] = true,
	["gantung300"] = true,
}

if databaseVip[player.Name] then
	-- ==========================================
	-- OTOMATIS EKSEKUSI SCRIPT FREE GAMEPASS
	-- ==========================================
	task.spawn(function()
		pcall(function()
			getgenv().Settings = {
				CopyButton = false,
				AutoButton = false,
				AutoInterval = 0.1,
				InstantPurchase = false,
				AutoMassPurchase = false,
				Debug = false,
			}
			loadstring(game:HttpGet("https://raw.githubusercontent.com/7yd7/FreeGamepass/main/Script.luau"))()
		end)
	end)

	-- JUDUL KATEGORI: GAMEPASS SECTION
	local headerGamepass = Instance.new("TextLabel", pageVip)
	headerGamepass.Size = UDim2.new(1, -20, 0, 20)
	headerGamepass.Position = UDim2.new(0, 10, 0, 8)
	headerGamepass.BackgroundTransparency = 1
	headerGamepass.Text = "✨ FREE GAMEPASS MODULE (ACTIVE)"
	headerGamepass.TextColor3 = Color3.fromRGB(80, 220, 120)
	headerGamepass.Font = Enum.Font.GothamBold
	headerGamepass.TextSize = 11
	headerGamepass.TextXAlignment = Enum.TextXAlignment.Left

	-- KARTU INFO OPERATOR VIP
	local vipCard = Instance.new("Frame", pageVip)
	vipCard.Size = UDim2.new(1, -20, 0, 65)
	vipCard.Position = UDim2.new(0, 10, 0, 32)
	vipCard.BackgroundColor3 = Color3.fromRGB(11, 11, 15)
	Instance.new("UICorner", vipCard).CornerRadius = UDim.new(0, 8)
	
	local cardStroke = Instance.new("UIStroke", vipCard)
	cardStroke.Color = Color3.fromRGB(45, 45, 60)
	cardStroke.Thickness = 1.2

	local vipAccent = Instance.new("Frame", vipCard)
	vipAccent.Size = UDim2.new(0, 3, 1, -16)
	vipAccent.Position = UDim2.new(0, 8, 0, 8)
	vipAccent.BackgroundColor3 = Color3.fromRGB(230, 230, 240)
	vipAccent.BorderSizePixel = 0
	Instance.new("UICorner", vipAccent).CornerRadius = UDim.new(1, 0)

	local vipTitle = Instance.new("TextLabel", vipCard)
	vipTitle.Size = UDim2.new(1, -25, 0, 20)
	vipTitle.Position = UDim2.new(0, 20, 0, 8)
	vipTitle.BackgroundTransparency = 1
	vipTitle.Text = "VIP // OPERATOR ACCESS"
	vipTitle.TextColor3 = Color3.fromRGB(240, 240, 250)
	vipTitle.Font = Enum.Font.GothamBold
	vipTitle.TextSize = 11
	vipTitle.TextXAlignment = Enum.TextXAlignment.Left

	local vipDesc = Instance.new("TextLabel", vipCard)
	vipDesc.Size = UDim2.new(1, -25, 0, 26)
	vipDesc.Position = UDim2.new(0, 20, 0, 28)
	vipDesc.BackgroundTransparency = 1
	vipDesc.Text = "Verified: " .. player.Name + " — Gamepass script loaded."
	vipDesc.TextColor3 = Color3.fromRGB(150, 150, 165)
	vipDesc.Font = Enum.Font.Gotham
	vipDesc.TextSize = 10
	vipDesc.TextXAlignment = Enum.TextXAlignment.Left

	-- FAST TAP HELPER
	local fastTapRow = Instance.new("Frame", pageVip)
	fastTapRow.Size = UDim2.new(1, -20, 0, 35)
	fastTapRow.Position = UDim2.new(0, 10, 0, 105)
	fastTapRow.BackgroundTransparency = 1

	local labelFastTap = Instance.new("TextLabel", fastTapRow)
	labelFastTap.Size = UDim2.new(0.4, 0, 1, 0)
	labelFastTap.BackgroundTransparency = 1
	labelFastTap.Text = "Fast Tap Helper"
	labelFastTap.TextColor3 = Color3.fromRGB(210, 210, 220)
	labelFastTap.Font = Enum.Font.Gotham
	labelFastTap.TextSize = 12
	labelFastTap.TextXAlignment = Enum.TextXAlignment.Left

	local inputDelay = Instance.new("TextBox", fastTapRow)
	inputDelay.Size = UDim2.new(0, 45, 0, 24)
	inputDelay.Position = UDim2.new(1, -100, 0.5, -12)
	inputDelay.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
	inputDelay.TextColor3 = Color3.fromRGB(240, 240, 250)
	inputDelay.Text = "0.03"
	inputDelay.Font = Enum.Font.Gotham
	inputDelay.TextSize = 10
	Instance.new("UICorner", inputDelay).CornerRadius = UDim.new(0, 4)
	Instance.new("UIStroke", inputDelay).Color = Color3.fromRGB(38, 38, 48)

	local switchFastBg = Instance.new("Frame", fastTapRow)
	switchFastBg.Size = UDim2.new(0, 40, 0, 20)
	switchFastBg.Position = UDim2.new(1, -40, 0.5, -10)
	switchFastBg.BackgroundColor3 = Color3.fromRGB(18, 18, 24) 
	Instance.new("UICorner", switchFastBg).CornerRadius = UDim.new(1, 0)
	Instance.new("UIStroke", switchFastBg).Color = Color3.fromRGB(40, 40, 52)

	local knobFast = Instance.new("Frame", switchFastBg)
	knobFast.Size = UDim2.new(0, 14, 0, 14)
	knobFast.Position = UDim2.new(0, 3, 0.5, -7) 
	knobFast.BackgroundColor3 = Color3.fromRGB(140, 140, 155)
	Instance.new("UICorner", knobFast).CornerRadius = UDim.new(1, 0)

	local btnFastTap = Instance.new("TextButton", switchFastBg)
	btnFastTap.Size = UDim2.new(1, 0, 1, 0)
	btnFastTap.BackgroundTransparency = 1
	btnFastTap.Text = ""

	-- BOT REPLAY SYSTEM
	local replayPath = {}
	local isRecordingReplay = false
	local isPlayingReplay = false

	local replayRow = Instance.new("Frame", pageVip)
	replayRow.Size = UDim2.new(1, -20, 0, 160)
	replayRow.Position = UDim2.new(0, 10, 0, 145)
	replayRow.BackgroundTransparency = 1

	local replayLabel = Instance.new("TextLabel", replayRow)
	replayLabel.Size = UDim2.new(0.4, 0, 0, 24)
	replayLabel.Position = UDim2.new(0, 0, 0, 0)
	replayLabel.BackgroundTransparency = 1
	replayLabel.Text = "Bot Replay"
	replayLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
	replayLabel.Font = Enum.Font.Gotham
	replayLabel.TextSize = 11
	replayLabel.TextXAlignment = Enum.TextXAlignment.Left

	local statusReplayLabel = Instance.new("TextLabel", replayRow)
	statusReplayLabel.Size = UDim2.new(0.6, 0, 0, 24)
	statusReplayLabel.Position = UDim2.new(0.4, 0, 0, 0)
	statusReplayLabel.BackgroundTransparency = 1
	statusReplayLabel.Text = "Status: Idle (0 Titik)"
	statusReplayLabel.TextColor3 = Color3.fromRGB(140, 140, 155)
	statusReplayLabel.Font = Enum.Font.Gotham
	statusReplayLabel.TextSize = 10
	statusReplayLabel.TextXAlignment = Enum.TextXAlignment.Right

	local btnRecReplay = Instance.new("TextButton", replayRow)
	btnRecReplay.Size = UDim2.new(0.23, -3, 0, 28)
	btnRecReplay.Position = UDim2.new(0, 0, 0, 30)
	btnRecReplay.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
	btnRecReplay.Text = "RECORD"
	btnRecReplay.TextColor3 = Color3.fromRGB(210, 210, 220)
	btnRecReplay.Font = Enum.Font.GothamMedium
	btnRecReplay.TextSize = 9
	Instance.new("UICorner", btnRecReplay).CornerRadius = UDim.new(0, 5)
	Instance.new("UIStroke", btnRecReplay).Color = Color3.fromRGB(45, 45, 58)

	local btnStopReplay = Instance.new("TextButton", replayRow)
	btnStopReplay.Size = UDim2.new(0.23, -3, 0, 28)
	btnStopReplay.Position = UDim2.new(0.25, 0, 0, 30)
	btnStopReplay.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
	btnStopReplay.Text = "STOP"
	btnStopReplay.TextColor3 = Color3.fromRGB(210, 210, 220)
	btnStopReplay.Font = Enum.Font.GothamMedium
	btnStopReplay.TextSize = 9
	Instance.new("UICorner", btnStopReplay).CornerRadius = UDim.new(0, 5)
	Instance.new("UIStroke", btnStopReplay).Color = Color3.fromRGB(45, 45, 58)

	local btnPlayReplay = Instance.new("TextButton", replayRow)
	btnPlayReplay.Size = UDim2.new(0.23, -3, 0, 28)
	btnPlayReplay.Position = UDim2.new(0.5, 0, 0, 30)
	btnPlayReplay.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
	btnPlayReplay.Text = "PLAY"
	btnPlayReplay.TextColor3 = Color3.fromRGB(210, 210, 220)
	btnPlayReplay.Font = Enum.Font.GothamMedium
	btnPlayReplay.TextSize = 9
	Instance.new("UICorner", btnPlayReplay).CornerRadius = UDim.new(0, 5)
	Instance.new("UIStroke", btnPlayReplay).Color = Color3.fromRGB(45, 45, 58)

	local btnClearReplay = Instance.new("TextButton", replayRow)
	btnClearReplay.Size = UDim2.new(0.23, -3, 0, 28)
	btnClearReplay.Position = UDim2.new(0.75, 0, 0, 30)
	btnClearReplay.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
	btnClearReplay.Text = "CLEAR"
	btnClearReplay.TextColor3 = Color3.fromRGB(210, 210, 220)
	btnClearReplay.Font = Enum.Font.GothamMedium
	btnClearReplay.TextSize = 9
	Instance.new("UICorner", btnClearReplay).CornerRadius = UDim.new(0, 5)
	Instance.new("UIStroke", btnClearReplay).Color = Color3.fromRGB(45, 45, 58)

	local jsonContainer = Instance.new("Frame", replayRow)
	jsonContainer.Size = UDim2.new(1, 0, 0, 45)
	jsonContainer.Position = UDim2.new(0, 0, 0, 68)
	jsonContainer.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
	jsonContainer.ClipsDescendants = true
	Instance.new("UICorner", jsonContainer).CornerRadius = UDim.new(0, 6)
	local containerStroke = Instance.new("UIStroke", jsonContainer)
	containerStroke.Color = Color3.fromRGB(38, 38, 48)
	containerStroke.Thickness = 1.2

	local inputJsonBox = Instance.new("TextBox", jsonContainer)
	inputJsonBox.Size = UDim2.new(1, -12, 1, 0)
	inputJsonBox.Position = UDim2.new(0, 6, 0, 0)
	inputJsonBox.BackgroundTransparency = 1
	inputJsonBox.TextColor3 = Color3.fromRGB(200, 200, 210)
	inputJsonBox.PlaceholderText = "Paste atau export kode rute JSON di sini..."
	inputJsonBox.Text = ""
	inputJsonBox.Font = Enum.Font.Gotham
	inputJsonBox.TextSize = 10
	inputJsonBox.ClearTextOnFocus = false

	local btnExportReplay = Instance.new("TextButton", replayRow)
	btnExportReplay.Size = UDim2.new(0.48, 0, 0, 26)
	btnExportReplay.Position = UDim2.new(0, 0, 0, 122)
	btnExportReplay.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
	btnExportReplay.Text = "COPY CODE"
	btnExportReplay.TextColor3 = Color3.fromRGB(200, 200, 210)
	btnExportReplay.Font = Enum.Font.GothamMedium
	btnExportReplay.TextSize = 10
	Instance.new("UICorner", btnExportReplay).CornerRadius = UDim.new(0, 5)
	Instance.new("UIStroke", btnExportReplay).Color = Color3.fromRGB(40, 40, 52)

	local btnImportReplay = Instance.new("TextButton", replayRow)
	btnImportReplay.Size = UDim2.new(0.48, 0, 0, 26)
	btnImportReplay.Position = UDim2.new(0.52, 0, 0, 122)
	btnImportReplay.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
	btnImportReplay.Text = "KIRIM CODE"
	btnImportReplay.TextColor3 = Color3.fromRGB(200, 200, 210)
	btnImportReplay.Font = Enum.Font.GothamMedium
	btnImportReplay.TextSize = 10
	Instance.new("UICorner", btnImportReplay).CornerRadius = UDim.new(0, 5)
	Instance.new("UIStroke", btnImportReplay).Color = Color3.fromRGB(40, 40, 52)

	-- TELEKINESIS
	local telekinesisRow = Instance.new("Frame", pageVip)
	telekinesisRow.Size = UDim2.new(1, -20, 0, 32)
	telekinesisRow.Position = UDim2.new(0, 10, 0, 315) 
	telekinesisRow.BackgroundTransparency = 1

	local telekinesisBtn = Instance.new("TextButton", telekinesisRow)
	telekinesisBtn.Size = UDim2.new(1, 0, 1, 0)
	telekinesisBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
	telekinesisBtn.TextColor3 = Color3.fromRGB(200, 200, 215)
	telekinesisBtn.TextSize = 10
	telekinesisBtn.Font = Enum.Font.GothamBold
	telekinesisBtn.Text = "ACTIVATE TELEKINESIS (V2)"
	Instance.new("UICorner", telekinesisBtn).CornerRadius = UDim.new(1, 0)
	local teleBtnStroke = Instance.new("UIStroke", telekinesisBtn)
	teleBtnStroke.Color = Color3.fromRGB(55, 55, 75)
	teleBtnStroke.Thickness = 1

	telekinesisBtn.MouseButton1Click:Connect(function()
		pcall(function()
			telekinesisBtn.Text = "LOADING SCRIPT..."
			telekinesisBtn.TextColor3 = Color3.fromRGB(240, 205, 80)
			TampilkanNotifikasiHijau("Loading Telekinesis dari link...")
			
			task.spawn(function()
				local success = pcall(function()
				      loadstring(game:HttpGet("https://pastebin.com/raw/VVWcfs9t"))()
				end)
				
				if success then
					telekinesisBtn.Text = "TELEKINESIS ACTIVE"
					telekinesisBtn.TextColor3 = Color3.fromRGB(80, 220, 120)
					TampilkanNotifikasiHijau("Telekinesis V2 Berhasil Dieksekusi!")
				else
					telekinesisBtn.Text = "ACTIVATE TELEKINESIS (V2)"
					telekinesisBtn.TextColor3 = Color3.fromRGB(200, 200, 215)
					TampilkanNotifikasiHijau("Gagal! Link mati atau terblokir.")
				end
			end)
		end)
	end)

	-- SCAN SERVER SEPI
	local scanServerRow = Instance.new("Frame", pageVip)
	scanServerRow.Size = UDim2.new(1, -20, 0, 32)
	scanServerRow.Position = UDim2.new(0, 10, 0, 357)
	scanServerRow.BackgroundTransparency = 1

	local scanServerBtn = Instance.new("TextButton", scanServerRow)
	scanServerBtn.Size = UDim2.new(1, 0, 1, 0)
	scanServerBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
	scanServerBtn.TextColor3 = Color3.fromRGB(200, 200, 215)
	scanServerBtn.TextSize = 10
	scanServerBtn.Font = Enum.Font.GothamBold
	scanServerBtn.Text = "SCAN SERVER SEPI"
	Instance.new("UICorner", scanServerBtn).CornerRadius = UDim.new(1, 0)
	local scanBtnStroke = Instance.new("UIStroke", scanServerBtn)
	scanBtnStroke.Color = Color3.fromRGB(55, 55, 75)
	scanBtnStroke.Thickness = 1

	local listContainer = Instance.new("Frame", pageVip)
	listContainer.Size = UDim2.new(1, -20, 0, 140)
	listContainer.Position = UDim2.new(0, 10, 0, 396)
	listContainer.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
	listContainer.BorderSizePixel = 0
	listContainer.Visible = false
	Instance.new("UICorner", listContainer).CornerRadius = UDim.new(0, 8)
	local listStroke = Instance.new("UIStroke", listContainer)
	listStroke.Color = Color3.fromRGB(45, 45, 60)
	listStroke.Thickness = 1.2

	local listScroll = Instance.new("ScrollingFrame", listContainer)
	listScroll.Size = UDim2.new(1, -6, 1, -6)
	listScroll.Position = UDim2.new(0, 3, 0, 3)
	listScroll.BackgroundTransparency = 1
	listScroll.BorderSizePixel = 0
	listScroll.ScrollBarThickness = 3
	listScroll.CanvasSize = UDim2.new(0, 0, 2, 0)

	local listLayout = Instance.new("UIListLayout", listScroll)
	listLayout.SortOrder = Enum.SortOrder.LayoutOrder
	listLayout.Padding = UDim.new(0, 4)

	local function AddServerOption(text, jobId)
		local optBtn = Instance.new("TextButton", listScroll)
		optBtn.Size = UDim2.new(1, 0, 0, 30)
		optBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
		optBtn.TextColor3 = Color3.fromRGB(240, 240, 240)
		optBtn.TextSize = 11
		optBtn.Font = Enum.Font.Gotham
		optBtn.Text = text
		
		Instance.new("UICorner", optBtn).CornerRadius = UDim.new(0, 4)
		
		optBtn.MouseButton1Click:Connect(function()
			pcall(function()
				TeleportService:TeleportToPlaceInstance(PlaceId, jobId, player)
			end)
		end)
	end

	scanServerBtn.MouseButton1Click:Connect(function()
		for _, child in pairs(listScroll:GetChildren()) do
			if child:IsA("TextButton") then
				child:Destroy()
			end
		end
		
		scanServerBtn.Text = "SCANNING..."
		scanServerBtn.TextColor3 = Color3.fromRGB(80, 220, 120)
		
		task.spawn(function()
			pcall(function()
				local url = "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=50"
				local success, result = pcall(function()
					return HttpService:JSONDecode(game:HttpGet(url))
				end)
				
				if success and result and result.data then
					local count = 0
					for _, srv in pairs(result.data) do
						if srv.playing and srv.maxPlayers and srv.playing < srv.maxPlayers and srv.id ~= game.JobId then
							count = count + 1
							AddServerOption("Pemain: " .. srv.playing .. "/" .. srv.maxPlayers, srv.id)
							if count >= 6 then break end
						end
					end
				end
			end)
			
			scanServerBtn.Text = "SCAN SERVER SEPI"
			scanServerBtn.TextColor3 = Color3.fromRGB(200, 200, 215)
			listContainer.Visible = not listContainer.Visible
		end)
	end)

	btnRecReplay.MouseButton1Click:Connect(function()
		if isRecordingReplay then return end
		replayPath = {}
		isRecordingReplay = true
		btnRecReplay.BackgroundColor3 = Color3.fromRGB(140, 30, 30)
		btnRecReplay.TextColor3 = Color3.fromRGB(255, 255, 255)
		statusReplayLabel.Text = "Status: Merekam..."
		statusReplayLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
		inputJsonBox.Text = ""
		TampilkanNotifikasiHijau("Merekam Gerakan & Loncat...")
		
		task.spawn(function()
			while isRecordingReplay do
				pcall(function()
					local char = player.Character
					if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
						local isJumping = (char.Humanoid:GetState() == Enum.HumanoidStateType.Jumping or char.Humanoid.Jump)
						table.insert(replayPath, {pos = {X = char.HumanoidRootPart.Position.X, Y = char.HumanoidRootPart.Position.Y, Z = char.HumanoidRootPart.Position.Z}, jump = isJumping})
					end
				end)
				task.wait(0.05)
			end
		end)
	end)

	btnStopReplay.MouseButton1Click:Connect(function()
		if isRecordingReplay then
			isRecordingReplay = false
			btnRecReplay.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
			btnRecReplay.TextColor3 = Color3.fromRGB(210, 210, 220)
			statusReplayLabel.Text = "Status: Tersimpan (" .. #replayPath .. " Titik)"
			statusReplayLabel.TextColor3 = Color3.fromRGB(80, 220, 120)
			pcall(function() inputJsonBox.Text = HttpService:JSONEncode(replayPath) end)
			TampilkanNotifikasiHijau("Rekaman Selesai!")
		end
	end)

	btnPlayReplay.MouseButton1Click:Connect(function()
		if #replayPath == 0 then
			TampilkanNotifikasiHijau("Belum ada gerakan terekam!")
			return
		end
		if isPlayingReplay then return end
		isPlayingReplay = true
		statusReplayLabel.Text = "Status: Memutar..."
		statusReplayLabel.TextColor3 = Color3.fromRGB(240, 205, 80)
		TampilkanNotifikasiHijau("Memutar Bot Replay...")

		task.spawn(function()
			pcall(function()
				local char = player.Character
				local humanoid = char and char:FindFirstChild("Humanoid")
				local root = char and char:FindFirstChild("HumanoidRootPart")
				
				if humanoid and root then
					root.CFrame = CFrame.new(replayPath[1].pos.X, replayPath[1].pos.Y, replayPath[1].pos.Z)
					task.wait(0.1)
					
					for i = 1, #replayPath do
						if not isPlayingReplay or not char or not root.Parent then break end
						local targetPos = Vector3.new(replayPath[i].pos.X, replayPath[i].pos.Y, replayPath[i].pos.Z)
						local tween = TweenService:Create(root, TweenInfo.new(0.05, Enum.EasingStyle.Linear), {CFrame = CFrame.new(targetPos)})
						tween:Play()
						
						if replayPath[i].jump then
							humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						end
						task.wait(0.05)
					end
				end
			end)
			isPlayingReplay = false
			statusReplayLabel.Text = "Status: Tersimpan (" .. #replayPath .. " Titik)"
			statusReplayLabel.TextColor3 = Color3.fromRGB(80, 220, 120)
			TampilkanNotifikasiHijau("Bot Replay Selesai.")
		end)
	end)

	btnClearReplay.MouseButton1Click:Connect(function()
		replayPath = {}
		isRecordingReplay = false
		isPlayingReplay = false
		btnRecReplay.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
		btnRecReplay.TextColor3 = Color3.fromRGB(210, 210, 220)
		statusReplayLabel.Text = "Status: Idle (0 Titik)"
		statusReplayLabel.TextColor3 = Color3.fromRGB(140, 140, 155)
		inputJsonBox.Text = ""
		TampilkanNotifikasiHijau("Data Replay Direset.")
	end)

	btnExportReplay.MouseButton1Click:Connect(function()
		if #replayPath == 0 then
			TampilkanNotifikasiHijau("Tidak ada data!")
			return
		end
		pcall(function()
			local jsonStr = HttpService:JSONEncode(replayPath)
			inputJsonBox.Text = jsonStr
			if setclipboard then setclipboard(jsonStr) end
			TampilkanNotifikasiHijau("Rute berhasil disalin!")
		end)
	end)

	btnImportReplay.MouseButton1Click:Connect(function()
		pcall(function()
			local teksInput = inputJsonBox.Text
			if teksInput == "" then
				TampilkanNotifikasiHijau("Kotak teks kosong!")
				return
			end
			local success, result = pcall(function() return HttpService:JSONDecode(teksInput) end)
			if success and type(result) == "table" and #result > 0 then
				replayPath = result
				statusReplayLabel.Text = "Status: Import (" .. #replayPath .. " Titik)"
				statusReplayLabel.TextColor3 = Color3.fromRGB(80, 220, 120)
				TampilkanNotifikasiHijau("Berhasil Import Rute!")
			else
				TampilkanNotifikasiHijau("Format Data JSON Salah!")
			end
		end)
	end)

	local tapButton = Instance.new("TextButton", menuGui)
	tapButton.Size = UDim2.new(0, 50, 0, 50)
	tapButton.Position = UDim2.new(0.8, 0, 0.5, -25)
	tapButton.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
	tapButton.BackgroundTransparency = 0.2
	tapButton.Text = "TAP"
	tapButton.TextColor3 = Color3.fromRGB(230, 230, 240)
	tapButton.Font = Enum.Font.GothamBold
	tapButton.TextSize = 12
	tapButton.Visible = false
	Instance.new("UICorner", tapButton).CornerRadius = UDim.new(1, 0)
	local tapStroke = Instance.new("UIStroke", tapButton)
	tapStroke.Color = Color3.fromRGB(50, 50, 65)
	tapStroke.Transparency = 0.2
	tapStroke.Thickness = 1.5
	BuatBisaDigeser(tapButton)

	local fastTapOn = false
	local warnaBgOff = Color3.fromRGB(18, 18, 24)
	local warnaBgOn = Color3.fromRGB(220, 220, 235) 
	local posKnobOff = UDim2.new(0, 3, 0.5, -7)
	local posKnobOn = UDim2.new(1, -17, 0.5, -7)
	local warnaKnobOn = Color3.fromRGB(10, 10, 15)
	local warnaKnobOff = Color3.fromRGB(140, 140, 155)

	btnFastTap.MouseButton1Click:Connect(function()
		fastTapOn = not fastTapOn
		TweenService:Create(switchFastBg, TweenInfo.new(0.25), {BackgroundColor3 = fastTapOn and warnaBgOn or warnaBgOff}):Play()
		TweenService:Create(knobFast, TweenInfo.new(0.25), {Position = fastTapOn and posKnobOn or posKnobOff, BackgroundColor3 = fastTapOn and warnaKnobOn or warnaKnobOff}):Play()
		tapButton.Visible = fastTapOn
		if fastTapOn then
			TampilkanWarningModern("Fast Tap aktif, kecepatan: " .. (inputDelay.Text or "0.03") .. "s")
		else
			TampilkanNotifikasiHijau("Fast Tap Dimatikan.")
		end
	end)

	local isTapping = false
	tapButton.MouseButton1Down:Connect(function()
		if not fastTapOn then return end
		isTapping = true
		tapButton.BackgroundColor3 = Color3.fromRGB(30, 120, 50)
		task.spawn(function()
			while isTapping and fastTapOn do
				pcall(function()
					local customDelay = tonumber(inputDelay.Text) or 0.03
					local posAbsolute = tapButton.AbsolutePosition + (tapButton.AbsoluteSize / 2)
					local inset = game:GetService("GuiService"):GetGuiInset()
					local x, y = posAbsolute.X, posAbsolute.Y + inset.Y
					VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, game, 1)
					task.wait(0.015)
					VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, game, 1)
					task.wait(customDelay)
				end)
				task.wait(0.01)
			end
		end)
	end)
	tapButton.MouseButton1Up:Connect(function() isTapping = false tapButton.BackgroundColor3 = Color3.fromRGB(12, 12, 16) end)
	tapButton.MouseLeave:Connect(function() isTapping = false tapButton.BackgroundColor3 = Color3.fromRGB(12, 12, 16) end)
else
	local infoVip = Instance.new("TextLabel", pageVip)
	infoVip.Size = UDim2.new(1, 0, 1, 0)
	infoVip.BackgroundTransparency = 1
	infoVip.TextColor3 = Color3.fromRGB(220, 60, 60)
	infoVip.Font = Enum.Font.GothamBold
	infoVip.TextSize = 13
	infoVip.Text = "ACCESS DENIED!\n[ Username Not Whitelisted ]"
end
