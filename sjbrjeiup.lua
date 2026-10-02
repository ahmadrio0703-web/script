-- ==========================================
-- LYNN MOD MENU - DARK VOID (SILVER VIP EDITION)
-- ==========================================
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService") 
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local PlaceId = game.PlaceId

local targetParent = nil
pcall(function()
	if gethui then targetParent = gethui() end
end)
if not targetParent then
	pcall(function() targetParent = game:GetService("CoreGui") end)
end
if not targetParent then
	targetParent = player:WaitForChild("PlayerGui")
end

pcall(function()
	if targetParent:FindFirstChild("LynnModMenuDarkVoid") then 
		targetParent.LynnModMenuDarkVoid:Destroy() 
	end
end)

local passwordBenar = "123sandi"

local menuGui = Instance.new("ScreenGui")
menuGui.Name = "LynnModMenuDarkVoid"
menuGui.ResetOnSpawn = false
menuGui.DisplayOrder = 999999 
menuGui.Parent = targetParent

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

-- ==========================================
-- LOGIN SCREEN
-- ==========================================
local loginFrame = Instance.new("Frame", menuGui)
loginFrame.Size = UDim2.new(0, 320, 0, 180)
loginFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
loginFrame.AnchorPoint = Vector2.new(0.5, 0.5)
loginFrame.BackgroundColor3 = Color3.fromRGB(9, 9, 13)
loginFrame.BorderSizePixel = 0
loginFrame.ZIndex = 888888
Instance.new("UICorner", loginFrame).CornerRadius = UDim.new(0, 12)

local loginStroke = Instance.new("UIStroke", loginFrame)
loginStroke.Color = Color3.fromRGB(45, 45, 60)
loginStroke.Thickness = 1.5

local loginTitle = Instance.new("TextLabel", loginFrame)
loginTitle.Size = UDim2.new(1, 0, 0, 30)
loginTitle.Position = UDim2.new(0, 0, 0, 15)
loginTitle.BackgroundTransparency = 1
loginTitle.Text = "DARK VOID // AUTHENTICATION"
loginTitle.TextColor3 = Color3.fromRGB(240, 240, 250)
loginTitle.Font = Enum.Font.GothamBold
loginTitle.TextSize = 12
loginTitle.ZIndex = 888888

local loginDesc = Instance.new("TextLabel", loginFrame)
loginDesc.Size = UDim2.new(1, -40, 0, 20)
loginDesc.Position = UDim2.new(0, 20, 0, 45)
loginDesc.BackgroundTransparency = 1
loginDesc.Text = "Masukkan password akses operator untuk melanjutkan."
loginDesc.TextColor3 = Color3.fromRGB(150, 150, 165)
loginDesc.Font = Enum.Font.Gotham
loginDesc.TextSize = 10
loginDesc.ZIndex = 888888

local inputPassBox = Instance.new("TextBox", loginFrame)
inputPassBox.Size = UDim2.new(1, -40, 0, 38)
inputPassBox.Position = UDim2.new(0, 20, 0, 75)
inputPassBox.BackgroundColor3 = Color3.fromRGB(14, 14, 20)
inputPassBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputPassBox.PlaceholderText = "Ketik password di sini..."
inputPassBox.Text = ""
inputPassBox.Font = Enum.Font.Gotham
inputPassBox.TextSize = 11
inputPassBox.ClearTextOnFocus = false
inputPassBox.ZIndex = 888888
Instance.new("UICorner", inputPassBox).CornerRadius = UDim.new(0, 6)
local boxStroke = Instance.new("UIStroke", inputPassBox)
boxStroke.Color = Color3.fromRGB(50, 50, 65)
boxStroke.Thickness = 1.2

local btnSubmitLogin = Instance.new("TextButton", loginFrame)
btnSubmitLogin.Size = UDim2.new(1, -40, 0, 35)
btnSubmitLogin.Position = UDim2.new(0, 20, 0, 124)
btnSubmitLogin.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
btnSubmitLogin.Text = "LOGIN"
btnSubmitLogin.TextColor3 = Color3.fromRGB(220, 220, 235)
btnSubmitLogin.Font = Enum.Font.GothamBold
btnSubmitLogin.TextSize = 11
btnSubmitLogin.ZIndex = 888888
Instance.new("UICorner", btnSubmitLogin).CornerRadius = UDim.new(0, 6)
local btnLoginStroke = Instance.new("UIStroke", btnSubmitLogin)
btnLoginStroke.Color = Color3.fromRGB(60, 60, 75)
btnLoginStroke.Thickness = 1.2

