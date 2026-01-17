local UILibrary = {}

local UserInputService = game:GetService("UserInputService")

local dragging = false
local dragStartMousePosition
local dragStartFramePosition
local activeTween

local dragSpeed = 0.15

local TweenService = game:GetService("TweenService")

function UILibrary:CreateWindow(title, currentVersion)
	local UILib = Instance.new("ScreenGui")
	local UiFrame = Instance.new("Frame")
	local FrameCorner = Instance.new("UICorner")
	local Seperators = Instance.new("Folder")
	local Helper = Instance.new("Folder")
	local TopBarHelper = Instance.new("Frame")
	local SideBarHelper = Instance.new("Frame")
	local SectionTopHelper = Instance.new("Frame")
	local SectionLeftHelper = Instance.new("Frame")
	local SectionRightHelper = Instance.new("Frame")
	local SectionBottomHelper = Instance.new("Frame")
	local Lines = Instance.new("Folder")
	local TopBarLine = Instance.new("Frame")
	local SideBarLine = Instance.new("Frame")
	local Structure = Instance.new("Folder")
	local SideBar = Instance.new("Frame")
	local SideBarCorner = Instance.new("UICorner")
	local SideBarFix1 = Instance.new("Frame")
	local SideBarFix2 = Instance.new("Frame")
	local SideContentHolder = Instance.new("Frame")
	local SearchHelper = Instance.new("Frame")
	local SearchButton = Instance.new("ImageButton")
	local SideContentLayout = Instance.new("UIListLayout")
	local TopBar = Instance.new("Frame")
	local TopBarCorner = Instance.new("UICorner")
	local TopBarFix = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")
	local TextLabel_2 = Instance.new("TextLabel")

	--Properties:

	UILib.Name = title
	UILib.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	UILib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	UiFrame.Name = "UiFrame"
	UiFrame.Parent = UILib
	UiFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
	UiFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UiFrame.BorderSizePixel = 0
	UiFrame.Position = UDim2.new(0.160465121, 0, 0.162128717, 0)
	UiFrame.Size = UDim2.new(0, 750, 0, 500)

	FrameCorner.CornerRadius = UDim.new(0, 5)
	FrameCorner.Name = "FrameCorner"
	FrameCorner.Parent = UiFrame

	Seperators.Name = "Seperators"
	Seperators.Parent = UiFrame

	Helper.Name = "Helper"
	Helper.Parent = Seperators

	TopBarHelper.Name = "TopBarHelper"
	TopBarHelper.Parent = Helper
	TopBarHelper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TopBarHelper.BackgroundTransparency = 1.000
	TopBarHelper.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopBarHelper.BorderSizePixel = 0
	TopBarHelper.Size = UDim2.new(0, 750, 0, 42)

	SideBarHelper.Name = "SideBarHelper"
	SideBarHelper.Parent = Helper
	SideBarHelper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SideBarHelper.BackgroundTransparency = 1.000
	SideBarHelper.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SideBarHelper.BorderSizePixel = 0
	SideBarHelper.Position = UDim2.new(0, 0, 0.0839999989, 0)
	SideBarHelper.Size = UDim2.new(0, 200, 0, 458)

	SectionTopHelper.Name = "SectionTopHelper"
	SectionTopHelper.Parent = Helper
	SectionTopHelper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SectionTopHelper.BackgroundTransparency = 1.000
	SectionTopHelper.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SectionTopHelper.BorderSizePixel = 0
	SectionTopHelper.Position = UDim2.new(0.266666681, 0, 0.0839999989, 0)
	SectionTopHelper.Size = UDim2.new(0, 550, 0, 14)

	SectionLeftHelper.Name = "SectionLeftHelper"
	SectionLeftHelper.Parent = Helper
	SectionLeftHelper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SectionLeftHelper.BackgroundTransparency = 1.000
	SectionLeftHelper.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SectionLeftHelper.BorderSizePixel = 0
	SectionLeftHelper.Position = UDim2.new(0.266666681, 0, 0.0839999989, 0)
	SectionLeftHelper.Size = UDim2.new(0, 14, 0, 458)

	SectionRightHelper.Name = "SectionRightHelper"
	SectionRightHelper.Parent = Helper
	SectionRightHelper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SectionRightHelper.BackgroundTransparency = 1.000
	SectionRightHelper.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SectionRightHelper.BorderSizePixel = 0
	SectionRightHelper.Position = UDim2.new(0.981333315, 0, 0.0839999989, 0)
	SectionRightHelper.Size = UDim2.new(0, 14, 0, 458)

	SectionBottomHelper.Name = "SectionBottomHelper"
	SectionBottomHelper.Parent = Helper
	SectionBottomHelper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SectionBottomHelper.BackgroundTransparency = 1.000
	SectionBottomHelper.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SectionBottomHelper.BorderSizePixel = 0
	SectionBottomHelper.Position = UDim2.new(0.266666681, 0, 0.972000003, 0)
	SectionBottomHelper.Size = UDim2.new(0, 550, 0, 14)

	Lines.Name = "Lines"
	Lines.Parent = Seperators

	TopBarLine.Name = "TopBarLine"
	TopBarLine.Parent = Lines
	TopBarLine.BackgroundColor3 = Color3.fromRGB(24, 24, 31)
	TopBarLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopBarLine.BorderSizePixel = 0
	TopBarLine.Position = UDim2.new(0, 0, 0.0820000023, 0)
	TopBarLine.Size = UDim2.new(0, 750, 0, 1)

	SideBarLine.Name = "SideBarLine"
	SideBarLine.Parent = Lines
	SideBarLine.BackgroundColor3 = Color3.fromRGB(24, 24, 31)
	SideBarLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SideBarLine.BorderSizePixel = 0
	SideBarLine.Position = UDim2.new(0.265333325, 0, 0.0839999989, 0)
	SideBarLine.Size = UDim2.new(0, 1, 0, 458)

	Structure.Name = "Structure"
	Structure.Parent = UiFrame

	SideBar.Name = "SideBar"
	SideBar.Parent = Structure
	SideBar.BackgroundColor3 = Color3.fromRGB(17, 17, 24)
	SideBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SideBar.BorderSizePixel = 0
	SideBar.Position = UDim2.new(0, 0, 0.0839999989, 0)
	SideBar.Size = UDim2.new(0, 199, 0, 458)

	SideBarCorner.CornerRadius = UDim.new(0, 5)
	SideBarCorner.Name = "SideBarCorner"
	SideBarCorner.Parent = SideBar

	SideBarFix1.Name = "SideBarFix1"
	SideBarFix1.Parent = SideBar
	SideBarFix1.BackgroundColor3 = Color3.fromRGB(17, 17, 24)
	SideBarFix1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SideBarFix1.BorderSizePixel = 0
	SideBarFix1.Position = UDim2.new(0.497487426, 0, 0, 0)
	SideBarFix1.Size = UDim2.new(0, 100, 0, 458)

	SideBarFix2.Name = "SideBarFix2"
	SideBarFix2.Parent = SideBar
	SideBarFix2.BackgroundColor3 = Color3.fromRGB(17, 17, 24)
	SideBarFix2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SideBarFix2.BorderSizePixel = 0
	SideBarFix2.Size = UDim2.new(0, 199, 0, 65)

	SideContentHolder.Name = "SideContentHolder"
	SideContentHolder.Parent = SideBar
	SideContentHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SideContentHolder.BackgroundTransparency = 1.000
	SideContentHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SideContentHolder.BorderSizePixel = 0
	SideContentHolder.Position = UDim2.new(0.0753768831, 0, 0.015, 0)
	SideContentHolder.Size = UDim2.new(0, 169, 0, 388)
	SideContentHolder.AutomaticSize = Enum.AutomaticSize.Y

	SearchHelper.Name = "SearchHelper"
	SearchHelper.Parent = SideBar
	SearchHelper.BackgroundColor3 = Color3.fromRGB(35, 34, 48)
	SearchHelper.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SearchHelper.BorderSizePixel = 0
	SearchHelper.Position = UDim2.new(0.0753768831, 0, 0.882096052, 0)
	SearchHelper.Size = UDim2.new(0, 40, 0, 40)

	SearchButton.Name = "SearchButton"
	SearchButton.Parent = SearchHelper
	SearchButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchButton.BackgroundTransparency = 1.000
	SearchButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SearchButton.BorderSizePixel = 0
	SearchButton.Position = UDim2.new(0.187043384, 0, 0.186512753, 0)
	SearchButton.Size = UDim2.new(0, 25, 0, 25)
	SearchButton.Image = "rbxassetid://81317588132578"
	SearchButton.ImageColor3 = Color3.fromRGB(136, 168, 254)

	SideContentLayout.Parent = SideContentHolder
	SideContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
	SideContentLayout.Padding = UDim.new(0, 8)

	TopBar.Name = "TopBar"
	TopBar.Parent = Structure
	TopBar.BackgroundColor3 = Color3.fromRGB(17, 17, 24)
	TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopBar.BorderSizePixel = 0
	TopBar.Size = UDim2.new(0, 750, 0, 41)

	TopBarCorner.CornerRadius = UDim.new(0, 5)
	TopBarCorner.Name = "TopBarCorner"
	TopBarCorner.Parent = TopBar

	TopBarFix.Name = "TopBarFix"
	TopBarFix.Parent = TopBar
	TopBarFix.BackgroundColor3 = Color3.fromRGB(17, 17, 24)
	TopBarFix.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopBarFix.BorderSizePixel = 0
	TopBarFix.Position = UDim2.new(0, 0, 0.463414639, 0)
	TopBarFix.Size = UDim2.new(0, 750, 0, 22)

	TextLabel.Parent = TopBar
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.0199999996, 0, 0, 0)
	TextLabel.Size = UDim2.new(0, 185, 0, 41)
	TextLabel.Font = Enum.Font.SourceSans
	TextLabel.Text = title
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 18.000
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left

	TextLabel_2.Parent = TopBar
	TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.BackgroundTransparency = 1.000
	TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_2.BorderSizePixel = 0
	TextLabel_2.Position = UDim2.new(0.734666646, 0, 0.024390243, 0)
	TextLabel_2.Size = UDim2.new(0, 185, 0, 41)
	TextLabel_2.Font = Enum.Font.SourceSansSemibold
	TextLabel_2.Text = currentVersion
	TextLabel_2.TextColor3 = Color3.fromRGB(88, 87, 99)
	TextLabel_2.TextSize = 18.000
	TextLabel_2.TextXAlignment = Enum.TextXAlignment.Right

	local dragState = {
		isDragging = false,
		startMousePosition = nil,
		startFramePosition = nil,
		activeTween = nil
	}

	local DRAG_TWEEN_INFO = TweenInfo.new(
		0.15,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.Out
	)

	local function beginDrag(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end

		dragState.isDragging = true
		dragState.startMousePosition = input.Position
		dragState.startFramePosition = UiFrame.Position
	end

	local function endDrag(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end

		dragState.isDragging = false
	end

	local function updateDrag(input)
		if not dragState.isDragging then
			return
		end

		if input.UserInputType ~= Enum.UserInputType.MouseMovement then
			return
		end

		local mouseDelta = input.Position - dragState.startMousePosition

		local targetPosition = UDim2.new(
			dragState.startFramePosition.X.Scale,
			dragState.startFramePosition.X.Offset + mouseDelta.X,
			dragState.startFramePosition.Y.Scale,
			dragState.startFramePosition.Y.Offset + mouseDelta.Y
		)

		if dragState.activeTween then
			dragState.activeTween:Cancel()
		end

		dragState.activeTween = TweenService:Create(
			UiFrame,
			DRAG_TWEEN_INFO,
			{ Position = targetPosition }
		)

		dragState.activeTween:Play()
	end

	UiFrame.InputBegan:Connect(beginDrag)
	UiFrame.InputEnded:Connect(endDrag)
	UserInputService.InputChanged:Connect(updateDrag)
	
	local Category = {}

	function Category:CreateCategory(title)
		local CATEGORY_TOP_SPACING = 4
		local CATEGORY_BOTTOM_SPACING = 3
		local CATEGORY_LABEL_HEIGHT = 18

		local function createSpacer(name, height)
			local spacer = Instance.new("Frame")
			spacer.Name = name
			spacer.BackgroundTransparency = 1
			spacer.Size = UDim2.new(1, 0, 0, height)
			spacer.LayoutOrder = #SideContentHolder:GetChildren()
			spacer.Parent = SideContentHolder

			return spacer
		end

		local function createLabel(text)
			local label = Instance.new("TextLabel")
			label.Name = "CategoryLabel"
			label.BackgroundTransparency = 1
			label.Size = UDim2.new(1, 0, 0, CATEGORY_LABEL_HEIGHT)
			label.Font = Enum.Font.SourceSansBold
			label.Text = string.upper(text)
			label.TextSize = 18
			label.TextXAlignment = Enum.TextXAlignment.Left
			label.TextColor3 = Color3.fromRGB(131, 127, 142)
			label.LayoutOrder = #SideContentHolder:GetChildren()
			label.Parent = SideContentHolder

			return label
		end

		createSpacer("CategoryTopSpacer", CATEGORY_TOP_SPACING)
		createLabel(title)
		createSpacer("CategoryBottomSpacer", CATEGORY_BOTTOM_SPACING)

		local Tabs = {}

		function Tabs:CreateTab(title)
			------------ constants --------
			local TAB_HEIGHT = 18
			local INDICATOR_HEIGHT = 3
			local INDICATOR_WIDTH_ACTIVE = 15

			local COLOR_ACTIVE = Color3.fromRGB(255, 255, 255)
			local COLOR_INACTIVE = Color3.fromRGB(88, 87, 99)
			local COLOR_HOVER = Color3.fromRGB(120, 119, 131)
			local COLOR_INDICATOR = Color3.fromRGB(127, 146, 243)

			------------ tween presets --------
			local TWEEN_TEXT_SMOOTH = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
			local TWEEN_TEXT_QUICK = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local TWEEN_INDICATOR = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

			------------ sidebar button --------
			local TabButton = Instance.new("TextButton")
			TabButton.Name = "TabButton"
			TabButton.BackgroundTransparency = 1
			TabButton.Size = UDim2.new(1, 0, 0, TAB_HEIGHT)
			TabButton.Font = Enum.Font.SourceSans
			TabButton.Text = title
			TabButton.TextSize = 18
			TabButton.TextXAlignment = Enum.TextXAlignment.Left
			TabButton.TextColor3 = COLOR_INACTIVE
			TabButton.AutoButtonColor = false
			TabButton.LayoutOrder = #SideContentHolder:GetChildren()
			TabButton.Parent = SideContentHolder

			local TabIndicator = Instance.new("Frame")
			TabIndicator.Name = "TabIndicator"
			TabIndicator.BackgroundColor3 = COLOR_INDICATOR
			TabIndicator.BorderSizePixel = 0
			TabIndicator.Size = UDim2.new(0, 0, 0, INDICATOR_HEIGHT)
			TabIndicator.Position = UDim2.new(0, 0, 1, 4)
			TabIndicator.Visible = false
			TabIndicator.Parent = TabButton

			local BottomTabHelper = Instance.new("Frame")
			BottomTabHelper.Name = "BottomTabHelper"
			BottomTabHelper.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
			BottomTabHelper.BorderSizePixel = 0
			BottomTabHelper.Size = UDim2.new(1, 0, 0, 4)
			BottomTabHelper.LayoutOrder = #SideContentHolder:GetChildren()
			BottomTabHelper.Parent = SideContentHolder

			------------ content frame --------
			local TabFrame = Instance.new("ScrollingFrame")
			TabFrame.Name = "TabFrame"
			TabFrame.BackgroundTransparency = 1
			TabFrame.BorderSizePixel = 0
			TabFrame.Position = UDim2.new(0.285333335, 0, 0.0839999989, 0)
			TabFrame.Size = UDim2.new(0, 522, 0, 457)
			TabFrame.ScrollBarThickness = 0
			TabFrame.Visible = false
			TabFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
			TabFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
			TabFrame.Parent = Structure

			local TabLayout = Instance.new("UIListLayout")
			TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
			TabLayout.Parent = TabFrame

			local TabTopOffset = Instance.new("Frame")
			TabTopOffset.BackgroundTransparency = 1
			TabTopOffset.Size = UDim2.new(1, 0, 0, 14)
			TabTopOffset.LayoutOrder = 0
			TabTopOffset.Parent = TabFrame

			------------ state --------
			local isActive = false

			local function setIndicatorActive(active)
				if active then
					TabIndicator.Visible = true
					TweenService:Create(
						TabIndicator,
						TWEEN_INDICATOR,
						{ Size = UDim2.new(0, INDICATOR_WIDTH_ACTIVE, 0, INDICATOR_HEIGHT) }
					):Play()
				else
					local tween = TweenService:Create(
						TabIndicator,
						TWEEN_INDICATOR,
						{ Size = UDim2.new(0, 0, 0, INDICATOR_HEIGHT) }
					)
					tween:Play()
					tween.Completed:Connect(function()
						if not isActive then
							TabIndicator.Visible = false
						end
					end)
				end
			end

			local function setActive(active)
				isActive = active
				TabFrame.Visible = active

				TweenService:Create(
					TabButton,
					TWEEN_TEXT_SMOOTH,
					{ TextColor3 = active and COLOR_ACTIVE or COLOR_INACTIVE }
				):Play()

				setIndicatorActive(active)
			end

			------------ input --------
			TabButton.MouseEnter:Connect(function()
				if not isActive then
					TweenService:Create(
						TabButton,
						TWEEN_TEXT_QUICK,
						{ TextColor3 = COLOR_HOVER }
					):Play()
				end
			end)

			TabButton.MouseLeave:Connect(function()
				if not isActive then
					TweenService:Create(
						TabButton,
						TWEEN_TEXT_QUICK,
						{ TextColor3 = COLOR_INACTIVE }
					):Play()
				end
			end)

			TabButton.MouseButton1Click:Connect(function()
				for _, frame in ipairs(Structure:GetChildren()) do
					if frame:IsA("ScrollingFrame") then
						frame.Visible = false
					end
				end

				for _, button in ipairs(SideContentHolder:GetChildren()) do
					if button:IsA("TextButton") and button ~= TabButton then
						TweenService:Create(
							button,
							TWEEN_TEXT_SMOOTH,
							{ TextColor3 = COLOR_INACTIVE }
						):Play()

						local indicator = button:FindFirstChild("TabIndicator")
						if indicator then
							local tween = TweenService:Create(
								indicator,
								TWEEN_INDICATOR,
								{ Size = UDim2.new(0, 0, 0, INDICATOR_HEIGHT) }
							)
							tween:Play()
							tween.Completed:Connect(function()
								indicator.Visible = false
							end)
						end
					end
				end

				setActive(true)
			end)

			if not Structure:FindFirstChildWhichIsA("ScrollingFrame") then
				setActive(true)
			end

			------------ Sections API --------

			local Sections = {}

			function Sections:CreateSection(title)
				------------ constants --------
				local OUTLINE_PADDING = 10
				local CORNER_RADIUS = 6
				local TOP_OFFSET_HEIGHT = 10
				local LABEL_HEIGHT = 18
				local LABEL_TO_ITEM_OFFSET = 6
				local SECTION_VERTICAL_PADDING = 2

				local COLOR_OUTLINE = Color3.fromRGB(26, 26, 33)
				local COLOR_BACKGROUND = Color3.fromRGB(20, 20, 26)
				local COLOR_TEXT = Color3.fromRGB(255, 255, 255)
				
				------------ outline --------
				local SectionOutline = Instance.new("Frame")
				SectionOutline.Name = "SectionOutline"
				SectionOutline.Parent = TabFrame
				SectionOutline.BackgroundColor3 = Color3.fromRGB(26, 25, 32)
				SectionOutline.BorderColor3 = Color3.fromRGB(0, 0, 0)
				SectionOutline.BorderSizePixel = 0
				SectionOutline.Position = UDim2.new(0, 0, 0.0153172864, 0)
				SectionOutline.Size = UDim2.new(0, 522, 0, 224)
				
				------------ bottom spacer --------
				local BottomSpacer = Instance.new("Frame")
				BottomSpacer.Name = "CategoryTopSpacer"
				BottomSpacer.Parent = TabFrame
				BottomSpacer.BackgroundTransparency = 1
				BottomSpacer.Size = UDim2.new(1, 0, 0, 14)
				
				------------ holder --------
				local SectionHolder = Instance.new("Frame")
				SectionHolder.Name = "SectionHolder"
				SectionHolder.Parent = SectionOutline
				SectionHolder.BackgroundColor3 = Color3.fromRGB(17, 17, 24)
				SectionHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
				SectionHolder.BorderSizePixel = 0
				SectionHolder.Position = UDim2.new(0, 1, -0.00253977091, 2)
				SectionHolder.Size = UDim2.new(0, 520, 0, 222)
				
				local SectionHolderCorner = Instance.new("UICorner")
				SectionHolderCorner.CornerRadius = UDim.new(0, 2)
				SectionHolderCorner.Name = "SectionHolderCorner"
				SectionHolderCorner.Parent = SectionHolder
				
				------------ content --------
				local SectionContent = Instance.new("Frame")
				SectionContent.Name = "SectionContent"
				SectionContent.Parent = SectionHolder
				SectionContent.BackgroundTransparency = 1
				SectionContent.Size = UDim2.new(1, 0, 0, 0)
				SectionContent.AutomaticSize = Enum.AutomaticSize.Y
				
				local SectionUIListLayout = Instance.new("UIListLayout")
				SectionUIListLayout.Name = "SectionUIListLayout"
				SectionUIListLayout.Parent = SectionContent
				SectionUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				
				------------ updater --------
				local function updateSectionSize()
					local contentHeight = SectionUIListLayout.AbsoluteContentSize.Y

					SectionHolder.Size = UDim2.new(
						0,
						520,
						0,
						contentHeight + 22 -- Horrible code ik (forgot what that 22 offset does)
					)

					SectionOutline.Size = UDim2.new(
						0,
						522,
						0,
						contentHeight + 22 + SECTION_VERTICAL_PADDING
					)
				end

				SectionUIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateSectionSize)
				task.defer(updateSectionSize)
				
				------------ header --------
				local SectionTopOffset = Instance.new("Frame")
				SectionTopOffset.Name = "SectionTopOffset"
				SectionTopOffset.Parent = SectionContent
				SectionTopOffset.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SectionTopOffset.BackgroundTransparency = 1.000
				SectionTopOffset.BorderColor3 = Color3.fromRGB(0, 0, 0)
				SectionTopOffset.BorderSizePixel = 0
				SectionTopOffset.Size = UDim2.new(0, 520, 0, 17)

				local SectionLabelHelper = Instance.new("Frame")
				SectionLabelHelper.Name = "SectionLabelHelper"
				SectionLabelHelper.Parent = SectionContent
				SectionLabelHelper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SectionLabelHelper.BackgroundTransparency = 1.000
				SectionLabelHelper.BorderColor3 = Color3.fromRGB(0, 0, 0)
				SectionLabelHelper.BorderSizePixel = 0
				SectionLabelHelper.Position = UDim2.new(0, 0, 0.0765765756, 0)
				SectionLabelHelper.Size = UDim2.new(0, 14, 0, 18)

				local SectionLabel = Instance.new("TextLabel")
				SectionLabel.Name = "SectionLabel"
				SectionLabel.Parent = SectionLabelHelper
				SectionLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SectionLabel.BackgroundTransparency = 1.000
				SectionLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				SectionLabel.BorderSizePixel = 0
				SectionLabel.Position = UDim2.new(0.955496669, 0, -0.0186360683, 0)
				SectionLabel.Size = UDim2.new(0, 474, 0, 18)
				SectionLabel.Font = Enum.Font.SourceSansBold
				SectionLabel.Text = title
				SectionLabel.TextColor3 = Color3.fromRGB(131, 127, 142)
				SectionLabel.TextSize = 18.000
				SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
				SectionLabel.TextYAlignment = Enum.TextYAlignment.Top

				local SectionLabelToItemOffset = Instance.new("Frame")
				SectionLabelToItemOffset.Name = "SectionLabelToItemOffset"
				SectionLabelToItemOffset.Parent = SectionContent
				SectionLabelToItemOffset.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SectionLabelToItemOffset.BackgroundTransparency = 1.000
				SectionLabelToItemOffset.BorderColor3 = Color3.fromRGB(0, 0, 0)
				SectionLabelToItemOffset.BorderSizePixel = 0
				SectionLabelToItemOffset.Size = UDim2.new(0, 520, 0, 3)

				local Items = {}

				------------ No refactor here ------------
				function Items:CreateCheckbox(title, default, callback)
					local state = default and true or false

					local CheckboxDistanceTopHelper = Instance.new("Frame")
					local CheckboxHelper = Instance.new("Frame")
					local CheckboxLeftOffsetHelper = Instance.new("Frame")
					local CheckboxRightOffsetHelper = Instance.new("Frame")
					local CheckboxLabel = Instance.new("TextLabel")
					local CheckboxBox = Instance.new("Frame")
					local CheckboxBoxCorner = Instance.new("UICorner")
					local CheckboxCheckImage = Instance.new("ImageLabel")
					local CheckboxButton = Instance.new("TextButton")

					CheckboxDistanceTopHelper.Name = "CheckboxDistanceTopHelper"
					CheckboxDistanceTopHelper.Parent = SectionContent
					CheckboxDistanceTopHelper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					CheckboxDistanceTopHelper.BackgroundTransparency = 1.000
					CheckboxDistanceTopHelper.BorderColor3 = Color3.fromRGB(0, 0, 0)
					CheckboxDistanceTopHelper.BorderSizePixel = 0
					CheckboxDistanceTopHelper.Position = UDim2.new(0, 0, 0.27477476, 0)
					CheckboxDistanceTopHelper.Size = UDim2.new(0, 520, 0, 23)

					CheckboxHelper.Name = "CheckboxHelper"
					CheckboxHelper.Parent = SectionContent
					CheckboxHelper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					CheckboxHelper.BackgroundTransparency = 1.000
					CheckboxHelper.BorderColor3 = Color3.fromRGB(0, 0, 0)
					CheckboxHelper.BorderSizePixel = 0
					CheckboxHelper.Position = UDim2.new(0, 0, 0.27477476, 0)
					CheckboxHelper.Size = UDim2.new(0, 520, 0, 20)

					CheckboxLeftOffsetHelper.Name = "CheckboxLeftOffsetHelper"
					CheckboxLeftOffsetHelper.Parent = CheckboxHelper
					CheckboxLeftOffsetHelper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					CheckboxLeftOffsetHelper.BackgroundTransparency = 1.000
					CheckboxLeftOffsetHelper.BorderColor3 = Color3.fromRGB(0, 0, 0)
					CheckboxLeftOffsetHelper.BorderSizePixel = 0
					CheckboxLeftOffsetHelper.Size = UDim2.new(0, 13, 0, 20)

					CheckboxRightOffsetHelper.Name = "CheckboxRightOffsetHelper"
					CheckboxRightOffsetHelper.Parent = CheckboxHelper
					CheckboxRightOffsetHelper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					CheckboxRightOffsetHelper.BackgroundTransparency = 1.000
					CheckboxRightOffsetHelper.BorderColor3 = Color3.fromRGB(0, 0, 0)
					CheckboxRightOffsetHelper.BorderSizePixel = 0
					CheckboxRightOffsetHelper.Position = UDim2.new(0.975000024, 0, 0, 0)
					CheckboxRightOffsetHelper.Size = UDim2.new(0, 13, 0, 20)

					CheckboxLabel.Name = "CheckboxLabel"
					CheckboxLabel.Parent = CheckboxHelper
					CheckboxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					CheckboxLabel.BackgroundTransparency = 1.000
					CheckboxLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					CheckboxLabel.BorderSizePixel = 0
					CheckboxLabel.Position = UDim2.new(0.0257249102, 0, 0, 0)
					CheckboxLabel.Size = UDim2.new(0, 361, 0, 20)
					CheckboxLabel.Font = Enum.Font.SourceSans
					CheckboxLabel.Text = title
					CheckboxLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					CheckboxLabel.TextSize = 18.000
					CheckboxLabel.TextXAlignment = Enum.TextXAlignment.Left

					CheckboxBox.Name = "CheckboxBox"
					CheckboxBox.Parent = CheckboxHelper
					CheckboxBox.BackgroundColor3 = Color3.fromRGB(117, 148, 254)
					CheckboxBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
					CheckboxBox.BorderSizePixel = 0
					CheckboxBox.Position = UDim2.new(0.936538458, 0, 0, 0)
					CheckboxBox.Size = UDim2.new(0, 20, 0, 20)

					CheckboxBoxCorner.CornerRadius = UDim.new(0, 2)
					CheckboxBoxCorner.Name = "CheckboxBoxCorner"
					CheckboxBoxCorner.Parent = CheckboxBox

					CheckboxCheckImage.Name = "CheckboxCheckImage"
					CheckboxCheckImage.Parent = CheckboxBox
					CheckboxCheckImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					CheckboxCheckImage.BackgroundTransparency = 1.000
					CheckboxCheckImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
					CheckboxCheckImage.BorderSizePixel = 0
					CheckboxCheckImage.Size = UDim2.new(0, 20, 0, 20)
					CheckboxCheckImage.Image = "rbxassetid://79113160295465"
					CheckboxCheckImage.ImageColor3 = Color3.fromRGB(17, 17, 24)
					CheckboxCheckImage.ImageTransparency = 1.000 -- Start hidden

					CheckboxButton.Name = "CheckboxButton"
					CheckboxButton.Parent = CheckboxHelper
					CheckboxButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					CheckboxButton.BackgroundTransparency = 1.000
					CheckboxButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
					CheckboxButton.BorderSizePixel = 0
					CheckboxButton.Size = UDim2.new(1, 0, 1, 0)
					CheckboxButton.Font = Enum.Font.SourceSans
					CheckboxButton.Text = ""
					CheckboxButton.TextColor3 = Color3.fromRGB(0, 0, 0)
					CheckboxButton.TextSize = 14.000
					CheckboxButton.ZIndex = 5

					local tweenInfoSmooth = TweenInfo.new(
						0.25, 
						Enum.EasingStyle.Quad,
						Enum.EasingDirection.InOut
					)

					local tweenInfoBounce = TweenInfo.new(
						0.3,
						Enum.EasingStyle.Back,
						Enum.EasingDirection.Out,
						0,
						false,
						0
					)

					local tweenInfoQuick = TweenInfo.new(
						0.15,
						Enum.EasingStyle.Quad,
						Enum.EasingDirection.Out
					)

					-- Colors
					local activeCheckboxColor = Color3.fromRGB(117, 148, 254)
					local inactiveCheckboxColor = Color3.fromRGB(24, 25, 36)
					local hoverCheckboxColor = Color3.fromRGB(130, 160, 255) -- Lighter on hover
					local activeTextColor = Color3.fromRGB(255, 255, 255)
					local inactiveTextColor = Color3.fromRGB(88, 87, 99)

					local isHovering = false

					local function updateVisual(instant)
						local duration = instant and 0 or nil

						local colorTweenInfo = duration and TweenInfo.new(duration) or tweenInfoSmooth
						local checkTweenInfo = duration and TweenInfo.new(duration) or tweenInfoBounce

						local targetColor = state and activeCheckboxColor or inactiveCheckboxColor
						if isHovering and not state then
							targetColor = Color3.fromRGB(32, 33, 46)
						end

						local checkboxColorTween = TweenService:Create(
							CheckboxBox,
							colorTweenInfo,
							{ BackgroundColor3 = targetColor }
						)

						local checkboxLabelTween = TweenService:Create(
							CheckboxLabel,
							colorTweenInfo,
							{ TextColor3 = state and activeTextColor or inactiveTextColor }
						)

						local checkImageTween = TweenService:Create(
							CheckboxCheckImage,
							checkTweenInfo,
							{ 
								ImageTransparency = state and 0 or 1,
								Rotation = state and 0 or -90 
							}
						)

						local checkScaleTween = TweenService:Create(
							CheckboxCheckImage,
							checkTweenInfo,
							{ Size = state and UDim2.new(0, 20, 0, 20) or UDim2.new(0, 16, 0, 16) }
						)

						checkboxColorTween:Play()
						checkboxLabelTween:Play()
						checkImageTween:Play()
						checkScaleTween:Play()
					end

					-- Store original position
					local originalPosition = CheckboxBox.Position

					-- Hover effects
					CheckboxButton.MouseEnter:Connect(function()
						isHovering = true

						local hoverTween = TweenService:Create(
							CheckboxBox,
							tweenInfoQuick,
							{ 
								Size = UDim2.new(0, 22, 0, 22),
								Position = originalPosition - UDim2.new(0, 1, 0, 1)
							}
						)
						hoverTween:Play()

						-- Color change on hover
						if not state then
							local hoverCheckboxColorTween = TweenService:Create(
								CheckboxBox,
								tweenInfoQuick,
								{ BackgroundColor3 = Color3.fromRGB(32, 33, 46) }
							)

							local hoverCheckboxTextColorTween = TweenService:Create(
								CheckboxLabel,
								tweenInfoQuick,
								{ TextColor3 = Color3.fromRGB(95, 97, 109) }
							)

							hoverCheckboxColorTween:Play()
							hoverCheckboxTextColorTween:Play()
						end
					end)

					CheckboxButton.MouseLeave:Connect(function()
						isHovering = false

						-- Scale back to normal
						local hoverTween = TweenService:Create(
							CheckboxBox,
							tweenInfoQuick,
							{ 
								Size = UDim2.new(0, 20, 0, 20),
								Position = originalPosition
							}
						)
						hoverTween:Play()

						-- Reset color
						if not state then
							local hoverCheckboxColorTween = TweenService:Create(
								CheckboxBox,
								tweenInfoQuick,
								{ BackgroundColor3 = inactiveCheckboxColor }
							)

							local hoverCheckboxTextColorTween = TweenService:Create(
								CheckboxLabel,
								tweenInfoQuick,
								{ TextColor3 = inactiveTextColor }
							)

							hoverCheckboxColorTween:Play()
							hoverCheckboxTextColorTween:Play()
						end
					end)

					-- Click animation
					CheckboxButton.MouseButton1Down:Connect(function()
						local pressTween = TweenService:Create(
							CheckboxBox,
							TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ 
								Size = UDim2.new(0, 18, 0, 18),
								Position = originalPosition + UDim2.new(0, 1, 0, 1)
							}
						)
						pressTween:Play()
					end)

					CheckboxButton.MouseButton1Up:Connect(function()
						local releaseTween = TweenService:Create(
							CheckboxBox,
							TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ 
								Size = UDim2.new(0, 22, 0, 22),
								Position = originalPosition - UDim2.new(0, 1, 0, 1)
							}
						)
						releaseTween:Play()
					end)

					-- Initialize visual state
					updateVisual(true)

					CheckboxButton.MouseButton1Click:Connect(function()
						state = not state
						updateVisual(false)

						if callback then
							callback(state)
						end
					end)

					-- Control API
					local control = {}

					function control:Get()
						return state
					end

					function control:Set(value)
						state = value and true or false
						updateVisual(false)
					end

					function control:Destroy()
						CheckboxHelper:Destroy()
					end

					return control
				end

				function Items:CreateSlider(title, minimumValue, maximumValue, defaultValue, options, callback)
					-- Item: Slider
					local SliderDistanceTopHelper = Instance.new("Frame")
					local SliderHelper = Instance.new("Frame")
					local SliderTextHelper = Instance.new("Frame")
					local SliderLabel = Instance.new("TextLabel")
					local SliderValue = Instance.new("TextLabel")
					local SliderOffsetHelper = Instance.new("Frame")
					local SliderLength = Instance.new("Frame")
					local SliderFill = Instance.new("Frame")
					local SliderFillUIGradient = Instance.new("UIGradient")
					local SliderFillCorner = Instance.new("UICorner")
					local SliderLengthCorner = Instance.new("UICorner")
					local SliderKnob = Instance.new("Frame")
					local SliderKnobCorner = Instance.new("UICorner")
					local SliderValueButton = Instance.new("TextButton")

					SliderDistanceTopHelper.Name = "SliderDistanceTopHelper"
					SliderDistanceTopHelper.Parent = SectionContent
					SliderDistanceTopHelper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SliderDistanceTopHelper.BackgroundTransparency = 1.000
					SliderDistanceTopHelper.BorderColor3 = Color3.fromRGB(0, 0, 0)
					SliderDistanceTopHelper.BorderSizePixel = 0
					SliderDistanceTopHelper.Position = UDim2.new(0, 0, 0.27477476, 0)
					SliderDistanceTopHelper.Size = UDim2.new(0, 520, 0, 23)

					SliderHelper.Name = "SliderHelper"
					SliderHelper.Parent = SectionContent
					SliderHelper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SliderHelper.BackgroundTransparency = 1.000
					SliderHelper.BorderColor3 = Color3.fromRGB(0, 0, 0)
					SliderHelper.BorderSizePixel = 0
					SliderHelper.Position = UDim2.new(0, 0, 0.5990991, 0)
					SliderHelper.Size = UDim2.new(0, 520, 0, 34)

					SliderTextHelper.Name = "SliderTextHelper"
					SliderTextHelper.Parent = SliderHelper
					SliderTextHelper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SliderTextHelper.BackgroundTransparency = 1.000
					SliderTextHelper.BorderColor3 = Color3.fromRGB(0, 0, 0)
					SliderTextHelper.BorderSizePixel = 0
					SliderTextHelper.Position = UDim2.new(0.0257249102, 0, 0, 0)
					SliderTextHelper.Size = UDim2.new(0, 493, 0, 18)

					SliderLabel.Name = "SliderLabel"
					SliderLabel.Parent = SliderTextHelper
					SliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SliderLabel.BackgroundTransparency = 1.000
					SliderLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					SliderLabel.BorderSizePixel = 0
					SliderLabel.Size = UDim2.new(0, 314, 0, 18)
					SliderLabel.Font = Enum.Font.SourceSans
					SliderLabel.Text = "Slider"
					SliderLabel.TextColor3 = Color3.fromRGB(88, 87, 99)
					SliderLabel.TextSize = 18.000
					SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

					SliderValue.Name = "SliderValue"
					SliderValue.Parent = SliderTextHelper
					SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SliderValue.BackgroundTransparency = 1.000
					SliderValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
					SliderValue.BorderSizePixel = 0
					SliderValue.Position = UDim2.new(0.748478711, 0, 0, 0)
					SliderValue.Size = UDim2.new(0, 123, 0, 18)
					SliderValue.Font = Enum.Font.SourceSans
					SliderValue.Text = "1.0F"
					SliderValue.TextColor3 = Color3.fromRGB(88, 87, 99)
					SliderValue.TextSize = 18.000
					SliderValue.TextXAlignment = Enum.TextXAlignment.Right

					SliderOffsetHelper.Name = "SliderOffsetHelper"
					SliderOffsetHelper.Parent = SliderHelper
					SliderOffsetHelper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SliderOffsetHelper.BackgroundTransparency = 1.000
					SliderOffsetHelper.BorderColor3 = Color3.fromRGB(0, 0, 0)
					SliderOffsetHelper.BorderSizePixel = 0
					SliderOffsetHelper.Position = UDim2.new(0.0250000004, 0, 0.70588237, 0)
					SliderOffsetHelper.Size = UDim2.new(0, 492, 0, 10)

					SliderLength.Name = "SliderLength"
					SliderLength.Parent = SliderOffsetHelper
					SliderLength.BackgroundColor3 = Color3.fromRGB(24, 25, 34)
					SliderLength.BorderColor3 = Color3.fromRGB(0, 0, 0)
					SliderLength.BorderSizePixel = 0
					SliderLength.Position = UDim2.new(0, 0, 0.200000003, 0)
					SliderLength.Size = UDim2.new(0, 492, 0, 6)

					SliderFill.Name = "SliderFill"
					SliderFill.Parent = SliderLength
					SliderFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SliderFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
					SliderFill.BorderSizePixel = 0
					SliderFill.Size = UDim2.new(0, 246, 0, 6)

					SliderFillUIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(122, 144, 249)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(66, 79, 134))}
					SliderFillUIGradient.Name = "SliderFillUIGradient"
					SliderFillUIGradient.Parent = SliderFill

					SliderFillCorner.CornerRadius = UDim.new(0, 2)
					SliderFillCorner.Name = "SliderFillCorner"
					SliderFillCorner.Parent = SliderFill

					SliderLengthCorner.CornerRadius = UDim.new(0, 2)
					SliderLengthCorner.Name = "SliderLengthCorner"
					SliderLengthCorner.Parent = SliderLength

					SliderKnob.Name = "SliderKnob"
					SliderKnob.Parent = SliderLength
					SliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SliderKnob.BorderColor3 = Color3.fromRGB(0, 0, 0)
					SliderKnob.BorderSizePixel = 0
					SliderKnob.Position = UDim2.new(0.491869926, 0, -0.333333343, 0)
					SliderKnob.Size = UDim2.new(0, 10, 0, 10)

					SliderKnobCorner.CornerRadius = UDim.new(0, 99)
					SliderKnobCorner.Name = "SliderKnobCorner"
					SliderKnobCorner.Parent = SliderKnob

					SliderValueButton.Name = "SliderValueButton"
					SliderValueButton.Parent = SliderOffsetHelper
					SliderValueButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SliderValueButton.BackgroundTransparency = 1.000
					SliderValueButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
					SliderValueButton.BorderSizePixel = 0
					SliderValueButton.Size = UDim2.new(0, 492, 0, 10)
					SliderValueButton.Font = Enum.Font.SourceSans
					SliderValueButton.Text = ""
					SliderValueButton.TextColor3 = Color3.fromRGB(0, 0, 0)
					SliderValueButton.TextSize = 14.000

					options = options or {}

					local decimals = options.decimals or 0
					local suffix = options.suffix or ""

					local currentValue = math.clamp(defaultValue or minimumValue, minimumValue, maximumValue)
					local dragging = false
					local isHovering = false

					SliderLabel.Text = title

					local normalTextColor = Color3.fromRGB(88, 87, 99)
					local hoverTextColor = Color3.fromRGB(120, 122, 135)
					local activeTextColor = Color3.fromRGB(255, 255, 255)

					local tweenInfoQuick = TweenInfo.new(
						0.15,
						Enum.EasingStyle.Quad,
						Enum.EasingDirection.Out
					)

					------------ formatting --------

					local function formatValue(value)
						local factor = 10 ^ decimals
						local rounded = math.floor(value * factor + 0.5) / factor

						if decimals > 0 then
							return string.format("%." .. decimals .. "f%s", rounded, suffix)
						else
							return string.format("%d%s", rounded, suffix)
						end
					end

					------------ math helpers --------

					local function valueToAlpha(value)
						return (value - minimumValue) / (maximumValue - minimumValue)
					end

					local function alphaToValue(alpha)
						return minimumValue + (maximumValue - minimumValue) * alpha
					end

					------------ visuals --------

					local function updateTextVisual()
						local targetColor = isHovering and hoverTextColor or normalTextColor

						TweenService:Create(
							SliderLabel,
							tweenInfoQuick,
							{ TextColor3 = targetColor }
						):Play()

						TweenService:Create(
							SliderValue,
							tweenInfoQuick,
							{ TextColor3 = targetColor }
						):Play()
					end

					local function updateVisual(alpha, instant)
						alpha = math.clamp(alpha, 0, 1)

						local width = SliderLength.AbsoluteSize.X * alpha
						local knobX = width - SliderKnob.AbsoluteSize.X / 2

						local tweenInfo = instant and TweenInfo.new(0) or tweenInfoQuick

						TweenService:Create(
							SliderFill,
							tweenInfo,
							{ Size = UDim2.new(0, width, 0, 6) }
						):Play()

						TweenService:Create(
							SliderKnob,
							tweenInfo,
							{ Position = UDim2.new(0, knobX, -0.3333333, 0) }
						):Play()

						currentValue = alphaToValue(alpha)
						SliderValue.Text = formatValue(currentValue)

						if callback then
							callback(currentValue)
						end
					end

					task.defer(function()
						updateVisual(valueToAlpha(currentValue), true)
						updateTextVisual()
					end)

					------------ input --------

					local function inputToAlpha(input)
						local x = input.Position.X - SliderLength.AbsolutePosition.X
						return x / SliderLength.AbsoluteSize.X
					end

					SliderValueButton.MouseEnter:Connect(function()
						isHovering = true
						updateTextVisual()
					end)

					SliderValueButton.MouseLeave:Connect(function()
						isHovering = false
						updateTextVisual()
					end)

					SliderValueButton.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true

							TweenService:Create(
								SliderLabel,
								tweenInfoQuick,
								{ TextColor3 = activeTextColor }
							):Play()

							TweenService:Create(
								SliderValue,
								tweenInfoQuick,
								{ TextColor3 = activeTextColor }
							):Play()

							updateVisual(inputToAlpha(input), false)
						end
					end)

					SliderValueButton.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
							updateTextVisual()
						end
					end)

					game:GetService("UserInputService").InputChanged:Connect(function(input)
						if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
							updateVisual(inputToAlpha(input), false)
						end
					end)

					------------ control API --------

					local control = {}

					function control:Get()
						return currentValue
					end

					function control:Set(value)
						currentValue = math.clamp(value, minimumValue, maximumValue)
						updateVisual(valueToAlpha(currentValue), false)
					end

					function control:Destroy()
						SliderHelper:Destroy()
					end

					return control
				end

				function Items:CreateSeperator() 
					local ItemToSeperatorTopOffset = Instance.new("Frame")

					local SeperatorHelper = Instance.new("Frame")
					local SeperatorLine = Instance.new("Frame")

					local ItemToSeperatorBottomOffset = Instance.new("Frame")

					ItemToSeperatorTopOffset.Name = "ItemToSeperatorTopOffset"
					ItemToSeperatorTopOffset.Parent = SectionContent
					ItemToSeperatorTopOffset.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ItemToSeperatorTopOffset.BackgroundTransparency = 1.000
					ItemToSeperatorTopOffset.BorderColor3 = Color3.fromRGB(0, 0, 0)
					ItemToSeperatorTopOffset.BorderSizePixel = 0
					ItemToSeperatorTopOffset.Position = UDim2.new(0, 0, 0.364864856, 0)
					ItemToSeperatorTopOffset.Size = UDim2.new(0, 521, 0, 6)

					SeperatorHelper.Name = "SeperatorHelper"
					SeperatorHelper.Parent = SectionContent
					SeperatorHelper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SeperatorHelper.BackgroundTransparency = 1.000
					SeperatorHelper.BorderColor3 = Color3.fromRGB(0, 0, 0)
					SeperatorHelper.BorderSizePixel = 0
					SeperatorHelper.Position = UDim2.new(0, 0, 0.481981993, 0)
					SeperatorHelper.Size = UDim2.new(0, 520, 0, 1)

					SeperatorLine.Name = "SeperatorLine"
					SeperatorLine.Parent = SeperatorHelper
					SeperatorLine.BackgroundColor3 = Color3.fromRGB(26, 25, 32)
					SeperatorLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
					SeperatorLine.BorderSizePixel = 0
					SeperatorLine.Position = UDim2.new(0.0250000004, 0, -0.00999999978, 0)
					SeperatorLine.Size = UDim2.new(0, 494, 0, 1)

					ItemToSeperatorTopOffset.Name = "ItemToSeperatorTopOffset"
					ItemToSeperatorTopOffset.Parent = SectionContent
					ItemToSeperatorTopOffset.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ItemToSeperatorTopOffset.BackgroundTransparency = 1.000
					ItemToSeperatorTopOffset.BorderColor3 = Color3.fromRGB(0, 0, 0)
					ItemToSeperatorTopOffset.BorderSizePixel = 0
					ItemToSeperatorTopOffset.Position = UDim2.new(0, 0, 0.364864856, 0)
					ItemToSeperatorTopOffset.Size = UDim2.new(0, 521, 0, 26)
				end

				function Items:CreateColorPicker(title, defaultColor, callback)
					local ColorpickerDistanceTopHelper = Instance.new("Frame")
					local ColorpickerHelper = Instance.new("Frame")
					local ColorpickerOffsetHelper = Instance.new("Frame")
					local ColorpickerLabel = Instance.new("TextLabel")
					local ColorpickerBarHelper = Instance.new("Frame")
					local ColorpickerBarOutline = Instance.new("Frame")
					local ColorpickerBarOutlineGradiant = Instance.new("UIGradient")
					local ColorpickerBarOutlineDarkening = Instance.new("Frame")
					local ColorpickerBar = Instance.new("Frame")
					local ColorpickerBarGradiant = Instance.new("UIGradient")
					local ColorpickerBarCorner = Instance.new("UICorner")
					local ColorpickerBarOutlineDarkeningCorner = Instance.new("UICorner")
					local ColorpickerBarOutlineCorner = Instance.new("UICorner")
					local ColorpickerBarButton = Instance.new("TextButton")
					local ColorpickerKnob = Instance.new("Frame")
					local ColorpickerKnobCorner = Instance.new("UICorner")
					local SettingsButton = Instance.new("ImageButton")

					ColorpickerDistanceTopHelper.Name = "ColorpickerDistanceTopHelper"
					ColorpickerDistanceTopHelper.Parent = SectionContent
					ColorpickerDistanceTopHelper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ColorpickerDistanceTopHelper.BackgroundTransparency = 1.000
					ColorpickerDistanceTopHelper.BorderColor3 = Color3.fromRGB(0, 0, 0)
					ColorpickerDistanceTopHelper.BorderSizePixel = 0
					ColorpickerDistanceTopHelper.Position = UDim2.new(0, 0, 0.27477476, 0)
					ColorpickerDistanceTopHelper.Size = UDim2.new(0, 520, 0, 23)

					ColorpickerHelper.Name = "ColorpickerHelper"
					ColorpickerHelper.Parent = SectionContent
					ColorpickerHelper.BackgroundTransparency = 1
					ColorpickerHelper.BorderSizePixel = 0
					ColorpickerHelper.Size = UDim2.new(0, 520, 0, 33)

					ColorpickerOffsetHelper.Name = "ColorpickerOffsetHelper"
					ColorpickerOffsetHelper.Parent = ColorpickerHelper
					ColorpickerOffsetHelper.BackgroundTransparency = 1
					ColorpickerOffsetHelper.BorderSizePixel = 0
					ColorpickerOffsetHelper.Size = UDim2.new(0, 13, 0, 32)

					ColorpickerLabel.Name = "ColorpickerLabel"
					ColorpickerLabel.Parent = ColorpickerHelper
					ColorpickerLabel.BackgroundTransparency = 1
					ColorpickerLabel.BorderSizePixel = 0
					ColorpickerLabel.Position = UDim2.new(0.025, 0, 0, 0)
					ColorpickerLabel.Size = UDim2.new(0, 200, 0, 18)
					ColorpickerLabel.Font = Enum.Font.SourceSans
					ColorpickerLabel.Text = title
					ColorpickerLabel.TextColor3 = Color3.fromRGB(88, 87, 99)
					ColorpickerLabel.TextSize = 18
					ColorpickerLabel.TextXAlignment = Enum.TextXAlignment.Left

					ColorpickerBarHelper.Name = "ColorpickerBarHelper"
					ColorpickerBarHelper.Parent = ColorpickerHelper
					ColorpickerBarHelper.BackgroundTransparency = 1
					ColorpickerBarHelper.BorderSizePixel = 0
					ColorpickerBarHelper.Position = UDim2.new(0.025, 0, 0.6849, 0)
					ColorpickerBarHelper.Size = UDim2.new(0, 494, 0, 10)

					ColorpickerBarOutline.Name = "ColorpickerBarOutline"
					ColorpickerBarOutline.Parent = ColorpickerBarHelper
					ColorpickerBarOutline.BorderSizePixel = 0
					ColorpickerBarOutline.Position = UDim2.new(0, 0, 0.1, 0)
					ColorpickerBarOutline.Size = UDim2.new(0, 494, 0, 8)
					ColorpickerBarOutline.BackgroundColor3 = Color3.fromRGB(155, 155, 155)

					ColorpickerBarOutlineGradiant.Name = "ColorpickerBarOutlineGradiant"
					ColorpickerBarOutlineGradiant.Parent = ColorpickerBarOutline
					ColorpickerBarOutlineGradiant.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
						ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 102, 0)),
						ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 204, 0)),
						ColorSequenceKeypoint.new(0.30, Color3.fromRGB(153, 255, 0)),
						ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 0)),
						ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 153)),
						ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
						ColorSequenceKeypoint.new(0.70, Color3.fromRGB(0, 102, 255)),
						ColorSequenceKeypoint.new(0.80, Color3.fromRGB(51, 0, 255)),
						ColorSequenceKeypoint.new(0.90, Color3.fromRGB(204, 0, 255)),
						ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
					}

					ColorpickerBarOutlineDarkening.Name = "ColorpickerBarOutlineDarkening"
					ColorpickerBarOutlineDarkening.Parent = ColorpickerBarOutline
					ColorpickerBarOutlineDarkening.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					ColorpickerBarOutlineDarkening.BackgroundTransparency = 0.5
					ColorpickerBarOutlineDarkening.BorderSizePixel = 0
					ColorpickerBarOutlineDarkening.Size = UDim2.new(0, 494, 0, 8)

					ColorpickerBar.Name = "ColorpickerBar"
					ColorpickerBar.Parent = ColorpickerBarHelper
					ColorpickerBar.BorderSizePixel = 0
					ColorpickerBar.Position = UDim2.new(0, 1, 0.1, 0)
					ColorpickerBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ColorpickerBar.Size = UDim2.new(0, 492, 0, 6)
					ColorpickerBar.ZIndex = 4

					ColorpickerBarGradiant.Name = "ColorpickerBarGradiant"
					ColorpickerBarGradiant.Parent = ColorpickerBar
					ColorpickerBarGradiant.Color = ColorpickerBarOutlineGradiant.Color

					ColorpickerBarCorner.CornerRadius = UDim.new(0, 2)
					ColorpickerBarCorner.Parent = ColorpickerBar

					ColorpickerBarOutlineDarkeningCorner.CornerRadius = UDim.new(0, 3)
					ColorpickerBarOutlineDarkeningCorner.Parent = ColorpickerBarOutlineDarkening

					ColorpickerBarOutlineCorner.CornerRadius = UDim.new(0, 3)
					ColorpickerBarOutlineCorner.Parent = ColorpickerBarOutline

					ColorpickerBarButton.Name = "ColorpickerBarButton"
					ColorpickerBarButton.Parent = ColorpickerBarHelper
					ColorpickerBarButton.BackgroundTransparency = 1
					ColorpickerBarButton.BorderSizePixel = 0
					ColorpickerBarButton.Size = UDim2.new(0, 492, 0, 10)
					ColorpickerBarButton.Text = ""
					ColorpickerBarButton.AutoButtonColor = false
					ColorpickerBarButton.ZIndex = 5

					ColorpickerKnob.Name = "ColorpickerKnob"
					ColorpickerKnob.Parent = ColorpickerBarHelper
					ColorpickerKnob.BorderSizePixel = 0
					ColorpickerKnob.Size = UDim2.new(0, 10, 0, 10)
					ColorpickerKnob.ZIndex = 6

					ColorpickerKnobCorner.CornerRadius = UDim.new(0, 999)
					ColorpickerKnobCorner.Parent = ColorpickerKnob

					SettingsButton.Name = "SettingsButton"
					SettingsButton.Parent = ColorpickerHelper
					SettingsButton.BackgroundTransparency = 1
					SettingsButton.BorderSizePixel = 0
					SettingsButton.Position = UDim2.new(0.9423077, 0, 0.030303, 0)
					SettingsButton.Size = UDim2.new(0, 16, 0, 16)
					SettingsButton.Image = "rbxassetid://123987050709405"
					SettingsButton.ImageColor3 = Color3.fromRGB(88, 87, 99)

					local ColorpickerSettingsUiCorner = Instance.new("Frame")
					local ColorpickerSettingsUiCornerCorner = Instance.new("UICorner")
					local ColorpickerSettingsBackground = Instance.new("Frame")
					local PopupLayout = Instance.new("UIListLayout")
					local PopupPadding = Instance.new("UIPadding")

					ColorpickerSettingsUiCorner.Name = "ColorpickerSettingsUiCorner"
					ColorpickerSettingsUiCorner.Parent = UiFrame
					ColorpickerSettingsUiCorner.BackgroundColor3 = Color3.fromRGB(24, 24, 31)
					ColorpickerSettingsUiCorner.BorderSizePixel = 0
					ColorpickerSettingsUiCorner.Size = UDim2.new(0, 236, 0, 112)
					ColorpickerSettingsUiCorner.Visible = false
					ColorpickerSettingsUiCorner.ZIndex = 200

					ColorpickerSettingsUiCornerCorner.CornerRadius = UDim.new(0, 3)
					ColorpickerSettingsUiCornerCorner.Parent = ColorpickerSettingsUiCorner

					ColorpickerSettingsBackground.Name = "ColorpickerSettingsBackground"
					ColorpickerSettingsBackground.Parent = ColorpickerSettingsUiCorner
					ColorpickerSettingsBackground.BackgroundColor3 = Color3.fromRGB(17, 17, 24)
					ColorpickerSettingsBackground.BorderSizePixel = 0
					ColorpickerSettingsBackground.Position = UDim2.new(0, 1, 0, 1)
					ColorpickerSettingsBackground.Size = UDim2.new(1, -2, 1, -2)
					ColorpickerSettingsBackground.ZIndex = 201

					PopupPadding.Parent = ColorpickerSettingsBackground
					PopupPadding.PaddingLeft = UDim.new(0, 10)
					PopupPadding.PaddingRight = UDim.new(0, 10)
					PopupPadding.PaddingTop = UDim.new(0, 10)
					PopupPadding.PaddingBottom = UDim.new(0, 10)

					PopupLayout.Parent = ColorpickerSettingsBackground
					PopupLayout.SortOrder = Enum.SortOrder.LayoutOrder
					PopupLayout.Padding = UDim.new(0, 10)

					local isHoveringBar = false
					local isHoveringSettings = false
					local draggingHue = false
					local settingsOpen = false

					local normalTextColor = Color3.fromRGB(88, 87, 99)
					local hoverTextColor = Color3.fromRGB(120, 122, 135)
					local activeTextColor = Color3.fromRGB(255, 255, 255)

					local tweenInfoQuick = TweenInfo.new(
						0.15,
						Enum.EasingStyle.Quad,
						Enum.EasingDirection.Out
					)

					local function updateTextVisual()
						local targetColor

						if draggingHue then
							targetColor = activeTextColor
						elseif isHoveringBar or isHoveringSettings then
							targetColor = hoverTextColor
						else
							targetColor = normalTextColor
						end

						TweenService:Create(
							ColorpickerLabel,
							tweenInfoQuick,
							{ TextColor3 = targetColor }
						):Play()
					end

					local hue, saturation, value = Color3.toHSV(defaultColor or Color3.new(1, 0, 0))

					local function updateKnob()
						local barWidth = ColorpickerBar.AbsoluteSize.X
						local knobX = (hue * barWidth) - 5
						ColorpickerKnob.Position = UDim2.new(0, knobX, 0, 0)
					end

					local function updatePreview()
						local color = Color3.fromHSV(hue, saturation, value)

						ColorpickerKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

						if callback then
							callback(color)
						end
					end

					local function setHueFromInput(input)
						local x = math.clamp(
							input.Position.X - ColorpickerBar.AbsolutePosition.X,
							0,
							ColorpickerBar.AbsoluteSize.X
						)

						hue = x / ColorpickerBar.AbsoluteSize.X
						updateKnob()
						updatePreview()
					end

					local function createPopupSlider(parent, sliderTitle, defaultNumericValue, onChanged)
						local SliderHelper = Instance.new("Frame")
						local SliderTextHelper = Instance.new("Frame")
						local SliderLabel = Instance.new("TextLabel")
						local SliderValue = Instance.new("TextLabel")
						local SliderOffsetHelper = Instance.new("Frame")
						local SliderLength = Instance.new("Frame")
						local SliderFill = Instance.new("Frame")
						local SliderFillGradient = Instance.new("UIGradient")
						local SliderFillCorner = Instance.new("UICorner")
						local SliderLengthCorner = Instance.new("UICorner")
						local SliderKnob = Instance.new("Frame")
						local SliderKnobCorner = Instance.new("UICorner")
						local SliderValueButton = Instance.new("TextButton")

						SliderHelper.Parent = parent
						SliderHelper.BackgroundTransparency = 1
						SliderHelper.BorderSizePixel = 0
						SliderHelper.Size = UDim2.new(1, 0, 0, 34)
						SliderHelper.ZIndex = 205

						SliderTextHelper.Parent = SliderHelper
						SliderTextHelper.BackgroundTransparency = 1
						SliderTextHelper.BorderSizePixel = 0
						SliderTextHelper.Size = UDim2.new(1, 0, 0, 18)
						SliderTextHelper.ZIndex = 205

						SliderLabel.Parent = SliderTextHelper
						SliderLabel.BackgroundTransparency = 1
						SliderLabel.BorderSizePixel = 0
						SliderLabel.Size = UDim2.new(0.7, 0, 1, 0)
						SliderLabel.Font = Enum.Font.SourceSans
						SliderLabel.Text = sliderTitle
						SliderLabel.TextColor3 = Color3.fromRGB(88, 87, 99)
						SliderLabel.TextSize = 18
						SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
						SliderLabel.ZIndex = 205

						SliderValue.Parent = SliderTextHelper
						SliderValue.BackgroundTransparency = 1
						SliderValue.BorderSizePixel = 0
						SliderValue.Position = UDim2.new(0.7, 0, 0, 0)
						SliderValue.Size = UDim2.new(0.3, 0, 1, 0)
						SliderValue.Font = Enum.Font.SourceSans
						SliderValue.Text = "1.00"
						SliderValue.TextColor3 = Color3.fromRGB(88, 87, 99)
						SliderValue.TextSize = 18
						SliderValue.TextXAlignment = Enum.TextXAlignment.Right
						SliderValue.ZIndex = 205

						SliderOffsetHelper.Parent = SliderHelper
						SliderOffsetHelper.BackgroundTransparency = 1
						SliderOffsetHelper.BorderSizePixel = 0
						SliderOffsetHelper.Position = UDim2.new(0, 0, 0.70588237, 0)
						SliderOffsetHelper.Size = UDim2.new(1, 0, 0, 10)
						SliderOffsetHelper.ZIndex = 205

						SliderLength.Parent = SliderOffsetHelper
						SliderLength.BackgroundColor3 = Color3.fromRGB(24, 25, 34)
						SliderLength.BorderSizePixel = 0
						SliderLength.Position = UDim2.new(0, 0, 0.2, 0)
						SliderLength.Size = UDim2.new(1, 0, 0, 6)
						SliderLength.ZIndex = 205

						SliderFill.Parent = SliderLength
						SliderFill.BorderSizePixel = 0
						SliderFill.Size = UDim2.new(0, 0, 0, 6)
						SliderFill.ZIndex = 206

						SliderFillGradient.Parent = SliderFill
						SliderFillGradient.Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0, Color3.fromRGB(122, 144, 249)),
							ColorSequenceKeypoint.new(1, Color3.fromRGB(66, 79, 134))
						}

						SliderFillCorner.CornerRadius = UDim.new(0, 2)
						SliderFillCorner.Parent = SliderFill

						SliderLengthCorner.CornerRadius = UDim.new(0, 2)
						SliderLengthCorner.Parent = SliderLength

						SliderKnob.Parent = SliderLength
						SliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						SliderKnob.BorderSizePixel = 0
						SliderKnob.Position = UDim2.new(0, -5, -0.3333333, 0)
						SliderKnob.Size = UDim2.new(0, 10, 0, 10)
						SliderKnob.ZIndex = 207

						SliderKnobCorner.CornerRadius = UDim.new(0, 99)
						SliderKnobCorner.Parent = SliderKnob

						SliderValueButton.Parent = SliderOffsetHelper
						SliderValueButton.BackgroundTransparency = 1
						SliderValueButton.BorderSizePixel = 0
						SliderValueButton.Size = UDim2.new(1, 0, 1, 0)
						SliderValueButton.Text = ""
						SliderValueButton.AutoButtonColor = false
						SliderValueButton.ZIndex = 210

						local currentNumericValue = math.clamp(defaultNumericValue or 1, 0, 1)
						local dragging = false

						local function formatNumericValue(n)
							return string.format("%.2f", n)
						end

						local function setFromAlpha(alpha, fireCallback)
							local clampedAlpha = math.clamp(alpha, 0, 1)
							local width = SliderLength.AbsoluteSize.X * clampedAlpha
							local knobX = width - (SliderKnob.AbsoluteSize.X / 2)

							SliderFill.Size = UDim2.new(0, width, 0, 6)
							SliderKnob.Position = UDim2.new(0, knobX, -0.3333333, 0)

							currentNumericValue = clampedAlpha
							SliderValue.Text = formatNumericValue(currentNumericValue)

							if fireCallback then
								onChanged(currentNumericValue)
							end
						end

						local function inputToAlpha(input)
							local x = input.Position.X - SliderLength.AbsolutePosition.X
							return x / SliderLength.AbsoluteSize.X
						end

						SliderValueButton.InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								dragging = true
								setFromAlpha(inputToAlpha(input), true)
							end
						end)

						SliderValueButton.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								dragging = false
							end
						end)

						UserInputService.InputChanged:Connect(function(input)
							if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
								setFromAlpha(inputToAlpha(input), true)
							end
						end)

						task.defer(function()
							setFromAlpha(currentNumericValue, false)
						end)

						local api = {}

						function api:Get()
							return currentNumericValue
						end

						function api:Set(newValue)
							currentNumericValue = math.clamp(newValue or 0, 0, 1)
							setFromAlpha(currentNumericValue, false)
						end

						function api:Destroy()
							SliderHelper:Destroy()
						end

						return api
					end

					local function updatePopupPosition()
						local popupWidth = ColorpickerSettingsUiCorner.AbsoluteSize.X
						local popupHeight = ColorpickerSettingsUiCorner.AbsoluteSize.Y

						local uiFramePosition = UiFrame.AbsolutePosition
						local settingsPosition = SettingsButton.AbsolutePosition
						local settingsSize = SettingsButton.AbsoluteSize

						local desiredX = (settingsPosition.X - uiFramePosition.X) - popupWidth + settingsSize.X
						local desiredY = (settingsPosition.Y - uiFramePosition.Y) + settingsSize.Y + 8

						ColorpickerSettingsUiCorner.Position = UDim2.fromOffset(desiredX, desiredY)
					end

					local function setPopupVisible(visible)
						settingsOpen = visible
						ColorpickerSettingsUiCorner.Visible = visible

						if visible then
							updatePopupPosition()
						end
					end

					SettingsButton.MouseButton1Click:Connect(function()
						setPopupVisible(not settingsOpen)
					end)

					UserInputService.InputBegan:Connect(function(input, gameProcessed)
						if gameProcessed then
							return
						end

						if not settingsOpen then
							return
						end

						if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
							return
						end

						local mousePosition = UserInputService:GetMouseLocation()
						local popupPosition = ColorpickerSettingsUiCorner.AbsolutePosition
						local popupSize = ColorpickerSettingsUiCorner.AbsoluteSize

						local insidePopup =
							mousePosition.X >= popupPosition.X and
							mousePosition.X <= popupPosition.X + popupSize.X and
							mousePosition.Y >= popupPosition.Y and
							mousePosition.Y <= popupPosition.Y + popupSize.Y

						if insidePopup then
							return
						end

						local settingsAbs = SettingsButton.AbsolutePosition
						local settingsAbsSize = SettingsButton.AbsoluteSize

						local insideSettingsButton =
							mousePosition.X >= settingsAbs.X and
							mousePosition.X <= settingsAbs.X + settingsAbsSize.X and
							mousePosition.Y >= settingsAbs.Y and
							mousePosition.Y <= settingsAbs.Y + settingsAbsSize.Y

						if insideSettingsButton then
							return
						end

						setPopupVisible(false)
					end)

					UiFrame:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
						if settingsOpen then
							updatePopupPosition()
						end
					end)

					UiFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
						if settingsOpen then
							updatePopupPosition()
						end
					end)

					ColorpickerBarButton.MouseEnter:Connect(function()
						isHoveringBar = true
						updateTextVisual()
					end)

					ColorpickerBarButton.MouseLeave:Connect(function()
						isHoveringBar = false
						updateTextVisual()
					end)

					SettingsButton.MouseEnter:Connect(function()
						isHoveringSettings = true
						updateTextVisual()
					end)

					SettingsButton.MouseLeave:Connect(function()
						isHoveringSettings = false
						updateTextVisual()
					end)

					ColorpickerBarButton.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							draggingHue = true
							updateTextVisual()
							setHueFromInput(input)
						end
					end)

					ColorpickerBarButton.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							draggingHue = false
							updateTextVisual()
						end
					end)

					UserInputService.InputChanged:Connect(function(input)
						if draggingHue and input.UserInputType == Enum.UserInputType.MouseMovement then
							setHueFromInput(input)
						end
					end)

					local saturationSlider = createPopupSlider(
						ColorpickerSettingsBackground,
						"Saturation",
						saturation,
						function(v)
							saturation = v
							updatePreview()
						end
					)

					local brightnessSlider = createPopupSlider(
						ColorpickerSettingsBackground,
						"Brightness",
						value,
						function(v)
							value = v
							updatePreview()
						end
					)

					updateKnob()
					updatePreview()
					updateTextVisual()

					local control = {}

					function control:Get()
						return Color3.fromHSV(hue, saturation, value)
					end

					function control:Set(color)
						hue, saturation, value = Color3.toHSV(color)
						saturationSlider:Set(saturation)
						brightnessSlider:Set(value)
						updateKnob()
						updatePreview()
					end

					function control:Destroy()
						ColorpickerSettingsUiCorner:Destroy()
						ColorpickerHelper:Destroy()
					end

					return control
				end

				
				function Items:CreateDropdown(title, optionsList, defaultValue, callback)
					local DropdownDistanceTopHelper = Instance.new("Frame")
					local DropdownHelper = Instance.new("Frame")
					local DropdownLabel = Instance.new("TextLabel")

					local DropdownVisualButton = Instance.new("Frame")
					local DropdownVisualCorner = Instance.new("UICorner")
					local DropdownSelectedLabel = Instance.new("TextLabel")
					local DropdownArrowIcon = Instance.new("ImageLabel")

					local DropdownClickArea = Instance.new("TextButton")

					local DropdownOpenedBackgroundUI = Instance.new("Frame")
					local DropdownOpenedCorner = Instance.new("UICorner")
					local DropdownOptionsHolder = Instance.new("Frame")
					local DropdownOptionsLayout = Instance.new("UIListLayout")

					local UserInputService = game:GetService("UserInputService")
					local RunService = game:GetService("RunService")
					
					optionsList = optionsList or {}
					local selectedValue = defaultValue
					if selectedValue == nil then
						selectedValue = optionsList[1]
					end

					local overlayRoot = UILib:FindFirstChild("DropdownOverlay")
					if overlayRoot == nil then
						overlayRoot = Instance.new("Frame")
						overlayRoot.Name = "DropdownOverlay"
						overlayRoot.Parent = UILib
						overlayRoot.BackgroundTransparency = 1
						overlayRoot.Size = UDim2.new(1, 0, 1, 0)
						overlayRoot.Position = UDim2.new(0, 0, 0, 0)
						overlayRoot.ZIndex = 5000
					end

					DropdownDistanceTopHelper.Name = "DropdownDistanceTopHelper"
					DropdownDistanceTopHelper.Parent = SectionContent
					DropdownDistanceTopHelper.BackgroundTransparency = 1
					DropdownDistanceTopHelper.Size = UDim2.new(0, 520, 0, 23)

					DropdownHelper.Name = "DropdownHelper"
					DropdownHelper.Parent = SectionContent
					DropdownHelper.BackgroundTransparency = 1
					DropdownHelper.Size = UDim2.new(0, 520, 0, 30)

					DropdownLabel.Name = "DropdownLabel"
					DropdownLabel.Parent = DropdownHelper
					DropdownLabel.BackgroundTransparency = 1
					DropdownLabel.Position = UDim2.new(0.025, 0, 0, 0)
					DropdownLabel.Size = UDim2.new(0, 323, 0, 30)
					DropdownLabel.Font = Enum.Font.SourceSans
					DropdownLabel.Text = title
					DropdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					DropdownLabel.TextSize = 18
					DropdownLabel.TextXAlignment = Enum.TextXAlignment.Left

					DropdownVisualButton.Name = "DropdownVisualButton"
					DropdownVisualButton.Parent = DropdownHelper
					DropdownVisualButton.BackgroundColor3 = Color3.fromRGB(24, 25, 36)
					DropdownVisualButton.BorderSizePixel = 0
					DropdownVisualButton.Position = UDim2.new(0.753846169, 0, 0, 0)
					DropdownVisualButton.Size = UDim2.new(0, 115, 0, 30)
					DropdownVisualButton.ZIndex = 2

					DropdownVisualCorner.CornerRadius = UDim.new(0, 3)
					DropdownVisualCorner.Parent = DropdownVisualButton

					DropdownSelectedLabel.Name = "DropdownSelectedLabel"
					DropdownSelectedLabel.Parent = DropdownVisualButton
					DropdownSelectedLabel.BackgroundTransparency = 1
					DropdownSelectedLabel.Position = UDim2.new(0.0869565234, 0, 0, 0)
					DropdownSelectedLabel.Size = UDim2.new(0, 97, 0, 29)
					DropdownSelectedLabel.Font = Enum.Font.SourceSans
					DropdownSelectedLabel.Text = tostring(selectedValue or "")
					DropdownSelectedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					DropdownSelectedLabel.TextSize = 18
					DropdownSelectedLabel.TextXAlignment = Enum.TextXAlignment.Left
					DropdownSelectedLabel.ZIndex = 3

					DropdownArrowIcon.Name = "DropdownArrowIcon"
					DropdownArrowIcon.Parent = DropdownVisualButton
					DropdownArrowIcon.BackgroundTransparency = 1
					DropdownArrowIcon.Position = UDim2.new(0.826086938, 0, 0.333333343, 0)
					DropdownArrowIcon.Size = UDim2.new(0, 10, 0, 10)
					DropdownArrowIcon.Image = "rbxassetid://97833112080977"
					DropdownArrowIcon.ImageColor3 = Color3.fromRGB(176, 178, 189)
					DropdownArrowIcon.ZIndex = 3

					DropdownClickArea.Name = "DropdownClickArea"
					DropdownClickArea.Parent = DropdownHelper
					DropdownClickArea.BackgroundTransparency = 1
					DropdownClickArea.Size = UDim2.new(1, 0, 1, 0)
					DropdownClickArea.Text = ""
					DropdownClickArea.ZIndex = 10

					DropdownOpenedBackgroundUI.Name = "DropdownOpenedBackgroundUI"
					DropdownOpenedBackgroundUI.Parent = overlayRoot
					DropdownOpenedBackgroundUI.BackgroundColor3 = Color3.fromRGB(24, 25, 36)
					DropdownOpenedBackgroundUI.BorderSizePixel = 0
					DropdownOpenedBackgroundUI.Size = UDim2.new(0, 115, 0, 0)
					DropdownOpenedBackgroundUI.Visible = false
					DropdownOpenedBackgroundUI.ClipsDescendants = true
					DropdownOpenedBackgroundUI.ZIndex = 6000

					DropdownOpenedCorner.CornerRadius = UDim.new(0, 3)
					DropdownOpenedCorner.Parent = DropdownOpenedBackgroundUI

					DropdownOptionsHolder.Name = "DropdownOptionsHolder"
					DropdownOptionsHolder.Parent = DropdownOpenedBackgroundUI
					DropdownOptionsHolder.BackgroundTransparency = 1
					DropdownOptionsHolder.Position = UDim2.new(0, 0, 0, 0)
					DropdownOptionsHolder.Size = UDim2.new(1, 0, 1, 0)
					DropdownOptionsHolder.ZIndex = 6001

					DropdownOptionsLayout.Parent = DropdownOptionsHolder
					DropdownOptionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
					DropdownOptionsLayout.Padding = UDim.new(0, 0)

					local tweenInfoQuick = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
					local tweenInfoSmooth = TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

					local normalLabelColor = Color3.fromRGB(88, 87, 99)
					local hoverLabelColor = Color3.fromRGB(176, 178, 189)
					local labelDefaultColor = Color3.fromRGB(88, 87, 99)
					local labelHoverColor   = Color3.fromRGB(176, 178, 189)
					local labelOpenColor = Color3.fromRGB(255, 255, 255)

					local optionTextSelected = Color3.fromRGB(115, 114, 144)
					local optionTextNormal = Color3.fromRGB(176, 178, 189)

					local indicatorColor = Color3.fromRGB(30, 31, 44)

					local isOpen = false
					local isHovering = false
					local renderConnection = nil

					local function setOverlayPosition()
						local absolutePosition = DropdownVisualButton.AbsolutePosition
						local absoluteSize = DropdownVisualButton.AbsoluteSize

						local x = absolutePosition.X
						local y = absolutePosition.Y + absoluteSize.Y + 7

						DropdownOpenedBackgroundUI.Position = UDim2.new(0, x, 0, y)
					end

					local function setHoverVisual()
						if isOpen then
							TweenService:Create(DropdownLabel, tweenInfoQuick, {
								TextColor3 = labelOpenColor
							}):Play()

							TweenService:Create(DropdownArrowIcon, tweenInfoQuick, {
								ImageColor3 = labelOpenColor
							}):Play()
							return
						end

						local target = isHovering and labelHoverColor or labelDefaultColor

						TweenService:Create(DropdownLabel, tweenInfoQuick, {
							TextColor3 = target
						}):Play()

						TweenService:Create(DropdownArrowIcon, tweenInfoQuick, {
							ImageColor3 = target
						}):Play()
					end

					local optionButtonsByValue = {}
					local function rebuildOptions()
						for _, child in ipairs(DropdownOptionsHolder:GetChildren()) do
							if child:IsA("TextButton") or child:IsA("Frame") then
								if child ~= DropdownOptionsLayout then
									child:Destroy()
								end
							end
						end

						optionButtonsByValue = {}

						for index, optionValue in ipairs(optionsList) do
							local OptionButton = Instance.new("TextButton")
							local SelectedIndicator = Instance.new("Frame")
							local OptionLabel = Instance.new("TextLabel")

							OptionButton.Name = "OptionButton"
							OptionButton.Parent = DropdownOptionsHolder
							OptionButton.BackgroundTransparency = 1
							OptionButton.BorderSizePixel = 0
							OptionButton.Size = UDim2.new(0, 115, 0, 30)
							OptionButton.Text = ""
							OptionButton.AutoButtonColor = false
							OptionButton.ZIndex = 6002
							OptionButton.LayoutOrder = index

							SelectedIndicator.Name = "SelectedIndicator"
							SelectedIndicator.Parent = OptionButton
							SelectedIndicator.BackgroundColor3 = indicatorColor
							SelectedIndicator.BorderSizePixel = 0
							SelectedIndicator.Size = UDim2.new(0, 115, 0, 30)
							SelectedIndicator.ZIndex = 6002

							OptionLabel.Name = "OptionLabel"
							OptionLabel.Parent = OptionButton
							OptionLabel.BackgroundTransparency = 1
							OptionLabel.Position = UDim2.new(0.0695652142, 0, 0, 0)
							OptionLabel.Size = UDim2.new(0, 100, 0, 30)
							OptionLabel.Font = Enum.Font.SourceSans
							OptionLabel.Text = tostring(optionValue)
							OptionLabel.TextSize = 14
							OptionLabel.TextXAlignment = Enum.TextXAlignment.Left
							OptionLabel.ZIndex = 6003

							local isSelected = tostring(optionValue) == tostring(selectedValue)
							SelectedIndicator.BackgroundTransparency = isSelected and 0 or 1
							OptionLabel.TextColor3 = isSelected and optionTextSelected or optionTextNormal

							local function setOptionHoverState(isInside)
								local shouldHighlight = isInside
								if tostring(optionValue) == tostring(selectedValue) then
									shouldHighlight = true
								end

								local indicatorTransparency = shouldHighlight and 0 or 1
								local labelColor = shouldHighlight and optionTextSelected or optionTextNormal

								TweenService:Create(SelectedIndicator, tweenInfoQuick, { BackgroundTransparency = indicatorTransparency }):Play()
								TweenService:Create(OptionLabel, tweenInfoQuick, { TextColor3 = labelColor }):Play()
							end

							OptionButton.MouseEnter:Connect(function()
								setOptionHoverState(true)
							end)

							OptionButton.MouseLeave:Connect(function()
								setOptionHoverState(false)
							end)

							OptionButton.MouseButton1Down:Connect(function()
								TweenService:Create(SelectedIndicator, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0.15 }):Play()
							end)

							OptionButton.MouseButton1Up:Connect(function()
								setOptionHoverState(true)
							end)

							OptionButton.MouseButton1Click:Connect(function()
								local previousValue = selectedValue
								selectedValue = optionValue

								DropdownSelectedLabel.Text = tostring(selectedValue)

								for _, pair in pairs(optionButtonsByValue) do
									local indicator = pair.SelectedIndicator
									local label = pair.OptionLabel

									local nowSelected = tostring(pair.Value) == tostring(selectedValue)
									TweenService:Create(indicator, tweenInfoQuick, { BackgroundTransparency = nowSelected and 0 or 1 }):Play()
									TweenService:Create(label, tweenInfoQuick, { TextColor3 = nowSelected and optionTextSelected or optionTextNormal }):Play()
								end

								if callback then
									if tostring(previousValue) ~= tostring(selectedValue) then
										callback(selectedValue)
									end
								end

								isOpen = false
							end)

							optionButtonsByValue[tostring(optionValue)] = {
								Value = optionValue,
								SelectedIndicator = SelectedIndicator,
								OptionLabel = OptionLabel
							}
						end
					end

					local function getOpenHeight()
						local count = #optionsList
						if count < 1 then
							return 0
						end
						return count * 30
					end

					local function animateOpen()
						DropdownOpenedBackgroundUI.Visible = true
						setOverlayPosition()

						local height = getOpenHeight()

						TweenService:Create(
							DropdownOpenedBackgroundUI,
							tweenInfoSmooth,
							{ Size = UDim2.new(0, 115, 0, height) }
						):Play()

						TweenService:Create(
							DropdownArrowIcon,
							tweenInfoSmooth,
							{ Rotation = 180, ImageColor3 = labelOpenColor }
						):Play()

						TweenService:Create(
							DropdownLabel,
							tweenInfoQuick,
							{ TextColor3 = labelOpenColor }
						):Play()

						if renderConnection then
							renderConnection:Disconnect()
						end

						renderConnection = RunService.RenderStepped:Connect(function()
							if isOpen then
								setOverlayPosition()
							end
						end)
					end

					local function animateClose()
						TweenService:Create(
							DropdownOpenedBackgroundUI,
							tweenInfoSmooth,
							{ Size = UDim2.new(0, 115, 0, 0) }
						):Play()

						TweenService:Create(
							DropdownArrowIcon,
							tweenInfoSmooth,
							{ Rotation = 0 }
						):Play()

						setHoverVisual()

						task.delay(0.23, function()
							if isOpen then return end

							DropdownOpenedBackgroundUI.Visible = false

							if renderConnection then
								renderConnection:Disconnect()
								renderConnection = nil
							end
						end)
					end

					local function setOpenState(nextOpen)
						isOpen = nextOpen

						if isOpen then
							rebuildOptions()
							animateOpen()
							return
						end

						animateClose()
					end

					local function closeIfClickedOutside(input)
						if isOpen == false then
							return
						end

						local inputType = input.UserInputType
						if inputType ~= Enum.UserInputType.MouseButton1 then
							return
						end

						local mousePosition = UserInputService:GetMouseLocation()
						local x = mousePosition.X
						local y = mousePosition.Y

						local listPosition = DropdownOpenedBackgroundUI.AbsolutePosition
						local listSize = DropdownOpenedBackgroundUI.AbsoluteSize
						local listInside = x >= listPosition.X and x <= (listPosition.X + listSize.X) and y >= listPosition.Y and y <= (listPosition.Y + listSize.Y)

						local buttonPosition = DropdownVisualButton.AbsolutePosition
						local buttonSize = DropdownVisualButton.AbsoluteSize
						local buttonInside = x >= buttonPosition.X and x <= (buttonPosition.X + buttonSize.X) and y >= buttonPosition.Y and y <= (buttonPosition.Y + buttonSize.Y)

						if listInside then
							return
						end

						if buttonInside then
							return
						end

						setOpenState(false)
					end

					DropdownClickArea.MouseEnter:Connect(function()
						isHovering = true
						setHoverVisual()
					end)

					DropdownClickArea.MouseLeave:Connect(function()
						isHovering = false
						setHoverVisual()
					end)

					DropdownClickArea.MouseButton1Down:Connect(function()
						TweenService:Create(DropdownVisualButton, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(30, 31, 44) }):Play()
					end)

					DropdownClickArea.MouseButton1Up:Connect(function()
						TweenService:Create(DropdownVisualButton, tweenInfoQuick, { BackgroundColor3 = Color3.fromRGB(24, 25, 36) }):Play()
					end)

					DropdownClickArea.MouseButton1Click:Connect(function()
						setOpenState(not isOpen)
					end)

					UserInputService.InputBegan:Connect(function(input, gameProcessed)
						if gameProcessed then
							return
						end
						closeIfClickedOutside(input)
					end)

					setHoverVisual()
					setOpenState(false)

					local control = {}

					function control:Get()
						return selectedValue
					end

					function control:Set(value)
						selectedValue = value
						DropdownSelectedLabel.Text = tostring(selectedValue)

						for _, pair in pairs(optionButtonsByValue) do
							local nowSelected = tostring(pair.Value) == tostring(selectedValue)
							pair.SelectedIndicator.BackgroundTransparency = nowSelected and 0 or 1
							pair.OptionLabel.TextColor3 = nowSelected and optionTextSelected or optionTextNormal
						end
					end

					function control:Open()
						setOpenState(true)
					end

					function control:Close()
						setOpenState(false)
					end

					function control:Destroy()
						setOpenState(false)
						if renderConnection then
							renderConnection:Disconnect()
							renderConnection = nil
						end
						DropdownOpenedBackgroundUI:Destroy()
						DropdownHelper:Destroy()
						DropdownDistanceTopHelper:Destroy()
					end

					return control
				end

				return Items
			end

			return Sections
		end

		return Tabs
	end

	return Category
end

return UILibrary
