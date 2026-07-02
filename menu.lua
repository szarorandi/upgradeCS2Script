-- Tworzenie prostego, stabilnego interfejsu (Wersja Ultra-Light z pełnym ukrywaniem)
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local FrameCorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

local TitleBar = Instance.new("Frame")
local TitleCorner = Instance.new("UICorner")
local TitleLabel = Instance.new("TextLabel")

local CloseButton = Instance.new("TextButton")
local CloseCorner = Instance.new("UICorner")
local MinimizeButton = Instance.new("TextButton")
local MinimizeCorner = Instance.new("UICorner")

local ContentFrame = Instance.new("Frame")
local ToggleLabel = Instance.new("TextLabel")
local KeyBindButton = Instance.new("TextButton")
local ToggleButton = Instance.new("TextButton")
local ButtonCorner = Instance.new("UICorner")
local ToggleIndicator = Instance.new("Frame")
local IndicatorCorner = Instance.new("UICorner")

local CreditLabel = Instance.new("TextLabel")
local UserInputService = game:GetService("UserInputService")

-- Zmienne binda i stanu bota
local CurrentBind = Enum.KeyCode.H
local ListeningForBind = false
local _G = _G or {}
_G.AutoEarnActive = false

-- Kolory
local ZlotoZolty = Color3.fromRGB(255, 196, 0)
local BasicBialy = Color3.fromRGB(245, 245, 245)
local ButtonOff = Color3.fromRGB(45, 45, 48)

-- Baza GUI
ScreenGui.Name = "StableEarnGUI"
ScreenGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Okno główne
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 26)
MainFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 320, 0, 140)
MainFrame.Active = true
MainFrame.Draggable = true 
MainFrame.ClipsDescendants = true 

FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = MainFrame

UIStroke.Parent = MainFrame
UIStroke.Color = ZlotoZolty
UIStroke.Thickness = 2

-- Pasek tytułowy
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 33)
TitleBar.Size = UDim2.new(1, 0, 0, 34)

TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleBar

TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = TitleBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 12, 0, 0)
TitleLabel.Size = UDim2.new(1, -100, 1, 0)
TitleLabel.Font = Enum.Font.FredokaOne
TitleLabel.Text = "SKIN UPGRADER CS2 MENU"
TitleLabel.TextColor3 = ZlotoZolty
TitleLabel.TextSize = 13
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Przycisk Zamknij (X)
CloseButton.Name = "CloseButton"
CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = Color3.fromRGB(45, 20, 20)
CloseButton.Position = UDim2.new(1, -30, 0, 5)
CloseButton.Size = UDim2.new(0, 24, 0, 24)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseButton.TextSize = 12

CloseCorner.CornerRadius = UDim.new(0, 5)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

-- Przycisk Minimalizacji (-) -> TERAZ CAŁKOWICIE UKRYWA OKNO
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = TitleBar
MinimizeButton.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
MinimizeButton.Position = UDim2.new(1, -58, 0, 5)
MinimizeButton.Size = UDim2.new(0, 24, 0, 24)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "—"
MinimizeButton.TextColor3 = BasicBialy
MinimizeButton.TextSize = 11

MinimizeCorner.CornerRadius = UDim.new(0, 5)
MinimizeCorner.Parent = MinimizeButton

MinimizeButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = false -- Całkowite ukrycie okna po kliknięciu minusa
end)

-- Zawartość okna
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 0, 0, 34)
ContentFrame.Size = UDim2.new(1, 0, 1, -34)

-- Ramka na Logo
local LogoFrame = Instance.new("Frame")
LogoFrame.Parent = ContentFrame
LogoFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
LogoFrame.Position = UDim2.new(0, 12, 0, 12)
LogoFrame.Size = UDim2.new(0, 55, 0, 55)

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 8)
LogoCorner.Parent = LogoFrame

local LogoImage = Instance.new("ImageLabel")
LogoImage.Parent = LogoFrame
LogoImage.BackgroundTransparency = 1
LogoImage.Position = UDim2.new(0, 2, 0, 2)
LogoImage.Size = UDim2.new(1, -4, 1, -4)

local ImageCorner = Instance.new("UICorner")
ImageCorner.CornerRadius = UDim.new(0, 6)
ImageCorner.Parent = LogoImage
LogoImage.Image = "rbxthumb://type=Asset&id=81267336403105&w=150&h=150"