-- ==========================================
-- MENU UTAMA ULTIMATE
-- ==========================================
local function BukaMenuUtamaUltimate()
	local isFullScreen = false 
	local menuTerbuka = true

	local replayPath = {}
	local isRecordingReplay = false
	local isPlayingReplay = false

	local btnToggle = Instance.new("ImageButton")
	btnToggle.Size = UDim2.new(0, 50, 0, 50) 
	btnToggle.Position = UDim2.new(0, 20, 0.5, -25) 
	btnToggle.BackgroundColor3 = Color3.fromRGB(7, 7, 9) 
	btnToggle.Image = "rbxassetid://87702703004415" 
	btnToggle.Parent = menuGui

	Instance.new("UICorner", btnToggle).CornerRadius = UDim.new(1, 0)
	local toggleStroke = Instance.new("UIStroke", btnToggle)
	toggleStroke.Color = Color3.fromRGB(45, 45, 55)
	toggleStroke.Thickness = 1.5

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

	BuatBisaDigeser(btnToggle)

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

	-- MAIN FRAME
	local mainFrame = Instance.new("Frame")
	mainFrame.Size = UDim2.new(0, 480, 0, 270)
	mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	mainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 11) 
	mainFrame.BorderSizePixel = 0
	mainFrame.ClipsDescendants = true
	mainFrame.Parent = menuGui
	Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)
	local mainStroke = Instance.new("UIStroke", mainFrame)
	mainStroke.Color = Color3.fromRGB(38, 38, 48)
	mainStroke.Thickness = 1.2
	BuatBisaDigeser(mainFrame) 

	local btnTutup = Instance.new("TextButton", mainFrame)
	btnTutup.Size = UDim2.new(0, 24, 0, 24)
	btnTutup.Position = UDim2.new(1, -12, 0, 10)
	btnTutup.AnchorPoint = Vector2.new(1, 0)
	btnTutup.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
	btnTutup.Text = "X"
	btnTutup.TextColor3 = Color3.fromRGB(240, 90, 90)
	btnTutup.Font = Enum.Font.GothamBold
	btnTutup.TextSize = 11
	Instance.new("UICorner", btnTutup).CornerRadius = UDim.new(0, 5)
	Instance.new("UIStroke", btnTutup).Color = Color3.fromRGB(45, 45, 60)

	local btnMax = Instance.new("TextButton", mainFrame)
	btnMax.Size = UDim2.new(0, 24, 0, 24)
	btnMax.Position = UDim2.new(1, -41, 0, 10) 
	btnMax.AnchorPoint = Vector2.new(1, 0)
	btnMax.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
	btnMax.Text = "[ ]"
	btnMax.TextColor3 = Color3.fromRGB(220, 220, 235)
	btnMax.Font = Enum.Font.GothamBold
	btnMax.TextSize = 10
	Instance.new("UICorner", btnMax).CornerRadius = UDim.new(0, 5)
	Instance.new("UIStroke", btnMax).Color = Color3.fromRGB(45, 45, 60)

	-- SIDEBAR KIRI
	local sidebarBg = Instance.new("Frame", mainFrame)
	sidebarBg.Size = UDim2.new(0, 125, 1, 0)
	sidebarBg.BackgroundColor3 = Color3.fromRGB(11, 11, 15)
	sidebarBg.BorderSizePixel = 0
	Instance.new("UICorner", sidebarBg).CornerRadius = UDim.new(0, 10)

	local fixKananSidebar = Instance.new("Frame", sidebarBg)
	fixKananSidebar.Size = UDim2.new(0, 10, 1, 0)
	fixKananSidebar.Position = UDim2.new(1, -10, 0, 0)
	fixKananSidebar.BackgroundColor3 = Color3.fromRGB(11, 11, 15)
	fixKananSidebar.BorderSizePixel = 0

	local garisSidebar = Instance.new("Frame", mainFrame)
	garisSidebar.Size = UDim2.new(0, 1, 1, 0)
	garisSidebar.Position = UDim2.new(0, 125, 0, 0) 
	garisSidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
	garisSidebar.BorderSizePixel = 0

	-- FOTO PROFIL
	local fotoProfil = Instance.new("ImageLabel", mainFrame)
	fotoProfil.Size = UDim2.new(0, 42, 0, 42)
	fotoProfil.Position = UDim2.new(0, 14, 0, 15) 
	fotoProfil.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
	pcall(function()
		fotoProfil.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
	end)
	Instance.new("UICorner", fotoProfil).CornerRadius = UDim.new(1, 0) 
	local fotoStroke = Instance.new("UIStroke", fotoProfil)
	fotoStroke.Color = Color3.fromRGB(45, 45, 58)
	fotoStroke.Thickness = 1.2

	local namaUser = Instance.new("TextLabel", mainFrame)
	namaUser.Size = UDim2.new(0, 75, 0, 16)
	namaUser.Position = UDim2.new(0, 60, 0, 16)
	namaUser.BackgroundTransparency = 1
	namaUser.Text = player.Name
	namaUser.TextColor3 = Color3.fromRGB(230, 230, 240)
	namaUser.Font = Enum.Font.GothamBold
	namaUser.TextSize = 11
	namaUser.TextXAlignment = Enum.TextXAlignment.Center

	local pingBadge = Instance.new("Frame", mainFrame)
	pingBadge.Size = UDim2.new(0, 56, 0, 18)
	pingBadge.Position = UDim2.new(0, 62, 0, 36)
	pingBadge.BackgroundColor3 = Color3.fromRGB(14, 14, 20)
	pingBadge.BorderSizePixel = 0
	Instance.new("UICorner", pingBadge).CornerRadius = UDim.new(1, 0)

	local pingBadgeStroke = Instance.new("UIStroke", pingBadge)
	pingBadgeStroke.Color = Color3.fromRGB(45, 45, 60)
	pingBadgeStroke.Thickness = 1

	local pingDot = Instance.new("Frame", pingBadge)
	pingDot.Size = UDim2.new(0, 5, 0, 5)
	pingDot.Position = UDim2.new(0, 6, 0.5, -2.5)
	pingDot.BackgroundColor3 = Color3.fromRGB(80, 220, 120)
	pingDot.BorderSizePixel = 0
	Instance.new("UICorner", pingDot).CornerRadius = UDim.new(1, 0)

	local pingText = Instance.new("TextLabel", pingBadge)
	pingText.Size = UDim2.new(1, -14, 1, 0)
	pingText.Position = UDim2.new(0, 12, 0, 0)
	pingText.BackgroundTransparency = 1
	pingText.Text = "0ms"
	pingText.TextColor3 = Color3.fromRGB(200, 200, 210)
	pingText.Font = Enum.Font.GothamBold
	pingText.TextSize = 9
	pingText.TextXAlignment = Enum.TextXAlignment.Center

	task.spawn(function()
		while true do
			pcall(function()
				local pingVal = math.floor(player:GetNetworkPing() * 1000)
				pingText.Text = pingVal .. "ms"
				if pingVal < 150 then
					pingDot.BackgroundColor3 = Color3.fromRGB(80, 220, 120)
					pingBadgeStroke.Color = Color3.fromRGB(40, 90, 55)
				elseif pingVal < 300 then
					pingDot.BackgroundColor3 = Color3.fromRGB(240, 205, 80)
					pingBadgeStroke.Color = Color3.fromRGB(100, 90, 35)
				else
					pingDot.BackgroundColor3 = Color3.fromRGB(240, 90, 90)
					pingBadgeStroke.Color = Color3.fromRGB(100, 40, 40)
				end
			end)
			task.wait(1)
		end
	end)

	local function BuatTombolTab(posY, namaTeks)
		local btn = Instance.new("TextButton", mainFrame)
		btn.Size = UDim2.new(0, 105, 0, 24)
		btn.Position = UDim2.new(0, 10, 0, posY)
		btn.BackgroundColor3 = Color3.fromRGB(11, 11, 15) 
		btn.Text = namaTeks
		btn.TextColor3 = Color3.fromRGB(140, 140, 155)
		btn.Font = Enum.Font.Gotham
		btn.TextSize = 11
		Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
		return btn
	end

	-- TOMBOL TAB
	local btnTabVip    = BuatTombolTab(75, "VIP")
	local btnTabPlayer = BuatTombolTab(103, "Player")
	local btnTabVisual = BuatTombolTab(131, "Visuals")
	local btnTabMount  = BuatTombolTab(159, "Mount")
	local btnTabTroll  = BuatTombolTab(187, "Troll")
	local btnTabPerf   = BuatTombolTab(215, "Settings")

	btnTabVip.TextColor3 = Color3.fromRGB(240, 240, 245)
	btnTabVip.Font = Enum.Font.GothamBold
	btnTabVip.TextSize = 12
	local vipStroke = Instance.new("UIStroke", btnTabVip)
	vipStroke.Color = Color3.fromRGB(80, 80, 100)
	vipStroke.Thickness = 1

	btnTabPlayer.BackgroundColor3 = Color3.fromRGB(18, 18, 25) 
	btnTabPlayer.TextColor3 = Color3.fromRGB(245, 245, 250)

	local wmText = Instance.new("TextLabel", mainFrame)
	wmText.Size = UDim2.new(0, 100, 0, 15)
	wmText.Position = UDim2.new(0, 14, 1, -20) 
	wmText.BackgroundTransparency = 1
	wmText.Text = "DarkVoid // @lyosh"
	wmText.TextColor3 = Color3.fromRGB(80, 80, 100) 
	wmText.Font = Enum.Font.Gotham
	wmText.TextSize = 10
	wmText.TextXAlignment = Enum.TextXAlignment.Left

	local judulMain = Instance.new("TextLabel", mainFrame)
	judulMain.Size = UDim2.new(1, -135, 0, 40)
	judulMain.Position = UDim2.new(0, 135, 0, 0)
	judulMain.BackgroundTransparency = 1
	judulMain.Text = "LYNN VOID"
	judulMain.TextColor3 = Color3.fromRGB(235, 235, 245)
	judulMain.Font = Enum.Font.GothamBold
	judulMain.TextSize = 13
	judulMain.TextXAlignment = Enum.TextXAlignment.Center

	local garisJudul = Instance.new("Frame", mainFrame)
	garisJudul.Size = UDim2.new(1, -145, 0, 1)
	garisJudul.Position = UDim2.new(0, 135, 0, 40)
	garisJudul.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
	garisJudul.BorderSizePixel = 0

	-- HALAMAN / PAGES
	local pageVip = Instance.new("ScrollingFrame", mainFrame)
	pageVip.Size = UDim2.new(1, -130, 1, -45)
	pageVip.Position = UDim2.new(0, 130, 0, 45)
	pageVip.BackgroundTransparency = 1
	pageVip.Visible = false
	pageVip.CanvasSize = UDim2.new(0, 0, 3.5, 0)
	pageVip.ScrollBarThickness = 3

	local pagePlayer = Instance.new("ScrollingFrame", mainFrame)
	pagePlayer.Size = UDim2.new(1, -130, 1, -45)
	pagePlayer.Position = UDim2.new(0, 130, 0, 45)
	pagePlayer.BackgroundTransparency = 1
	pagePlayer.Visible = true 
	pagePlayer.CanvasSize = UDim2.new(0, 0, 1.6, 0)
	pagePlayer.ScrollBarThickness = 3

	local pageVisual = Instance.new("ScrollingFrame", mainFrame)
	pageVisual.Size = UDim2.new(1, -130, 1, -45)
	pageVisual.Position = UDim2.new(0, 130, 0, 45)
	pageVisual.BackgroundTransparency = 1
	pageVisual.Visible = false 
	pageVisual.CanvasSize = UDim2.new(0, 0, 1.2, 0)
	pageVisual.ScrollBarThickness = 3

	local pageMount = Instance.new("ScrollingFrame", mainFrame)
	pageMount.Size = UDim2.new(1, -130, 1, -45)
	pageMount.Position = UDim2.new(0, 130, 0, 45)
	pageMount.BackgroundTransparency = 1
	pageMount.Visible = false
	pageMount.CanvasSize = UDim2.new(0, 0, 1.2, 0)
	pageMount.ScrollBarThickness = 3

	local pageTroll = Instance.new("ScrollingFrame", mainFrame)
	pageTroll.Size = UDim2.new(1, -130, 1, -45)
	pageTroll.Position = UDim2.new(0, 130, 0, 45)
	pageTroll.BackgroundTransparency = 1
	pageTroll.Visible = false
	pageTroll.CanvasSize = UDim2.new(0, 0, 1.6, 0)
	pageTroll.ScrollBarThickness = 3

	local pagePerf = Instance.new("ScrollingFrame", mainFrame)
	pagePerf.Size = UDim2.new(1, -130, 1, -45)
	pagePerf.Position = UDim2.new(0, 130, 0, 45)
	pagePerf.BackgroundTransparency = 1
	pagePerf.Visible = false
	pagePerf.CanvasSize = UDim2.new(0, 0, 1.4, 0)
	pagePerf.ScrollBarThickness = 3

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

	-- TAB 1: VIP (FAST TAP, BOT REPLAY, & SERVER SCAN DENGAN ANIMASI SILVER BERKILAU)
	local databaseVip = {
		["Lyosh71"] = true,
		["gantung300"] = true,
	}

	if databaseVip[player.Name] then
		local vipCard = Instance.new("Frame", pageVip)
		vipCard.Size = UDim2.new(1, -20, 0, 75)
		vipCard.Position = UDim2.new(0, 10, 0, 12)
		vipCard.BackgroundColor3 = Color3.fromRGB(10, 10, 13)
		Instance.new("UICorner", vipCard).CornerRadius = UDim.new(0, 8)
		
		local cardStroke = Instance.new("UIStroke", vipCard)
		cardStroke.Color = Color3.fromRGB(120, 130, 145)
		cardStroke.Thickness = 1.5

		local vipAccent = Instance.new("Frame", vipCard)
		vipAccent.Size = UDim2.new(0, 4, 1, -16)
		vipAccent.Position = UDim2.new(0, 8, 0, 8)
		vipAccent.BackgroundColor3 = Color3.fromRGB(200, 210, 225)
		vipAccent.BorderSizePixel = 0
		Instance.new("UICorner", vipAccent).CornerRadius = UDim.new(1, 0)

		-- Looping Animasi Silver Berkilau untuk Card VIP
		task.spawn(function()
			while vipCard.Parent do
				TweenService:Create(cardStroke, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
					Color = Color3.fromRGB(225, 235, 255)
				}):Play()
				TweenService:Create(vipAccent, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
					BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				}):Play()
				task.wait(0.9)
				
				TweenService:Create(cardStroke, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
					Color = Color3.fromRGB(90, 100, 115)
				}):Play()
				TweenService:Create(vipAccent, TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
					BackgroundColor3 = Color3.fromRGB(140, 150, 170)
				}):Play()
				task.wait(0.9)
			end
		end)

		local vipTitle = Instance.new("TextLabel", vipCard)
		vipTitle.Size = UDim2.new(1, -25, 0, 22)
		vipTitle.Position = UDim2.new(0, 24, 0, 10)
		vipTitle.BackgroundTransparency = 1
		vipTitle.Text = "⚡ SILVER VIP // SYSTEM OVERRIDE"
		vipTitle.TextColor3 = Color3.fromRGB(235, 240, 250)
		vipTitle.Font = Enum.Font.GothamBold
		vipTitle.TextSize = 11
		vipTitle.TextXAlignment = Enum.TextXAlignment.Left

		local vipDesc = Instance.new("TextLabel", vipCard)
		vipDesc.Size = UDim2.new(1, -25, 0, 30)
		vipDesc.Position = UDim2.new(0, 24, 0, 32)
		vipDesc.BackgroundTransparency = 1
		vipDesc.Text = "Operator: " .. player.Name .. " — Metallic Silver Core Active."
		vipDesc.TextColor3 = Color3.fromRGB(150, 160, 175)
		vipDesc.Font = Enum.Font.Gotham
		vipDesc.TextSize = 10
		vipDesc.TextXAlignment = Enum.TextXAlignment.Left

		local fastTapRow = Instance.new("Frame", pageVip)
		fastTapRow.Size = UDim2.new(1, -20, 0, 35)
		fastTapRow.Position = UDim2.new(0, 10, 0, 98)
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

		-- BOT REPLAY
		local replayRow = Instance.new("Frame", pageVip)
		replayRow.Size = UDim2.new(1, -20, 0, 160)
		replayRow.Position = UDim2.new(0, 10, 0, 142)
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

		-- FITUR SCAN SERVER SEPI DI TAB VIP (POSISI DIDALAM HALAMAN VIP)
		local scanServerRow = Instance.new("Frame", pageVip)
		scanServerRow.Size = UDim2.new(1, -20, 0, 35)
		scanServerRow.Position = UDim2.new(0, 10, 0, 315)
		scanServerRow.BackgroundTransparency = 1

		local scanServerBtn = Instance.new("TextButton", scanServerRow)
		scanServerBtn.Size = UDim2.new(1, 0, 1, 0)
		scanServerBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
		scanServerBtn.TextColor3 = Color3.fromRGB(210, 210, 220)
		scanServerBtn.TextSize = 11
		scanServerBtn.Font = Enum.Font.GothamBold
		scanServerBtn.Text = "SCAN SERVER SEPI"
		Instance.new("UICorner", scanServerBtn).CornerRadius = UDim.new(0, 6)
		local scanBtnStroke = Instance.new("UIStroke", scanServerBtn)
		scanBtnStroke.Color = Color3.fromRGB(45, 45, 58)
		scanBtnStroke.Thickness = 1.2

		-- Container List Pilihan Server (Muncul langsung di bawah tombol scan di dalam tab VIP)
		local listContainer = Instance.new("Frame", pageVip)
		listContainer.Size = UDim2.new(1, -20, 0, 140)
		listContainer.Position = UDim2.new(0, 10, 0, 358)
		listContainer.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
		listContainer.BorderSizePixel = 0
		listContainer.Visible = false
		Instance.new("UICorner", listContainer).CornerRadius = UDim.new(0, 6)
		Instance.new("UIStroke", listContainer).Color = Color3.fromRGB(40, 40, 52)

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

	-- ==========================================
	-- TAB 2: PLAYER
	-- ==========================================
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

	-- ==========================================
	-- TAB 3: VISUALS
	-- ==========================================
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
		TweenService:Create(switchFbBg, TweenInfo.new(0.25), {BackgroundColor3 = fullbrightOn and warnaBgOn or warnaBgOff}):Play()
		TweenService:Create(knobFb, TweenInfo.new(0.25), {Position = fullbrightOn and posKnobOn or posKnobOff, BackgroundColor3 = fullbrightOn and warnaKnobOn or warnaKnobOff}):Play()
		UpdateFullbright()
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
		end
	end
	btnEsp.MouseButton1Click:Connect(function() espOn = not espOn AnimasiSaklar(espOn, bgEsp, knobEsp) refreshESP() end)

	-- ==========================================
	-- TAB 4: MOUNT
	-- ==========================================
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

	-- ==========================================
	-- TAB 5: TROLL (FLING YIELD, SPINBOT, SHAKE)
	-- ==========================================
	local trollTitle = Instance.new("TextLabel", pageTroll)
	trollTitle.Size = UDim2.new(1, -20, 0, 25)
	trollTitle.Position = UDim2.new(0, 10, 0, 10)
	trollTitle.BackgroundTransparency = 1
	trollTitle.Text = "TROLL & CHAOS TOOLS"
	trollTitle.TextColor3 = Color3.fromRGB(240, 90, 90)
	trollTitle.Font = Enum.Font.GothamBold
	trollTitle.TextSize = 12
	trollTitle.TextXAlignment = Enum.TextXAlignment.Left

	-- Spinbot
	local btnSpin, bgSpin, knobSpin, _ = BuatRowSaklar(pageTroll, 40, "Spinbot Troll", "", false)
	local spinOn = false
	local spinConnection

	btnSpin.MouseButton1Click:Connect(function()
		spinOn = not spinOn
		AnimasiSaklar(spinOn, bgSpin, knobSpin)
		if spinOn then
			spinConnection = RunService.RenderStepped:Connect(function()
				pcall(function()
					local char = player.Character
					if char and char:FindFirstChild("HumanoidRootPart") then
						char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(50), 0)
					end
				end)
			end)
			TampilkanNotifikasiHijau("Spinbot Aktif!")
		else
			if spinConnection then spinConnection:Disconnect() end
			TampilkanNotifikasiHijau("Spinbot Mati.")
		end
	end)

	-- Fling Target ala Infinite Yield
	local flingTargetRow = Instance.new("Frame", pageTroll)
	flingTargetRow.Size = UDim2.new(1, -20, 0, 48)
	flingTargetRow.Position = UDim2.new(0, 10, 0, 85)
	flingTargetRow.BackgroundTransparency = 1

	local flingLabel = Instance.new("TextLabel", flingTargetRow)
	flingLabel.Size = UDim2.new(1, 0, 0, 18)
	flingLabel.BackgroundTransparency = 1
	flingLabel.Text = "Fling Target (Ketik Nama Player)"
	flingLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
	flingLabel.Font = Enum.Font.Gotham
	flingLabel.TextSize = 11
	flingLabel.TextXAlignment = Enum.TextXAlignment.Left

	local inputTargetFling = Instance.new("TextBox", flingTargetRow)
	inputTargetFling.Size = UDim2.new(0, 150, 0, 24)
	inputTargetFling.Position = UDim2.new(0, 0, 0, 22)
	inputTargetFling.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
	inputTargetFling.TextColor3 = Color3.fromRGB(240, 240, 250)
	inputTargetFling.PlaceholderText = "Nama Player..."
	inputTargetFling.Text = ""
	inputTargetFling.Font = Enum.Font.Gotham
	inputTargetFling.TextSize = 10 
	Instance.new("UICorner", inputTargetFling).CornerRadius = UDim.new(0, 4)
	Instance.new("UIStroke", inputTargetFling).Color = Color3.fromRGB(38, 38, 48)

	local btnExecFling = Instance.new("TextButton", flingTargetRow)
	btnExecFling.Size = UDim2.new(0, 80, 0, 24)
	btnExecFling.Position = UDim2.new(1, -80, 0, 22)
	btnExecFling.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
	btnExecFling.Text = "FLING!"
	btnExecFling.TextColor3 = Color3.fromRGB(220, 220, 235)
	btnExecFling.Font = Enum.Font.GothamBold
	btnExecFling.TextSize = 10
	Instance.new("UICorner", btnExecFling).CornerRadius = UDim.new(0, 4)
	Instance.new("UIStroke", btnExecFling).Color = Color3.fromRGB(45, 45, 58)

	btnExecFling.MouseButton1Click:Connect(function()
		pcall(function()
			local targetName = inputTargetFling.Text
			local targetPlayer = nil
			for _, p in pairs(Players:GetPlayers()) do
				if string.sub(string.lower(p.Name), 1, string.len(targetName)) == string.lower(targetName) then
					targetPlayer = p
					break
				end
			end
			
			if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
				TampilkanNotifikasiHijau("Mulai Fling " .. targetPlayer.Name .. "!")
				task.spawn(function()
					local startTime = tick()
					local char = player.Character
					local root = char and char:FindFirstChild("HumanoidRootPart")
					local tRoot = targetPlayer.Character.HumanoidRootPart
					
					while tick() - startTime < 3 and root and tRoot do
						pcall(function()
							root.CFrame = tRoot.CFrame
							root.Velocity = Vector3.new(99999, 99999, 99999)
							root.RotVelocity = Vector3.new(99999, 99999, 99999)
						end)
						task.wait()
					end
					TampilkanNotifikasiHijau("Fling Selesai!")
				end)
			else
				TampilkanNotifikasiHijau("Player tidak ditemukan!")
			end
		end)
	end)

	-- Earthquake Camera
	local shakeRow = Instance.new("Frame", pageTroll)
	shakeRow.Size = UDim2.new(1, -20, 0, 35)
	shakeRow.Position = UDim2.new(0, 10, 0, 145)
	shakeRow.BackgroundTransparency = 1

	local shakeLabel = Instance.new("TextLabel", shakeRow)
	shakeLabel.Size = UDim2.new(0.5, 0, 1, 0)
	shakeLabel.BackgroundTransparency = 1
	shakeLabel.Text = "Earthquake Cam"
	shakeLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
	shakeLabel.Font = Enum.Font.Gotham
	shakeLabel.TextSize = 12
	shakeLabel.TextXAlignment = Enum.TextXAlignment.Left

	local switchShakeBg = Instance.new("Frame", shakeRow)
	switchShakeBg.Size = UDim2.new(0, 40, 0, 20)
	switchShakeBg.Position = UDim2.new(1, -40, 0.5, -10)
	switchShakeBg.BackgroundColor3 = Color3.fromRGB(18, 18, 24) 
	Instance.new("UICorner", switchShakeBg).CornerRadius = UDim.new(1, 0)
	Instance.new("UIStroke", switchShakeBg).Color = Color3.fromRGB(40, 40, 52)

	local knobShake = Instance.new("Frame", switchShakeBg)
	knobShake.Size = UDim2.new(0, 14, 0, 14)
	knobShake.Position = UDim2.new(0, 3, 0.5, -7) 
	knobShake.BackgroundColor3 = Color3.fromRGB(140, 140, 155)
	Instance.new("UICorner", knobShake).CornerRadius = UDim.new(1, 0)

	local btnShake = Instance.new("TextButton", switchShakeBg)
	btnShake.Size = UDim2.new(1, 0, 1, 0)
	btnShake.BackgroundTransparency = 1
	btnShake.Text = ""

	local shakeOn = false
	local shakeConn
	btnShake.MouseButton1Click:Connect(function()
		shakeOn = not shakeOn
		TweenService:Create(switchShakeBg, TweenInfo.new(0.25), {BackgroundColor3 = shakeOn and warnaBgOn or warnaBgOff}):Play()
		TweenService:Create(knobShake, TweenInfo.new(0.25), {Position = shakeOn and posKnobOn or posKnobOff}):Play()
		
		if shakeOn then
			TampilkanNotifikasiHijau("Earthquake Camera Aktif!")
			shakeConn = RunService.RenderStepped:Connect(function()
				pcall(function()
					local cam = workspace.CurrentCamera
					cam.CFrame = cam.CFrame * CFrame.new(math.random(-2,2)/10, math.random(-2,2)/10, 0)
				end)
			end)
		else
			if shakeConn then shakeConn:Disconnect() end
			TampilkanNotifikasiHijau("Earthquake Camera Mati.")
		end
	end)

	-- ==========================================
	-- TAB 6: SETTINGS
	-- ==========================================
	local btnAntiAfk, bgAntiAfk, knobAntiAfk, _ = BuatRowSaklar(pagePerf, 15, "Anti-AFK", "", false)
	local btnAntiLag, bgAntiLag, knobAntiLag, _ = BuatRowSaklar(pagePerf, 60, "Anti-Lag", "", false)

	local antiAfkOn, antiLagOn = false, false

	local afkConnection
	btnAntiAfk.MouseButton1Click:Connect(function()
		antiAfkOn = not antiAfkOn
		AnimasiSaklar(antiAfkOn, bgAntiAfk, knobAntiAfk)
		if antiAfkOn then
			afkConnection = player.Idled:Connect(function()
				VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
				task.wait(1)
				VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
			end)
		else
			if afkConnection then afkConnection:Disconnect() end
		end
	end)

	btnAntiLag.MouseButton1Click:Connect(function()
		antiLagOn = not antiLagOn
		AnimasiSaklar(antiLagOn, bgAntiLag, knobAntiLag)
		if antiLagOn then
			Lighting.GlobalShadows = false
			Lighting.FogEnd = 99999
			for _, v in pairs(Lighting:GetChildren()) do
				if v:IsA("PostEffect") then v.Enabled = false end
			end
		else
			Lighting.GlobalShadows = true
		end
	end)

	local timeRow = Instance.new("Frame", pagePerf)
	timeRow.Size = UDim2.new(1, -20, 0, 35)
	timeRow.Position = UDim2.new(0, 10, 0, 105)
	timeRow.BackgroundTransparency = 1

	local timeLabel = Instance.new("TextLabel", timeRow)
	timeLabel.Size = UDim2.new(0.4, 0, 1, 0)
	timeLabel.BackgroundTransparency = 1
	timeLabel.Text = "World Time"
	timeLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
	timeLabel.Font = Enum.Font.Gotham
	timeLabel.TextSize = 12
	timeLabel.TextXAlignment = Enum.TextXAlignment.Left

	local btnSiang = Instance.new("TextButton", timeRow)
	btnSiang.Size = UDim2.new(0, 48, 0, 24)
	btnSiang.Position = UDim2.new(1, -102, 0.5, -12)
	btnSiang.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
	btnSiang.Text = "SIANG"
	btnSiang.TextColor3 = Color3.fromRGB(210, 210, 220)
	btnSiang.Font = Enum.Font.GothamMedium
	btnSiang.TextSize = 9
	Instance.new("UICorner", btnSiang).CornerRadius = UDim.new(0, 4)
	Instance.new("UIStroke", btnSiang).Color = Color3.fromRGB(45, 45, 58)

	local btnMalam = Instance.new("TextButton", timeRow)
	btnMalam.Size = UDim2.new(0, 48, 0, 24)
	btnMalam.Position = UDim2.new(1, -50, 0.5, -12)
	btnMalam.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
	btnMalam.Text = "MALAM"
	btnMalam.TextColor3 = Color3.fromRGB(160, 160, 175)
	btnMalam.Font = Enum.Font.GothamMedium
	btnMalam.TextSize = 9
	Instance.new("UICorner", btnMalam).CornerRadius = UDim.new(0, 4)
	Instance.new("UIStroke", btnMalam).Color = Color3.fromRGB(38, 38, 48)

	btnSiang.MouseButton1Click:Connect(function() Lighting.ClockTime = 14 TampilkanNotifikasiHijau("Waktu: Siang") end)
	btnMalam.MouseButton1Click:Connect(function() Lighting.ClockTime = 0 TampilkanNotifikasiHijau("Waktu: Malam") end)

	local fovRow = Instance.new("Frame", pagePerf)
	fovRow.Size = UDim2.new(1, -20, 0, 35)
	fovRow.Position = UDim2.new(0, 10, 0, 150)
	fovRow.BackgroundTransparency = 1

	local fovLabel = Instance.new("TextLabel", fovRow)
	fovLabel.Size = UDim2.new(0.4, 0, 1, 0)
	fovLabel.BackgroundTransparency = 1
	fovLabel.Text = "Camera FOV"
	fovLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
	fovLabel.Font = Enum.Font.Gotham
	fovLabel.TextSize = 12
	fovLabel.TextXAlignment = Enum.TextXAlignment.Left

	local inputFov = Instance.new("TextBox", fovRow)
	inputFov.Size = UDim2.new(0, 48, 0, 24)
	inputFov.Position = UDim2.new(1, -102, 0.5, -12)
	inputFov.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
	inputFov.TextColor3 = Color3.fromRGB(240, 240, 250)
	inputFov.Text = "70"
	inputFov.Font = Enum.Font.Gotham
	inputFov.TextSize = 10
	Instance.new("UICorner", inputFov).CornerRadius = UDim.new(0, 4)
	Instance.new("UIStroke", inputFov).Color = Color3.fromRGB(38, 38, 48)

	local btnSetFov = Instance.new("TextButton", fovRow)
	btnSetFov.Size = UDim2.new(0, 48, 0, 24)
	btnSetFov.Position = UDim2.new(1, -50, 0.5, -12)
	btnSetFov.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
	btnSetFov.Text = "SET"
	btnSetFov.TextColor3 = Color3.fromRGB(210, 210, 220)
	btnSetFov.Font = Enum.Font.GothamMedium
	btnSetFov.TextSize = 10
	Instance.new("UICorner", btnSetFov).CornerRadius = UDim.new(0, 4)
	Instance.new("UIStroke", btnSetFov).Color = Color3.fromRGB(45, 45, 58)

	btnSetFov.MouseButton1Click:Connect(function()
		pcall(function()
			local val = tonumber(inputFov.Text)
			if val and val >= 10 then
				workspace.CurrentCamera.FieldOfView = val
				TampilkanNotifikasiHijau("FOV diatur ke: " .. val)
			end
		end)
	end)

	local utilRow = Instance.new("Frame", pagePerf)
	utilRow.Size = UDim2.new(1, -20, 0, 35)
	utilRow.Position = UDim2.new(0, 10, 0, 195)
	utilRow.BackgroundTransparency = 1

	local utilLabel = Instance.new("TextLabel", utilRow)
	utilLabel.Size = UDim2.new(0.3, 0, 1, 0)
	utilLabel.BackgroundTransparency = 1
	utilLabel.Text = "Server Tool"
	utilLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
	utilLabel.Font = Enum.Font.Gotham
	utilLabel.TextSize = 12
	utilLabel.TextXAlignment = Enum.TextXAlignment.Left

	local btnRejoin = Instance.new("TextButton", utilRow)
	btnRejoin.Size = UDim2.new(0, 50, 0, 24)
	btnRejoin.Position = UDim2.new(1, -126, 0.5, -12)
	btnRejoin.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
	btnRejoin.Text = "REJOIN"
	btnRejoin.TextColor3 = Color3.fromRGB(210, 210, 220)
	btnRejoin.Font = Enum.Font.GothamMedium
	btnRejoin.TextSize = 9
	Instance.new("UICorner", btnRejoin).CornerRadius = UDim.new(0, 4)
	Instance.new("UIStroke", btnRejoin).Color = Color3.fromRGB(45, 45, 58)

	local btnHop = Instance.new("TextButton", utilRow)
	btnHop.Size = UDim2.new(0, 72, 0, 24)
	btnHop.Position = UDim2.new(1, -72, 0.5, -12)
	btnHop.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
	btnHop.Text = "SERVER HOP"
	btnHop.TextColor3 = Color3.fromRGB(210, 210, 220)
	btnHop.Font = Enum.Font.GothamMedium
	btnHop.TextSize = 9
	Instance.new("UICorner", btnHop).CornerRadius = UDim.new(0, 4)
	Instance.new("UIStroke", btnHop).Color = Color3.fromRGB(45, 45, 58)

	btnRejoin.MouseButton1Click:Connect(function() pcall(function() TeleportService:Teleport(game.PlaceId, player) end) end)

	local infoFps = Instance.new("TextLabel", pagePerf)
	infoFps.Size = UDim2.new(1, -20, 0, 25)
	infoFps.Position = UDim2.new(0, 10, 0, 240)
	infoFps.BackgroundTransparency = 1
	infoFps.Text = "FPS: 60"
	infoFps.TextColor3 = Color3.fromRGB(140, 140, 155)
	infoFps.Font = Enum.Font.Gotham
	infoFps.TextSize = 11
	infoFps.TextXAlignment = Enum.TextXAlignment.Left

	local infoRam = Instance.new("TextLabel", pagePerf)
	infoRam.Size = UDim2.new(1, -20, 0, 25)
	infoRam.Position = UDim2.new(0, 10, 0, 265)
	infoRam.BackgroundTransparency = 1
	infoRam.Text = "RAM Usage: 0 MB"
	infoRam.TextColor3 = Color3.fromRGB(210, 170, 70)
	infoRam.Font = Enum.Font.Gotham
	infoRam.TextSize = 11
	infoRam.TextXAlignment = Enum.TextXAlignment.Left

	local frameCount = 0
	local lastTick = tick()
	RunService.RenderStepped:Connect(function()
		frameCount = frameCount + 1
		local currentTick = tick()
		if currentTick - lastTick >= 1 then
			local fps = math.floor(frameCount / (currentTick - lastTick))
			local ramUsage = math.floor(gcinfo() / 1024)
			infoFps.Text = "FPS: " .. fps
			infoRam.Text = "RAM Usage: " .. ramUsage .. " MB"
			frameCount = 0
			lastTick = currentTick
		end
	end)

	-- ==========================================
	-- TAB SWITCHING SYSTEM
	-- ==========================================
	local function GantiTab(aktif, p1, p2, p3, p4, p5, p6)
		p1.Visible = true p2.Visible = false p3.Visible = false p4.Visible = false p5.Visible = false p6.Visible = false
		btnTabVip.BackgroundColor3    = Color3.fromRGB(11, 11, 15) btnTabVip.TextColor3    = Color3.fromRGB(140, 140, 155)
		btnTabPlayer.BackgroundColor3 = Color3.fromRGB(11, 11, 15) btnTabPlayer.TextColor3 = Color3.fromRGB(140, 140, 155)
		btnTabVisual.BackgroundColor3 = Color3.fromRGB(11, 11, 15) btnTabVisual.TextColor3 = Color3.fromRGB(140, 140, 155)
		btnTabMount.BackgroundColor3  = Color3.fromRGB(11, 11, 15) btnTabMount.TextColor3  = Color3.fromRGB(140, 140, 155)
		btnTabTroll.BackgroundColor3  = Color3.fromRGB(11, 11, 15) btnTabTroll.TextColor3  = Color3.fromRGB(140, 140, 155)
		btnTabPerf.BackgroundColor3   = Color3.fromRGB(11, 11, 15) btnTabPerf.TextColor3   = Color3.fromRGB(140, 140, 155)
		
		aktif.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
		aktif.TextColor3 = Color3.fromRGB(245, 245, 250)
	end

	btnTabVip.MouseButton1Click:Connect(function()    GantiTab(btnTabVip, pageVip, pagePlayer, pageVisual, pageMount, pageTroll, pagePerf) end)
	btnTabPlayer.MouseButton1Click:Connect(function() GantiTab(btnTabPlayer, pagePlayer, pageVip, pageVisual, pageMount, pageTroll, pagePerf) end)
	btnTabVisual.MouseButton1Click:Connect(function() GantiTab(btnTabVisual, pageVisual, pageVip, pagePlayer, pageMount, pageTroll, pagePerf) end)
	btnTabMount.MouseButton1Click:Connect(function()  GantiTab(btnTabMount, pageMount, pageVip, pagePlayer, pageVisual, pageTroll, pagePerf) end)
	btnTabTroll.MouseButton1Click:Connect(function()  GantiTab(btnTabTroll, pageTroll, pageVip, pagePlayer, pageVisual, pageMount, pagePerf) end)
	btnTabPerf.MouseButton1Click:Connect(function()   GantiTab(btnTabPerf, pagePerf, pageVip, pagePlayer, pageVisual, pageMount, pageTroll) end)

	btnMax.MouseButton1Click:Connect(function()
		isFullScreen = not isFullScreen
		TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
			Size = isFullScreen and UDim2.new(1, 0, 1, 0) or UDim2.new(0, 480, 0, 270),
			Position = UDim2.new(0.5, 0, 0.5, 0)
		}):Play()
	end)

	btnTutup.MouseButton1Click:Connect(function() menuGui:Destroy() end)
	btnToggle.MouseButton1Click:Connect(function()
		menuTerbuka = not menuTerbuka
		local targetSize = menuTerbuka and (isFullScreen and UDim2.new(1, 0, 1, 0) or UDim2.new(0, 480, 0, 270)) or UDim2.new(0, 0, 0, 0)
		TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = targetSize, Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
	end)

	TampilkanNotifikasiHijau("Dark Void Ultimate Menu Loaded!")
end

-- LOGIKA LOGIN
local function CekLogin()
	if inputPassBox.Text == passwordBenar then
		TampilkanNotifikasiHijau("Login Berhasil! Memuat Menu...")
		
		TweenService:Create(loginFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
			Size = UDim2.new(0, 0, 0, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0)
		}):Play()
		
		task.wait(0.3)
		loginFrame:Destroy()
		
		BukaMenuUtamaUltimate()
	else
		TampilkanNotifikasiHijau("Password Salah! Coba lagi.")
		inputPassBox.Text = ""
	end
end

btnSubmitLogin.MouseButton1Click:Connect(CekLogin)
inputPassBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then CekLogin() end
end)
