-- ==========================================
-- LYNN MOD MENU - DARK VOID (SMOOTH & LOADING OVERLAY)
-- ==========================================
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService") 
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
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
-- LOGIN SCREEN (SMOOTH ANIMATION)
-- ==========================================
local loginFrame = Instance.new("Frame", menuGui)
loginFrame.Size = UDim2.new(0, 0, 0, 0)
loginFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
loginFrame.AnchorPoint = Vector2.new(0.5, 0.5)
loginFrame.BackgroundColor3 = Color3.fromRGB(9, 9, 13)
loginFrame.BorderSizePixel = 0
loginFrame.ZIndex = 888888
Instance.new("UICorner", loginFrame).CornerRadius = UDim.new(0, 12)

TweenService:Create(loginFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
	Size = UDim2.new(0, 320, 0, 180)
}):Play()

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
-- MENU UTAMA ULTIMATE (SMOOTH & MODULAR)
-- ==========================================
local function BukaMenuUtamaUltimate()
	local isFullScreen = false 
	local menuTerbuka = true

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

	-- MAIN FRAME
	local mainFrame = Instance.new("Frame")
	mainFrame.Size = UDim2.new(0, 0, 0, 0)
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

	-- Animasi buka main frame smooth
	TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 480, 0, 270)
	}):Play()

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

	-- FOTO PROFIL & PING
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
		btn.Size = UDim2.new(0, 105, 0, 22)
		btn.Position = UDim2.new(0, 10, 0, posY)
		btn.BackgroundColor3 = Color3.fromRGB(11, 11, 15) 
		btn.Text = namaTeks
		btn.TextColor3 = Color3.fromRGB(140, 140, 155)
		btn.Font = Enum.Font.Gotham
		btn.TextSize = 10.5
		Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
		return btn
	end

	-- 7 TOMBOL TAB UTAMA
	local btnTabVip     = BuatTombolTab(65, "VIP")
	local btnTabPlayer  = BuatTombolTab(90, "Player")
	local btnTabVisual  = BuatTombolTab(115, "Visuals")
	local btnTabScanner = BuatTombolTab(140, "Scanner")
	local btnTabMount   = BuatTombolTab(165, "Mount")
	local btnTabTroll   = BuatTombolTab(190, "Troll")
	local btnTabPerf    = BuatTombolTab(215, "Settings")

	btnTabVip.TextColor3 = Color3.fromRGB(240, 240, 245)
	btnTabVip.Font = Enum.Font.GothamBold
	btnTabVip.TextSize = 11.5
	local vipStroke = Instance.new("UIStroke", btnTabVip)
	vipStroke.Color = Color3.fromRGB(80, 80, 100)
	vipStroke.Thickness = 1

	local wmText = Instance.new("TextLabel", mainFrame)
	wmText.Size = UDim2.new(0, 100, 0, 15)
	wmText.Position = UDim2.new(0, 14, 1, -18) 
	wmText.BackgroundTransparency = 1
	wmText.Text = "DarkVoid // @lyosh"
	wmText.TextColor3 = Color3.fromRGB(80, 80, 100) 
	wmText.Font = Enum.Font.Gotham
	wmText.TextSize = 9.5
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

	-- 7 HALAMAN / PAGES KOSONG
	local pageVip = Instance.new("ScrollingFrame", mainFrame)
	pageVip.Size = UDim2.new(1, -130, 1, -45)
	pageVip.Position = UDim2.new(0, 130, 0, 45)
	pageVip.BackgroundTransparency = 1
	pageVip.Visible = false
	pageVip.CanvasSize = UDim2.new(0, 0, 2, 0)
	pageVip.ScrollBarThickness = 3

	local pagePlayer = Instance.new("ScrollingFrame", mainFrame)
	pagePlayer.Size = UDim2.new(1, -130, 1, -45)
	pagePlayer.Position = UDim2.new(0, 130, 0, 45)
	pagePlayer.BackgroundTransparency = 1
	pagePlayer.Visible = true 
	pagePlayer.CanvasSize = UDim2.new(0, 0, 2, 0)
	pagePlayer.ScrollBarThickness = 3

	local pageVisual = Instance.new("ScrollingFrame", mainFrame)
	pageVisual.Size = UDim2.new(1, -130, 1, -45)
	pageVisual.Position = UDim2.new(0, 130, 0, 45)
	pageVisual.BackgroundTransparency = 1
	pageVisual.Visible = false 
	pageVisual.CanvasSize = UDim2.new(0, 0, 2, 0)
	pageVisual.ScrollBarThickness = 3

	local pageScanner = Instance.new("ScrollingFrame", mainFrame)
	pageScanner.Size = UDim2.new(1, -130, 1, -45)
	pageScanner.Position = UDim2.new(0, 130, 0, 45)
	pageScanner.BackgroundTransparency = 1
	pageScanner.Visible = false
	pageScanner.CanvasSize = UDim2.new(0, 0, 2, 0)
	pageScanner.ScrollBarThickness = 3

	local pageMount = Instance.new("ScrollingFrame", mainFrame)
	pageMount.Size = UDim2.new(1, -130, 1, -45)
	pageMount.Position = UDim2.new(0, 130, 0, 45)
	pageMount.BackgroundTransparency = 1
	pageMount.Visible = false
	pageMount.CanvasSize = UDim2.new(0, 0, 2, 0)
	pageMount.ScrollBarThickness = 3

	local pageTroll = Instance.new("ScrollingFrame", mainFrame)
	pageTroll.Size = UDim2.new(1, -130, 1, -45)
	pageTroll.Position = UDim2.new(0, 130, 0, 45)
	pageTroll.BackgroundTransparency = 1
	pageTroll.Visible = false
	pageTroll.CanvasSize = UDim2.new(0, 0, 2, 0)
	pageTroll.ScrollBarThickness = 3

	local pagePerf = Instance.new("ScrollingFrame", mainFrame)
	pagePerf.Size = UDim2.new(1, -130, 1, -45)
	pagePerf.Position = UDim2.new(0, 130, 0, 45)
	pagePerf.BackgroundTransparency = 1
	pagePerf.Visible = false
	pagePerf.CanvasSize = UDim2.new(0, 0, 2, 0)
	pagePerf.ScrollBarThickness = 3

	-- ==========================================
	-- LOADING OVERLAY (EFEK KERTAS / KOTAK PEMBUAT LOADING DI TIAP TAB)
	-- ==========================================
	local loadingOverlay = Instance.new("Frame", mainFrame)
	loadingOverlay.Size = UDim2.new(1, -130, 1, -45)
	loadingOverlay.Position = UDim2.new(0, 130, 0, 45)
	loadingOverlay.BackgroundColor3 = Color3.fromRGB(8, 8, 11)
	loadingOverlay.BackgroundTransparency = 0.3
	loadingOverlay.BorderSizePixel = 0
	loadingOverlay.Visible = false
	loadingOverlay.ZIndex = 9999

	local loadingText = Instance.new("TextLabel", loadingOverlay)
	loadingText.Size = UDim2.new(1, 0, 1, 0)
	loadingText.BackgroundTransparency = 1
	loadingText.Text = "⏳ Memuat Fitur..."
	loadingText.TextColor3 = Color3.fromRGB(200, 200, 215)
	loadingText.Font = Enum.Font.GothamBold
	loadingText.TextSize = 12
	loadingText.ZIndex = 10000

	local function GantiTab(aktif, p1, p2, p3, p4, p5, p6, p7)
		p1.Visible = true p2.Visible = false p3.Visible = false p4.Visible = false p5.Visible = false p6.Visible = false p7.Visible = false
		btnTabVip.BackgroundColor3     = Color3.fromRGB(11, 11, 15) btnTabVip.TextColor3     = Color3.fromRGB(140, 140, 155)
		btnTabPlayer.BackgroundColor3  = Color3.fromRGB(11, 11, 15) btnTabPlayer.TextColor3  = Color3.fromRGB(140, 140, 155)
		btnTabVisual.BackgroundColor3  = Color3.fromRGB(11, 11, 15) btnTabVisual.TextColor3  = Color3.fromRGB(140, 140, 155)
		btnTabScanner.BackgroundColor3 = Color3.fromRGB(11, 11, 15) btnTabScanner.TextColor3 = Color3.fromRGB(140, 140, 155)
		btnTabMount.BackgroundColor3   = Color3.fromRGB(11, 11, 15) btnTabMount.TextColor3   = Color3.fromRGB(140, 140, 155)
		btnTabTroll.BackgroundColor3   = Color3.fromRGB(11, 11, 15) btnTabTroll.TextColor3   = Color3.fromRGB(140, 140, 155)
		btnTabPerf.BackgroundColor3    = Color3.fromRGB(11, 11, 15) btnTabPerf.TextColor3    = Color3.fromRGB(140, 140, 155)
		
		aktif.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
		aktif.TextColor3 = Color3.fromRGB(245, 245, 250)
	end

	-- FUNGSI MODULAR LOADER DENGAN LOADING OVERLAY & EFEK SMOOTH
	local function LoadTabContent(pageTarget, rawUrl, namaTab)
		GantiTab(
			-- Menyesuaikan tombol aktif berdasarkan halaman
			pageTarget == pageVip and btnTabVip or
			pageTarget == pagePlayer and btnTabPlayer or
			pageTarget == pageVisual and btnTabVisual or
			pageTarget == pageScanner and btnTabScanner or
			pageTarget == pageMount and btnTabMount or
			pageTarget == pageTroll and btnTabTroll or btnTabPerf,
			pageVip, pagePlayer, pageVisual, pageScanner, pageMount, pageTroll, pagePerf
		)

		if not pageTarget:FindFirstChild("IsLoaded") then
			-- Tampilkan overlay loading melayang di atas tab
			loadingOverlay.Visible = true
			loadingText.Text = "⏳ Menghubungkan ke server (" .. namaTab.
				.. ")..."

			task.spawn(function()
				local success, err = pcall(function()
					local code = game:HttpGet(rawUrl)
					loadingText.Text = "⚡ Memproses modul..."
					task.wait(0.1) -- Efek transisi smooth sebentar
					loadstring(code)(pageTarget, menuGui)

					local marker = Instance.new("Folder", pageTarget)
					marker.Name = "IsLoaded"
					marker.Parent = pageTarget
				end)

				if not success then
					warn("Gagal memuat " .. namaTab .. ": " .. tostring(err))
					TampilkanNotifikasiHijau("⚠️ Gagal memuat " .. namaTab)
				end

				-- Hilangkan overlay loading dengan transisi smooth fade out
				TweenService:Create(loadingOverlay, TweenInfo.new(0.2), {
					BackgroundTransparency = 1
				}):Play()
				TweenService:Create(loadingText, TweenInfo.new(0.2), {
					TextTransparency = 1
				}):Play()
				task.wait(0.2)
				loadingOverlay.Visible = false
				loadingOverlay.BackgroundTransparency = 0.3
				loadingText.TextTransparency = 0
			end)
		else
			-- Kalau sudah pernah di-load sebelumnya, langsung mulus tanpa loading lagi
			loadingOverlay.Visible = false
		end
	end

	-- ==========================================
	-- EVENT KLIK TAB (MENGGUNAKAN LOADER + OVERLAY)
	-- ==========================================
	btnTabVip.MouseButton1Click:Connect(function()     
		LoadTabContent(pageVip, "https://raw.githubusercontent.com/ahmadrio0703-web/script/refs/heads/main/vip.lua", "VIP")
	end)

	btnTabPlayer.MouseButton1Click:Connect(function()  
		LoadTabContent(pagePlayer, "https://github.com/ahmadrio0703-web/script/raw/refs/heads/main/player.lua", "Player")
	end)

	btnTabVisual.MouseButton1Click:Connect(function()  
		LoadTabContent(pageVisual, "https://github.com/ahmadrio0703-web/script/raw/refs/heads/main/visual.lua", "Visuals")
	end)

	btnTabScanner.MouseButton1Click:Connect(function() 
		LoadTabContent(pageScanner, "https://github.com/ahmadrio0703-web/script/raw/refs/heads/main/scanner.lua", "Scanner")
	end)

	btnTabMount.MouseButton1Click:Connect(function()   
		LoadTabContent(pageMount, "https://github.com/ahmadrio0703-web/script/raw/refs/heads/main/mount.lua", "Mount")
	end)

	btnTabTroll.MouseButton1Click:Connect(function()   
		LoadTabContent(pageTroll, "https://github.com/ahmadrio0703-web/script/raw/refs/heads/main/trol.lua", "Troll")
	end)

	btnTabPerf.MouseButton1Click:Connect(function()    
		LoadTabContent(pagePerf, "https://github.com/ahmadrio0703-web/script/raw/refs/heads/main/setting.lua", "Settings")
	end)

	btnMax.MouseButton1Click:Connect(function()
		isFullScreen = not isFullScreen
		TweenService:Create(mainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
			Size = isFullScreen and UDim2.new(1, 0, 1, 0) or UDim2.new(0, 480, 0, 270),
			Position = UDim2.new(0.5, 0, 0.5, 0)
		}):Play()
	end)

	btnTutup.MouseButton1Click:Connect(function() 
		-- Animasi tutup menu halus sebelum dihancurkan
		TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
			Size = UDim2.new(0, 0, 0, 0)
		}):Play()
		task.wait(0.25)
		menuGui:Destroy() 
	end)

	btnToggle.MouseButton1Click:Connect(function()
		menuTerbuka = not menuTerbuka
		local targetSize = menuTerbuka and (isFullScreen and UDim2.new(1, 0, 1, 0) or UDim2.new(0, 480, 0, 270)) or UDim2.new(0, 0, 0, 0)
		TweenService:Create(mainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = targetSize, Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
	end)

	TampilkanNotifikasiHijau("Dark Void Smooth & Modular Loaded!")
end

-- LOGIKA LOGIN (SMOOTH TRANSITION)
local function CekLogin()
	if inputPassBox.Text == passwordBenar then
		TampilkanNotifikasiHijau("Login Berhasil! Memuat Menu...")
		
		TweenService:Create(loginFrame, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
			Size = UDim2.new(0, 0, 0, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0)
		}):Play()
		
		task.wait(0.35)
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