-- Nazwa opcji
ToggleLabel.Name = "ToggleLabel"
ToggleLabel.Parent = ContentFrame
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Position = UDim2.new(0, 80, 0, 15)
ToggleLabel.Size = UDim2.new(0, 160, 0, 25)
ToggleLabel.Font = Enum.Font.GothamBold
ToggleLabel.Text = "Auto Earn Money"
ToggleLabel.TextColor3 = BasicBialy
ToggleLabel.TextSize = 14
ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Przycisk binda
KeyBindButton.Name = "KeyBindButton"
KeyBindButton.Parent = ContentFrame
KeyBindButton.BackgroundTransparency = 1
KeyBindButton.Position = UDim2.new(0, 80, 0, 40)
KeyBindButton.Size = UDim2.new(0, 120, 0, 20)
KeyBindButton.Font = Enum.Font.GothamBold
KeyBindButton.Text = "[ Klawisz: H ]"
KeyBindButton.TextColor3 = ZlotoZolty
KeyBindButton.TextSize = 12
KeyBindButton.TextXAlignment = Enum.TextXAlignment.Left

-- Przełącznik suwaka
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ContentFrame
ToggleButton.BackgroundColor3 = ButtonOff
ToggleButton.Position = UDim2.new(0, 250, 0, 27)
ToggleButton.Size = UDim2.new(0, 54, 0, 24)
ToggleButton.Text = ""

ButtonCorner.CornerRadius = UDim.new(1, 0)
ButtonCorner.Parent = ToggleButton

ToggleIndicator.Name = "ToggleIndicator"
ToggleIndicator.Parent = ToggleButton
ToggleIndicator.BackgroundColor3 = Color3.fromRGB(180, 180, 185)
ToggleIndicator.Position = UDim2.new(0, 3, 0, 2)
ToggleIndicator.Size = UDim2.new(0, 20, 0, 20)

IndicatorCorner.CornerRadius = UDim.new(1, 0)
IndicatorCorner.Parent = ToggleIndicator

-- Podpis
CreditLabel.Name = "CreditLabel"
CreditLabel.Parent = ContentFrame
CreditLabel.BackgroundTransparency = 1
CreditLabel.Position = UDim2.new(0, 12, 1, -20)
CreditLabel.Size = UDim2.new(0, 200, 0, 15)
CreditLabel.Font = Enum.Font.FredokaOne
CreditLabel.Text = "made by: szarorandi/AI"
CreditLabel.TextColor3 = ZlotoZolty
CreditLabel.TextSize = 11
CreditLabel.TextXAlignment = Enum.TextXAlignment.Left

--- 🎯 PĘTLA AUTOCLICKERA ---
local function simpleClickLoop()
	while _G.AutoEarnActive do
		local PlayerGui = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")
		if PlayerGui then
			for _, v in pairs(PlayerGui:GetDescendants()) do
				if not _G.AutoEarnActive then break end
				if (v:IsA("TextButton") or v:IsA("ImageButton")) and not v:IsDescendantOf(MainFrame) then
					if v.Visible and v.AbsoluteSize.X > 5 and v.AbsolutePosition.Y > 50 then
						pcall(function()
							v:Activate()
						end)
					end
				end
			end
		end
		task.wait(0.01) 
	end
end

-- Funkcja przełączająca stan suwaka
local function toggleBotState()
	_G.AutoEarnActive = not _G.AutoEarnActive
	if _G.AutoEarnActive then
		ToggleIndicator.Position = UDim2.new(0, 31, 0, 2)
		ToggleButton.BackgroundColor3 = ZlotoZolty
		task.spawn(simpleClickLoop)
	else
		ToggleIndicator.Position = UDim2.new(0, 3, 0, 2)
		ToggleButton.BackgroundColor3 = ButtonOff
	end
end

-- Reakcja na przycisk binda
KeyBindButton.MouseButton1Click:Connect(function()
	ListeningForBind = true
	KeyBindButton.Text = "[ Kliknij klawisz... ]"
	KeyBindButton.TextColor3 = Color3.fromRGB(255, 100, 100)
end)

-- Reakcja na suwak
ToggleButton.MouseButton1Click:Connect(toggleBotState)

--- OBSŁUGA KLAWIATURY (POKAZYWANIE / UKRYWANIE) ---
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if ListeningForBind and input.UserInputType == Enum.UserInputType.Keyboard then
		CurrentBind = input.KeyCode
		ListeningForBind = false
		KeyBindButton.Text = "[ Klawisz: " .. input.KeyCode.Name .. " ]"
		KeyBindButton.TextColor3 = ZlotoZolty
		return
	end

	if not gameProcessed then
		-- LEWY CTRL: Całkowicie odkrywa lub ukrywa okienko
		if input.KeyCode == Enum.KeyCode.LeftControl then
			MainFrame.Visible = not MainFrame.Visible
		elseif input.KeyCode == CurrentBind then
			toggleBotState()
		end
	end
end)
