--5cbbc6fcc7aa6df8be542f418c2200f1
repeat wait() until game:IsLoaded()
repeat wait() until game.Players
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.CoreGui:FindFirstChild('RobloxPromptGui')

local ui =  game:GetService("CoreGui"):FindFirstChild("redui")  
if ui then 
    game.Players.LocalPlayer:Kick("find gui")
end

OldWorld = false
NewWorld = false
ThreeWorld = false
local placeId = game.PlaceId
if placeId == 2753915549 then
    OldWorld = true
elseif placeId == 4442272183 then
    NewWorld = true
elseif placeId == 7449423635 then
	ThreeWorld = true
end

local UserInputService = game:GetService("UserInputService");
local TweenService = game:GetService("TweenService");
local RunService = game:GetService("RunService");
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local tween = game:GetService("TweenService");
local Red = {RainbowColorValue = 0, HueSelectionPosition = 0}
local PresetColor = Color3.fromRGB(255, 255, 255);


coroutine.wrap(
function()
    while wait() do
        Red.RainbowColorValue = Red.RainbowColorValue + 1 / 255
        Red.HueSelectionPosition = Red.HueSelectionPosition + 1

        if Red.RainbowColorValue >= 1 then
            Red.RainbowColorValue = 0
        end

        if Red.HueSelectionPosition == 160 then
            Red.HueSelectionPosition = 0
        end
    end
end
)()

local Reduisceen = Instance.new("ScreenGui")
Reduisceen.Parent = game:GetService("CoreGui")
Reduisceen.Name = "redui"
Reduisceen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling




local function MakeDraggable(topbarobject, object)
local Dragging = nil
local DragInput = nil
local DragStart = nil
local StartPosition = nil

local function Update(input)
    local Delta = input.Position - DragStart
    local pos =
        UDim2.new(
        StartPosition.X.Scale,
        StartPosition.X.Offset + Delta.X,
        StartPosition.Y.Scale,
        StartPosition.Y.Offset + Delta.Y
    )
    local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
    Tween:Play()
end

topbarobject.InputBegan:Connect(
    function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStart = input.Position
            StartPosition = object.Position

            input.Changed:Connect(
                function()
                    if input.UserInputState == Enum.UserInputState.End then
                        Dragging = false
                    end
                end
            )
        end
    end
)

topbarobject.InputChanged:Connect(
    function(input)
        if
            input.UserInputType == Enum.UserInputType.MouseMovement or
                input.UserInputType == Enum.UserInputType.Touch
        then
            DragInput = input
        end
    end
)

UserInputService.InputChanged:Connect(
    function(input)
        if input == DragInput and Dragging then
            Update(input)
        end
    end
)
end

local function Tween(instance, properties,style,wa)
if style == nil or "" then
    return Back
end
tween:Create(instance,TweenInfo.new(wa,Enum.EasingStyle[style]),{properties}):Play()
end

local create = {}
function create:Win(text)
local fs = false

local MainSceen = Instance.new("Frame")
MainSceen.Name = "MainSceen"
MainSceen.Parent = Reduisceen
MainSceen.AnchorPoint = Vector2.new(0.5, 0.5)
MainSceen.BackgroundColor3 = Color3.fromRGB(15,15,15)
MainSceen.BorderSizePixel = 0
MainSceen.Position = UDim2.new(0.5, 0, 0.5, 0)
MainSceen.Size = UDim2.new(0, 0, 0, 0)
MainSceen.ClipsDescendants = true

local Main_UiConner  = Instance.new("UICorner")

Main_UiConner.CornerRadius = UDim.new(0, 4)
Main_UiConner.Name = "Main_UiConner"
Main_UiConner.Parent = MainSceen

local ClickFrame = Instance.new("Frame")
ClickFrame.Name = "ClickFrame"
ClickFrame.Parent = MainSceen
ClickFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ClickFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
ClickFrame.BorderSizePixel = 0
ClickFrame.Position = UDim2.new(0.5, 0, 0.036, 0)
ClickFrame.Size = UDim2.new(0, 534-20, 0, 30)
ClickFrame.ClipsDescendants = true
ClickFrame.BackgroundTransparency = 0.5

MakeDraggable(ClickFrame,MainSceen)
tween:Create(MainSceen,TweenInfo.new(0.4,Enum.EasingStyle.Back),{Size = UDim2.new(0, 550, 0, 474)}):Play()

local library = {toggledui = false;}
game:GetService("UserInputService").InputBegan:Connect(function(input)
    pcall(function()
        if input.KeyCode == Enum.KeyCode.RightControl then
            if library.toggledui == false then
                library.toggledui = true
                tween:Create(MainSceen,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size = UDim2.new(0, 0, 0, 0)}):Play()
                wait(.1)
                Reduisceen.Enabled = false
            else
                library.toggledui = false
                tween:Create(MainSceen,TweenInfo.new(0.4,Enum.EasingStyle.Back),{Size = UDim2.new(0, 534, 0, 474)}):Play()
                Reduisceen.Enabled = true
            end
        end
    end)
end)

local NameReal = Instance.new("TextLabel")

NameReal.Parent = MainSceen
NameReal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NameReal.BackgroundTransparency = 1
NameReal.BorderSizePixel = 0
NameReal.Position = UDim2.new(0.5, 0, 0.05, 0)
NameReal.AnchorPoint = Vector2.new(0.5, 0.5)
NameReal.Size = UDim2.new(0, 136, 0, 34)
NameReal.Font = Enum.Font.GothamBold
NameReal.Text = tostring(text)
NameReal.TextColor3 = Color3.fromRGB(255, 255, 255)
NameReal.TextSize = 15.000


local MainSceen2 = Instance.new("Frame")
MainSceen2.Name = "MainSceen2"
MainSceen2.Parent = MainSceen
MainSceen2.AnchorPoint = Vector2.new(0.5, 0.5)
MainSceen2.BackgroundColor3 = Color3.fromRGB(18,18,18)
MainSceen2.BorderSizePixel = 0
MainSceen2.Position = UDim2.new(0.5, 0, 0.5, 0)
MainSceen2.Size = UDim2.new(0, 0, 0, 0)
MainSceen2.ClipsDescendants = true

local Main_UiConner2  = Instance.new("UICorner")

Main_UiConner2.CornerRadius = UDim.new(0, 4)
Main_UiConner2.Name = "Main_UiConner"
Main_UiConner2.Parent = MainSceen

MainSceen2:TweenSizeAndPosition(UDim2.new(0, 550-20, 0, 474-50), UDim2.new(0.5, 0, 0.53, 0), "Out", "Back", 0.5, true)


local ScolTapBarFrame = Instance.new("Frame")
ScolTapBarFrame.Name = "MainSceen2"
ScolTapBarFrame.Parent = MainSceen2
ScolTapBarFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ScolTapBarFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
ScolTapBarFrame.BorderSizePixel = 0
ScolTapBarFrame.BackgroundTransparency = 1
ScolTapBarFrame.Position = UDim2.new(0.5, 0, 0.07, 0)
ScolTapBarFrame.Size = UDim2.new(0, 500, 0, 35)
ScolTapBarFrame.ClipsDescendants = true

local ScrollingFrame_Menubar = Instance.new("ScrollingFrame")

ScrollingFrame_Menubar.Parent = ScolTapBarFrame
ScrollingFrame_Menubar.Active = true
ScrollingFrame_Menubar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame_Menubar.BackgroundTransparency = 1
ScrollingFrame_Menubar.BorderSizePixel = 0
ScrollingFrame_Menubar.Size = UDim2.new(0, 500, 0, 35)
ScrollingFrame_Menubar.CanvasSize = UDim2.new(2, 0, 0, 0)
ScrollingFrame_Menubar.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame_Menubar.ScrollBarThickness = 3


local UIListLayout_Menubar = Instance.new("UIListLayout")

UIListLayout_Menubar.Parent = ScrollingFrame_Menubar
UIListLayout_Menubar.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_Menubar.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_Menubar.Padding = UDim.new(0, 10)

local UIPadding_Menubar = Instance.new("UIPadding")

UIPadding_Menubar.Parent = ScrollingFrame_Menubar
UIPadding_Menubar.PaddingTop = UDim.new(0, 2)


local PageOrders = -1

local Container_Page = Instance.new('Frame',MainSceen2)
Container_Page.Size = UDim2.new(0, 518, 0, 268)
Container_Page.Position = UDim2.new(0.5, 0, 0.45, 0)
Container_Page.BackgroundTransparency = 1
Container_Page.Name = "Page "
Container_Page.AnchorPoint = Vector2.new(0.5, 0.5)

local pagesFolder = Instance.new("Folder")

pagesFolder.Name = "pagesFolder"
pagesFolder.Parent = Container_Page


local UIPage = Instance.new('UIPageLayout',pagesFolder)
UIPage.SortOrder = Enum.SortOrder.LayoutOrder
UIPage.EasingDirection = Enum.EasingDirection.InOut
UIPage.EasingStyle = Enum.EasingStyle.Quad
UIPage.Padding = UDim.new(0, 10)
UIPage.TweenTime = 0.500

local top = {}

local NotiFrame = Instance.new("Frame")
NotiFrame.Name = "NotiFrame"
NotiFrame.Parent = Reduisceen
NotiFrame.AnchorPoint = Vector2.new(0.5, 0.5)
NotiFrame.BackgroundColor3 = Color3.fromRGB(18,18,18)
NotiFrame.BorderSizePixel = 0
NotiFrame.Position =  UDim2.new(1, -210, 1, -500)
NotiFrame.Size = UDim2.new(0, 400, 0, 500)
NotiFrame.ClipsDescendants = true
NotiFrame.BackgroundTransparency = 1


local Notilistlayout = Instance.new("UIListLayout")
Notilistlayout.Parent = NotiFrame
Notilistlayout.SortOrder = Enum.SortOrder.LayoutOrder
Notilistlayout.Padding = UDim.new(0, 5)


function create:Notifile(titel,text,delays)
    local TitleFrame = Instance.new("Frame")
    TitleFrame.Name = "TitleFrame"
    TitleFrame.Parent = NotiFrame
    TitleFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    TitleFrame.BackgroundColor3 = Color3.fromRGB(18,18,18)
    TitleFrame.BorderSizePixel = 0
    TitleFrame.Position =  UDim2.new(0.5, 0, 0.5,0)
    TitleFrame.Size = UDim2.new(0, 0, 0, 0)
    TitleFrame.ClipsDescendants = true
    TitleFrame.BackgroundTransparency = 0

    local ConnerTitile = Instance.new("UICorner")

    ConnerTitile.CornerRadius = UDim.new(0, 4)
    ConnerTitile.Name = ""
    ConnerTitile.Parent = TitleFrame

    TitleFrame:TweenSizeAndPosition(UDim2.new(0, 400-10, 0, 70),  UDim2.new(0.5, 0, 0.5,0), "Out", "Quad", 0.3, true)

    local imagenoti = Instance.new("ImageLabel")

    imagenoti.Parent = TitleFrame
    imagenoti.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    imagenoti.BackgroundTransparency = 1.000
    imagenoti.AnchorPoint = Vector2.new(0.5, 0.5)
    imagenoti.Position = UDim2.new(0.9, 0, 0.5, 0)
    imagenoti.Size = UDim2.new(0, 50, 0, 50)
--  imagenoti.Image = "https://www.roblox.com/asset-thumbnail/image?assetId=7578496318&width=0&height=0&format=png"

    local txdlid = Instance.new("TextLabel")

    txdlid.Parent = TitleFrame
    txdlid.Name = "TextLabel_Tap"
    txdlid.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    txdlid.Size =UDim2.new(0, 160, 0,25 )
    txdlid.Font = Enum.Font.GothamBold
    txdlid.Text = titel
    txdlid.TextColor3 = Color3.fromRGB(255, 255, 255)
    txdlid.TextSize = 13.000
    txdlid.AnchorPoint = Vector2.new(0.5, 0.5)
    txdlid.Position = UDim2.new(0.23, 0, 0.3, 0)
    -- txdlid.TextYAlignment = Enum.TextYAlignment.Top
    txdlid.TextXAlignment = Enum.TextXAlignment.Left
    txdlid.BackgroundTransparency = 1

    local LableFrame = Instance.new("Frame")
    LableFrame.Name = "LableFrame"
    LableFrame.Parent = TitleFrame
    LableFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    LableFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LableFrame.BorderSizePixel = 0
    LableFrame.Position =  UDim2.new(0.36, 0, 0.67,0)
    LableFrame.Size = UDim2.new(0, 260, 0,25 )
    LableFrame.ClipsDescendants = true
    LableFrame.BackgroundTransparency = 1

    local TextNoti = Instance.new("TextLabel")

    TextNoti.Parent = LableFrame
    TextNoti.Name = "TextLabel_Tap"
    TextNoti.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextNoti.Size =UDim2.new(0, 260, 0,25 )
    TextNoti.Font = Enum.Font.GothamBold
    TextNoti.Text = text
    TextNoti.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextNoti.TextSize = 13.000
    TextNoti.AnchorPoint = Vector2.new(0.5, 0.5)
    TextNoti.Position = UDim2.new(0.5, 0, 0.5, 0)
    -- TextNoti.TextYAlignment = Enum.TextYAlignment.Top
    TextNoti.TextXAlignment = Enum.TextXAlignment.Left
    TextNoti.BackgroundTransparency = 1

    repeat wait() until TitleFrame.Size == UDim2.new(0, 400-10, 0, 70)

    local Time = Instance.new("Frame")
    Time.Name = "Time"
    Time.Parent = TitleFrame
--Time.AnchorPoint = Vector2.new(0.5, 0.5)
    Time.BackgroundColor3 =  Color3.fromRGB(255, 255, 255)
    Time.BorderSizePixel = 0
    Time.Position =  UDim2.new(0, 0, 0.,0)
    Time.Size = UDim2.new(0, 0,0,0)
    Time.ClipsDescendants = false
    Time.BackgroundTransparency = 0

    local ConnerTitile_Time = Instance.new("UICorner")

    ConnerTitile_Time.CornerRadius = UDim.new(0, 4)
    ConnerTitile_Time.Name = ""
    ConnerTitile_Time.Parent = Time


    Time:TweenSizeAndPosition(UDim2.new(0, 400-10, 0, 3),  UDim2.new(0., 0, 0.,0), "Out", "Quad", 0.3, true)
    repeat wait() until Time.Size == UDim2.new(0, 400-10, 0, 3)

    TweenService:Create(
        Time,
        TweenInfo.new(tonumber(delays), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
        {Size = UDim2.new(0, 0, 0, 3)} -- UDim2.new(0, 128, 0, 25)
    ):Play()
    delay(tonumber(delays),function()
        TweenService:Create(
            TitleFrame,
            TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        wait(0.3)
        TitleFrame:Destroy()
    end
)
end

function top:Taps(text)
    PageOrders = PageOrders + 1
    local name = tostring(text) or tostring(math.random(1,5000))

    local Frame_Tap = Instance.new("Frame")
    Frame_Tap.Parent = ScrollingFrame_Menubar
    Frame_Tap.Name = text.."Server"
    Frame_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_Tap.BackgroundTransparency = 1
    Frame_Tap.Position = UDim2.new(0.0, 0, 0.0, 0)
    Frame_Tap.Size = UDim2.new(0, 100, 0, 25)
    Frame_Tap.Visible = true

    local TextLabel_Tap = Instance.new("TextLabel")

    TextLabel_Tap.Parent = Frame_Tap
    TextLabel_Tap.Name = "TextLabel_Tap"
    TextLabel_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_Tap.Position = UDim2.new(0.5, 0, 0.8, 0)
    TextLabel_Tap.Size = UDim2.new(0, 0, 0, 0)
    TextLabel_Tap.Font = Enum.Font.SourceSans
    TextLabel_Tap.Text = " "
    TextLabel_Tap.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_Tap.TextSize = 14.000
    TextLabel_Tap.AnchorPoint = Vector2.new(0.5, 0.5)

    local TextButton_Tap = Instance.new("TextButton")

    TextButton_Tap.Parent = Frame_Tap
    TextButton_Tap.Name = "TextButton_Tap"
    TextButton_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_Tap.BackgroundTransparency = 1.000
    TextButton_Tap.Position = UDim2.new(0.114491031, 0, -0.0216345787, 0)
    TextButton_Tap.Size = UDim2.new(0, 80, 0, 20)
    TextButton_Tap.Font = Enum.Font.GothamSemibold
    TextButton_Tap.TextColor3 = Color3.fromRGB(155, 155, 155)
    TextButton_Tap.TextSize = 13.000
    TextButton_Tap.Text = tostring(text)

    local MainPage = Instance.new("Frame")

    MainPage.Name = name.."_MainPage"
    MainPage.Parent = pagesFolder
    MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainPage.BorderSizePixel = 0
    MainPage.Position = UDim2.new(0.5, 0, 0.5, 0) -- UDim2.new(0.0149812736, 0, 0.13, 0)
    MainPage.Size = UDim2.new(0, 518, 0, 375)
    MainPage.BackgroundTransparency = 1
    MainPage.ClipsDescendants = true
    MainPage.Visible = true
    MainPage.LayoutOrder = PageOrders




    TextButton_Tap.MouseButton1Click:connect(function()
        if MainPage.Name == text.."_MainPage" then
            UIPage:JumpToIndex(MainPage.LayoutOrder)

        end
        for i ,v in next , ScrollingFrame_Menubar:GetChildren() do
            if v:IsA("Frame") then
                TweenService:Create(
                    v.TextButton_Tap,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155, 155, 155)}
                ):Play()
            end

            TweenService:Create(
                TextButton_Tap,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)}
            ):Play()
        end
    end)

    if fs == false then
        -- TweenService:Create(
        --     TextLabel_Tap,
        --     TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        --     {Size = UDim2.new(0, 70, 0, 2)}
        -- ):Play()
        TweenService:Create(
            TextButton_Tap,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextColor3 = Color3.fromRGB(255, 255, 255)}
        ):Play()

        MainPage.Visible = true
        Frame_Tap.Name  = text .. "Server"
        fs  = true
    end
    local ScrollingFrame_Pagefrist = Instance.new("ScrollingFrame")

    ScrollingFrame_Pagefrist.Parent = MainPage
    ScrollingFrame_Pagefrist.Active = true
    ScrollingFrame_Pagefrist.BackgroundColor3 = Color3.fromRGB(23, 23, 23) -- 249, 53, 139
    ScrollingFrame_Pagefrist.BorderSizePixel = 0
    ScrollingFrame_Pagefrist.Size = UDim2.new(0, 518, 0, 375)
    ScrollingFrame_Pagefrist.ScrollBarThickness = 4
    ScrollingFrame_Pagefrist.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255) -- 249, 53, 139

    local UIGridLayout_Pagefrist = Instance.new("UIGridLayout")
    local UIPadding_Pagefrist = Instance.new("UIPadding")

    UIGridLayout_Pagefrist.Archivable = false
    UIGridLayout_Pagefrist.Parent = ScrollingFrame_Pagefrist
    UIGridLayout_Pagefrist.SortOrder = Enum.SortOrder.LayoutOrder
    UIGridLayout_Pagefrist.CellPadding = UDim2.new(0, 13, 0, 15)
    UIGridLayout_Pagefrist.CellSize = UDim2.new(0, 240, 0, 370)

    UIPadding_Pagefrist.Parent = ScrollingFrame_Pagefrist
    UIPadding_Pagefrist.PaddingLeft = UDim.new(0, 10)
    UIPadding_Pagefrist.PaddingTop = UDim.new(0, 20)

    local page = {}

    function page:newpage()

        local Pageframe = Instance.new("Frame")


        Pageframe.Parent = ScrollingFrame_Pagefrist
        Pageframe.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Pageframe.BorderSizePixel = 0
        Pageframe.Position = UDim2.new(0.028957529, 0, 0.0496277921, 0)
        Pageframe.Size = UDim2.new(0, 240, 0, 379)


        local ScrollingFrame_Pageframe = Instance.new("ScrollingFrame")


        ScrollingFrame_Pageframe.Parent = Pageframe
        ScrollingFrame_Pageframe.Active = true
        ScrollingFrame_Pageframe.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        ScrollingFrame_Pageframe.BorderSizePixel = 0
        ScrollingFrame_Pageframe.Position = UDim2.new(0, 0, -0.0101253344, 0)
        ScrollingFrame_Pageframe.Size = UDim2.new(0, 240, 0, 379)
        ScrollingFrame_Pageframe.ScrollBarThickness = 4
        ScrollingFrame_Pageframe.ScrollBarImageColor3 = Color3.fromRGB(222, 222, 222)



        local UIPadding_Pageframe = Instance.new("UIPadding")
        local UIListLayout_Pageframe = Instance.new("UIListLayout")


        UIPadding_Pageframe.Parent = ScrollingFrame_Pageframe
        UIPadding_Pageframe.PaddingLeft = UDim.new(0, 15)
        UIPadding_Pageframe.PaddingTop = UDim.new(0, 10)


        UIListLayout_Pageframe.Parent = ScrollingFrame_Pageframe
        UIListLayout_Pageframe.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_Pageframe.Padding = UDim.new(0, 7)

        UIListLayout_Pageframe:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
            ScrollingFrame_Pageframe.CanvasSize = UDim2.new(0,0,0,UIListLayout_Pageframe.AbsoluteContentSize.Y + 120 )
        end)

        UIGridLayout_Pagefrist:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
            ScrollingFrame_Pagefrist.CanvasSize = UDim2.new(0,0,0,UIGridLayout_Pagefrist.AbsoluteContentSize.Y + 50 )
        end)

        game:GetService("RunService").Stepped:Connect(function ()
            pcall(function ()
                ScrollingFrame_Menubar.CanvasSize = UDim2.new(0,  UIListLayout_Menubar.AbsoluteContentSize.X, 0,0)
                ScrollingFrame_Pageframe.CanvasSize = UDim2.new(0,0,0,UIListLayout_Pageframe.AbsoluteContentSize.Y +20 )
                ScrollingFrame_Pagefrist.CanvasSize = UDim2.new(0,0,0,UIGridLayout_Pagefrist.AbsoluteContentSize.Y + 40)
            end)
        end)
    local items = {}

    function items:Toggle(text,config,callback)
        local Toggle = Instance.new("Frame")

        Toggle.Parent = ScrollingFrame_Pageframe
        Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Toggle.BorderSizePixel = 0
        Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
        Toggle.Size = UDim2.new(0, 213, 0, 35)
        Toggle.BackgroundTransparency = 1
        Toggle.AnchorPoint = Vector2.new(0.5, 0.5)

        local TextButton_Toggle = Instance.new("TextButton")

        TextButton_Toggle.Parent = Toggle
        TextButton_Toggle.BackgroundTransparency =1
        TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TextButton_Toggle.BorderSizePixel = 0
        TextButton_Toggle.Size = UDim2.new(0, 213, 0, 35)
        TextButton_Toggle.AutoButtonColor = false
        TextButton_Toggle.Font = Enum.Font.SourceSans
        TextButton_Toggle.Text = " "
        TextButton_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_Toggle.TextSize = 12.000

        local TextButton_2_Toggle = Instance.new("TextButton")

        TextButton_2_Toggle.Parent = TextButton_Toggle
        TextButton_2_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--        TextButton_2_Toggle.BorderColor3 = Color3.fromRGB(249, 53, 139)
        TextButton_2_Toggle.BorderSizePixel = 0
        TextButton_2_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_2_Toggle.Position = UDim2.new(0.9, 0, 0.5, 0)
        TextButton_2_Toggle.Size = UDim2.new(0, 30, 0, 13)
        TextButton_2_Toggle.Font = Enum.Font.SourceSans
        TextButton_2_Toggle.Text = " "
        TextButton_2_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_2_Toggle.TextSize = 12.000
        TextButton_2_Toggle.AutoButtonColor = false

        local TextButton_Pageframe_Uiconner = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner.CornerRadius = UDim.new(0, 30)
        TextButton_Pageframe_Uiconner.Name = ""
        TextButton_Pageframe_Uiconner.Parent = TextButton_2_Toggle

        local TextButton_3_Toggle = Instance.new("TextButton")

        TextButton_3_Toggle.Parent = TextButton_2_Toggle
        TextButton_3_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(249, 53, 139)
        TextButton_3_Toggle.BorderSizePixel = 0
        TextButton_3_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_3_Toggle.Position = UDim2.new(0.1, 0, 0.5, 0)
        TextButton_3_Toggle.Size = UDim2.new(0, 19, 0, 19)
        TextButton_3_Toggle.Font = Enum.Font.SourceSans
        TextButton_3_Toggle.Text = " "
        TextButton_3_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_3_Toggle.TextSize = 12.000
        TextButton_3_Toggle.AutoButtonColor = false

        local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 30)
        TextButton_Pageframe_Uiconner2.Name = ""
        TextButton_Pageframe_Uiconner2.Parent = TextButton_3_Toggle

        local TextButton_4_Toggle = Instance.new("TextButton")

        TextButton_4_Toggle.Parent = TextButton_3_Toggle
        TextButton_4_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
--        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(249, 53, 139)
        TextButton_4_Toggle.BorderSizePixel = 0
        TextButton_4_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_4_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextButton_4_Toggle.Size = UDim2.new(0, 27, 0, 27-2)
        TextButton_4_Toggle.Font = Enum.Font.SourceSans
        TextButton_4_Toggle.Text = " "
        TextButton_4_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_4_Toggle.TextSize = 12.000
        TextButton_4_Toggle.AutoButtonColor = false
        TextButton_4_Toggle.BackgroundTransparency = 1
        TextButton_4_Toggle.Visible = true

        local TextButton_Pageframe_Uiconner4 = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner4.CornerRadius = UDim.new(0, 30)
        TextButton_Pageframe_Uiconner4.Name = ""
        TextButton_Pageframe_Uiconner4.Parent = TextButton_4_Toggle

        local TextLabel_Toggle = Instance.new("TextLabel")

        TextLabel_Toggle.Parent = Toggle
        TextLabel_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_Toggle.BackgroundTransparency = 1
        TextLabel_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel_Toggle.Position = UDim2.new(0.4, 0, 0.5, 0)
        TextLabel_Toggle.BorderSizePixel = 0
        TextLabel_Toggle.Size = UDim2.new(0, 130, 0, 25)
        TextLabel_Toggle.Font = Enum.Font.GothamSemibold
        TextLabel_Toggle.Text = text
        TextLabel_Toggle.TextColor3 = Color3.fromRGB(200, 200, 200)
        TextLabel_Toggle.TextSize = 13.000
        TextLabel_Toggle.ClipsDescendants = true
        TextLabel_Toggle.TextWrapped = true
        TextLabel_Toggle.TextXAlignment = Enum.TextXAlignment.Left

        local TextButton_Toggle2 = Instance.new("TextButton")

        TextButton_Toggle2.Parent = TextButton_Toggle
        TextButton_Toggle2.BackgroundTransparency =1
        TextButton_Toggle2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TextButton_Toggle2.BorderSizePixel = 0
        TextButton_Toggle2.Size = UDim2.new(0, 213, 0, 35)
        TextButton_Toggle2.AutoButtonColor = false
        TextButton_Toggle2.Font = Enum.Font.SourceSans
        TextButton_Toggle2.Text = " "
        TextButton_Toggle2.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_Toggle2.TextSize = 12.000

        TextButton_Toggle2.MouseEnter:Connect(function()
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextLabel_Toggle,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

    TextButton_Toggle2.MouseLeave:Connect(function()
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextLabel_Toggle,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(200, 200, 200)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

    local check = {toogle = false ; loacker = true ; togfunction = {

    };
}
TextButton_Toggle2.MouseButton1Click:Connect(function()
        if check.toogle == false and check.loacker == true  then
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_3_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_2_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
        elseif  check.loacker ==  true then
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_3_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_2_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
        end
        if  check.loacker == true  then
        check.toogle = not check.toogle
        callback(check.toogle)
        end
    end
)

    if config == true then
        TweenService:Create(
            TextButton_4_Toggle,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            TextButton_3_Toggle,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            TextButton_2_Toggle,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
        check.toogle = true
        callback(check.toogle)
    end

    local lockerframe = Instance.new("Frame")

    lockerframe.Name = "lockerframe"
    lockerframe.Parent = Toggle
    lockerframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    lockerframe.BackgroundTransparency = 1
    lockerframe.Size = UDim2.new(0, 320, 0, 35)
    lockerframe.Position = UDim2.new(0.5, 0, 0.5, 0)
    lockerframe.AnchorPoint = Vector2.new(0.5, 0.5)

    local LockerImageLabel = Instance.new("ImageLabel")
    LockerImageLabel.Parent = lockerframe
    LockerImageLabel.BackgroundTransparency = 1.000
    LockerImageLabel.BorderSizePixel = 0
    LockerImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    LockerImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    LockerImageLabel.Size = UDim2.new(0, 0, 0, 0)
    LockerImageLabel.Image = "http://www.roblox.com/asset/?id=6031082533"


    function check.togfunction:lock()
        TweenService:Create(
            lockerframe,
            TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
            {BackgroundTransparency = 0.7}
        ):Play()
        TweenService:Create(
            LockerImageLabel,
            TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
            {Size = UDim2.new(0, 30, 0, 30)}
        ):Play()

        check.loacker  = false
    --    pcall(callback,locker)
    end
    function check.togfunction:unlock()
        TweenService:Create(
            lockerframe,
            TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
            {BackgroundTransparency = 1}
        ):Play()
        TweenService:Create(
            LockerImageLabel,
            TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
            {Size = UDim2.new(0, 0, 0, 0)}
        ):Play()
        check.loacker  = true
    --   pcall(callback,locker)
    end

        return  check.togfunction
    end

    function items:Button(text,callback)

        local ButtonFrame = Instance.new("Frame")

        ButtonFrame.Name = "ButtonFrame"
        ButtonFrame.Parent = ScrollingFrame_Pageframe
        ButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ButtonFrame.BorderSizePixel = 0
        ButtonFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        ButtonFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        ButtonFrame.Size = UDim2.new(0, 213, 0, 25) -- UDim2.new(0, 213, 0, 35)
        ButtonFrame.BackgroundTransparency  = 1
        ButtonFrame.ClipsDescendants = true



        local MheeFrameStroke = Instance.new("UIStroke")

        MheeFrameStroke.Thickness = 0
        MheeFrameStroke.Name = ""
        MheeFrameStroke.Parent = ButtonFrame
        MheeFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
        MheeFrameStroke.Color = Color3.fromRGB(255, 255, 255)
        MheeFrameStroke.Transparency = 0.7

        local Button = Instance.new("TextButton")

        Button.Parent = ButtonFrame
        Button.Name = "Button"
        Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Button.Size = UDim2.new(0,150, 0, 25)
        Button.Font = Enum.Font.SourceSansSemibold
        Button.Text = tostring(text)
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 13.000
        Button.AnchorPoint = Vector2.new(0.5, 0.5)
        Button.Position = UDim2.new(0.5, 0, 0.5, 0)
        Button.TextXAlignment = Enum.TextXAlignment.Center
        Button.BackgroundTransparency = 0.6
        Button.TextWrapped = true
        Button.AutoButtonColor = false
        Button.ClipsDescendants = true

        local ConnerPageMhee = Instance.new("UICorner")

        ConnerPageMhee.CornerRadius = UDim.new(0, 4)
        ConnerPageMhee.Name = ""
        ConnerPageMhee.Parent = Button

        Button.MouseEnter:Connect(function()
            TweenService:Create(
                Button,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size =  UDim2.new(0, 213, 0, 25)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                Button,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency = 0} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                Button,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )
        Button.MouseLeave:Connect(function()
            TweenService:Create(
                Button,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size =  UDim2.new(0, 150, 0, 25)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                Button,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                Button,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

    Button.MouseButton1Click:Connect(function()
    --    Ripple(Button)
        callback()
        TweenService:Create(
            Button,
            TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
            {TextSize =  16} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        wait(0.1)
        TweenService:Create(
            Button,
            TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
            {TextSize =  13} -- UDim2.new(0, 128, 0, 25)
        ):Play()
    end
)

    end

    function items:Slider(text,check,floor,min,max,de,lol,tog,callback)

    if check then

        local SliderFrame = Instance.new("Frame")

        SliderFrame.Name = "SliderFrame"
        SliderFrame.Parent = ScrollingFrame_Pageframe
        SliderFrame.BackgroundColor3 =  Color3.fromRGB(28, 28, 28)-- Color3.fromRGB(249, 53, 139)
        SliderFrame.BorderSizePixel = 0
        SliderFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        SliderFrame.Size = UDim2.new(0, 213, 0, 75) -- UDim2.new(0, 213, 0, 35)
        SliderFrame.BackgroundTransparency  = 0
        SliderFrame.ClipsDescendants = true

        local SliderFrameConner = Instance.new("UICorner")

        SliderFrameConner.CornerRadius = UDim.new(0, 4)
        SliderFrameConner.Name = ""
        SliderFrameConner.Parent = SliderFrame

        local SliderFrameStroke = Instance.new("UIStroke")

        SliderFrameStroke.Thickness = 1
        SliderFrameStroke.Name = ""
        SliderFrameStroke.Parent = SliderFrame
        SliderFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
        SliderFrameStroke.Color = Color3.fromRGB(255, 255, 255)
        SliderFrameStroke.Transparency = 0.7


        SliderFrame.MouseEnter:Connect(function()
            TweenService:Create(
                SliderFrameStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

        SliderFrame.MouseLeave:Connect(function()
            TweenService:Create(
                SliderFrameStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )


        local LabelNameSliderxd = Instance.new("TextLabel")

        LabelNameSliderxd.Parent = SliderFrame
        LabelNameSliderxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelNameSliderxd.BackgroundTransparency = 1
        LabelNameSliderxd.BorderSizePixel = 0
        LabelNameSliderxd.Position = UDim2.new(0.35, 0, 0.2, 0)
        LabelNameSliderxd.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelNameSliderxd.Size = UDim2.new(0, 120, 0, 20)
        LabelNameSliderxd.Font = Enum.Font.GothamBold
        LabelNameSliderxd.Text = tostring(text)
        LabelNameSliderxd.TextColor3 = Color3.fromRGB(255, 255, 255)
        LabelNameSliderxd.TextSize = 11.000
        LabelNameSliderxd.TextXAlignment = Enum.TextXAlignment.Left


        local ShowValueFarm = Instance.new("Frame")

        ShowValueFarm.Name = "ShowValueFarm"
        ShowValueFarm.Parent = SliderFrame
        ShowValueFarm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        ShowValueFarm.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
        ShowValueFarm.Size = UDim2.new(0, 75, 0, 15)
        ShowValueFarm.BackgroundTransparency = 0
        ShowValueFarm.BorderSizePixel = 0
        ShowValueFarm.AnchorPoint = Vector2.new(0.5, 0.5)
        ShowValueFarm.Position = UDim2.new(0.8, 0, 0.2, 0)
        ShowValueFarm.ClipsDescendants = false

        local CustomValue = Instance.new("TextBox")

        CustomValue.Parent = ShowValueFarm
        CustomValue.BackgroundColor3 = Color3.fromRGB(45,45, 45)
        CustomValue.BorderSizePixel = 0
        CustomValue.ClipsDescendants = true
        CustomValue.AnchorPoint = Vector2.new(0.5, 0.5)
        CustomValue.Position = UDim2.new(0.5, 0, 0.5, 0)
        CustomValue.Size = UDim2.new(0, 158, 0, 26)
        CustomValue.Font = Enum.Font.GothamSemibold
        CustomValue.PlaceholderColor3 = Color3.fromRGB(222, 222, 222)
        CustomValue.PlaceholderText =  ""
        if floor == true then
            CustomValue.Text =  tostring(de and string.format("%.1f",(de / max) * (max - min) + min) or 0)
        else
            CustomValue.Text =  tostring(de and math.floor( (de / max) * (max - min) + min) or 0)
        end
        CustomValue.TextColor3 = Color3.fromRGB(255, 255, 255)
        CustomValue.TextSize = 8.000
        CustomValue.BackgroundTransparency = 1

        local ValueFrame = Instance.new("Frame")

        ValueFrame.Name = "ValueFrame"
        ValueFrame.Parent = SliderFrame
        ValueFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        ValueFrame.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
        ValueFrame.Size = UDim2.new(0, 140, 0, 5)
        ValueFrame.BackgroundTransparency = 0
        ValueFrame.BorderSizePixel = 0
        ValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        ValueFrame.Position = UDim2.new(0.4, 0, 0.8, 0)
        ValueFrame.ClipsDescendants = false


        local PartValue = Instance.new("Frame")

        PartValue.Name = "PartValue"
        PartValue.Parent = ValueFrame
        PartValue.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
        PartValue.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
        PartValue.Size = UDim2.new(0, 140, 0, 5)
        PartValue.BackgroundTransparency = 1
        PartValue.BorderSizePixel = 0
        PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
        PartValue.Position = UDim2.new(0.5, 0, 0.5, 0)
        PartValue.ClipsDescendants = false

        local MainValue = Instance.new("Frame")

        MainValue.Name = "MainValue"
        MainValue.Parent = PartValue
        MainValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainValue.Size = UDim2.new((de or 0) / max, 0, 0, 5)
        MainValue.BackgroundTransparency = 0
        MainValue.BorderSizePixel = 0
        -- MainValue.AnchorPoint = Vector2.new(0.5, 0.5)
        MainValue.Position = UDim2.new(0., 0, 0.0, 0)
        MainValue.ClipsDescendants = false

        local Conner_S1 = Instance.new("UICorner")

        Conner_S1.CornerRadius = UDim.new(0, 8)
        Conner_S1.Name = ""
        Conner_S1.Parent = MainValue

        local Conner_S2 = Instance.new("UICorner")

        Conner_S2.CornerRadius = UDim.new(0, 8)
        Conner_S2.Name = ""
        Conner_S2.Parent = ValueFrame

        local ConneValue = Instance.new("Frame")

        ConneValue.Name = "ConneValue"
        ConneValue.Parent = PartValue
        ConneValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ConneValue.Size = UDim2.new(0, 13, 0,13)
        ConneValue.BackgroundTransparency = 0
        ConneValue.BorderSizePixel = 0
        ConneValue.AnchorPoint = Vector2.new(0.5, 0.5)
        ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0.3,0.5, 0)
        ConneValue.ClipsDescendants = false


        local Conner_Conne = Instance.new("UICorner")

        Conner_Conne.CornerRadius = UDim.new(0, 300)
        Conner_Conne.Name = ""
        Conner_Conne.Parent = ConneValue

        local Addvalue = Instance.new("ImageButton")

        Addvalue.Name = "Imatog"
        Addvalue.Parent = SliderFrame
        Addvalue.BackgroundTransparency = 1.000
        Addvalue.BorderSizePixel = 0
        Addvalue.Position = UDim2.new(0.85, 0, 0.35, 0)
        Addvalue.Size = UDim2.new(0, 15, 0, 15)
        Addvalue.Image = "http://www.roblox.com/asset/?id=6035067836"
        Addvalue.ImageColor3 =  Color3.fromRGB(255, 255, 255)

        local Deletevalue = Instance.new("ImageButton")

        Deletevalue.Name = "Imatog"
        Deletevalue.Parent = SliderFrame
        Deletevalue.BackgroundTransparency = 1.000
        Deletevalue.BorderSizePixel = 0
        Deletevalue.Position = UDim2.new(0.7, 0, 0.35, 0)
        Deletevalue.Size = UDim2.new(0, 15, 0, 15)
        Deletevalue.Image = "http://www.roblox.com/asset/?id=6035047377"
        Deletevalue.ImageColor3 =  Color3.fromRGB(255, 255, 255)


        local TextButton_2_Toggle = Instance.new("TextButton")

        TextButton_2_Toggle.Parent = ValueFrame
        TextButton_2_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
--        TextButton_2_Toggle.BorderColor3 = Color3.fromRGB(249, 53, 139)
        TextButton_2_Toggle.BorderSizePixel = 0
        TextButton_2_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_2_Toggle.Position = UDim2.new(1.25, 0, 0.4, 0)
        TextButton_2_Toggle.Size = UDim2.new(0, 30, 0, 13)
        TextButton_2_Toggle.Font = Enum.Font.SourceSans
        TextButton_2_Toggle.Text = " "
        TextButton_2_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_2_Toggle.TextSize = 12.000
        TextButton_2_Toggle.AutoButtonColor = false

        local TextButton_Pageframe_Uiconner = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner.CornerRadius = UDim.new(0, 30)
        TextButton_Pageframe_Uiconner.Name = ""
        TextButton_Pageframe_Uiconner.Parent = TextButton_2_Toggle

        local TextButton_3_Toggle = Instance.new("TextButton")

        TextButton_3_Toggle.Parent = TextButton_2_Toggle
        TextButton_3_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(249, 53, 139)
        TextButton_3_Toggle.BorderSizePixel = 0
        TextButton_3_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_3_Toggle.Position = UDim2.new(0.1, 0, 0.5, 0)
        TextButton_3_Toggle.Size = UDim2.new(0, 19, 0, 19)
        TextButton_3_Toggle.Font = Enum.Font.SourceSans
        TextButton_3_Toggle.Text = " "
        TextButton_3_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_3_Toggle.TextSize = 12.000
        TextButton_3_Toggle.AutoButtonColor = false

        local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 30)
        TextButton_Pageframe_Uiconner2.Name = ""
        TextButton_Pageframe_Uiconner2.Parent = TextButton_3_Toggle

        local TextButton_4_Toggle = Instance.new("TextButton")

        TextButton_4_Toggle.Parent = TextButton_3_Toggle
        TextButton_4_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155,155)
--        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(249, 53, 139)
        TextButton_4_Toggle.BorderSizePixel = 0
        TextButton_4_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_4_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextButton_4_Toggle.Size = UDim2.new(0, 27, 0, 27-2)
        TextButton_4_Toggle.Font = Enum.Font.SourceSans
        TextButton_4_Toggle.Text = " "
        TextButton_4_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_4_Toggle.TextSize = 12.000
        TextButton_4_Toggle.AutoButtonColor = false
        TextButton_4_Toggle.BackgroundTransparency = 1
        TextButton_4_Toggle.Visible = true

        local TextButton_Pageframe_Uiconner4 = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner4.CornerRadius = UDim.new(0, 30)
        TextButton_Pageframe_Uiconner4.Name = ""
        TextButton_Pageframe_Uiconner4.Parent = TextButton_4_Toggle


        local TextButton_Toggle = Instance.new("TextButton")

        TextButton_Toggle.Parent = ValueFrame
        TextButton_Toggle.BackgroundTransparency =1
        TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_Toggle.BorderSizePixel = 0
        TextButton_Toggle.Size = UDim2.new(0, 50, 0, 20)
        TextButton_Toggle.AutoButtonColor = false
        TextButton_Toggle.Font = Enum.Font.SourceSans
        TextButton_Toggle.Text = " "
        TextButton_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_Toggle.TextSize = 12.000
        TextButton_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_Toggle.Position = UDim2.new(1.25, 0, 0.4, 0)



    -- local value = de
    local check2 = {toogle2 = false;}
        local function move(input)
            local pos =
                UDim2.new(
                    math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                    0,
                    0.3,
                    0
                )
            local pos1 =
                UDim2.new(
                    math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                    0,
                    0,
                    5
                )

                MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)

                ConneValue:TweenPosition(pos, "Out", "Sine", 0.2, true)
                if floor == true then
                    local value = string.format("%.1f",((pos.X.Scale * max) / max) * (max - min) + min)
                    CustomValue.Text = tostring(value)
                --   callback[2] = value
                callback({
                    ["s"] = value;
                    ["t"] = check2.toogle2
                })
                --callback({value,check2.toogle2})
                    --callback(value)
                else
                    local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
                    CustomValue.Text = tostring(value)
                    callback({
                        ["s"] = value;
                        ["t"] = check2.toogle2
                    })
            --       callback({value,check2.toogle2})

                end



            end

            local dragging = false
            ConneValue.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true

                    end
                end
            )
            ConneValue.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false

                    end
                end
            )
            SliderFrame.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true

                    end
                end
            )
            SliderFrame.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false

                    end
                end
            )


            ValueFrame.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true

                    end
                end
            )
            ValueFrame.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false

                    end
                end
            )

            game:GetService("UserInputService").InputChanged:Connect(
                function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        move(input)
                    end
                end
                )

                CustomValue.FocusLost:Connect(function()
                    if CustomValue.Text == "" then
                        CustomValue.Text  = de
                    end
                    if  tonumber(CustomValue.Text) > max then
                        CustomValue.Text  = max
                    end
                    if  tonumber(CustomValue.Text) <= min then
                        CustomValue.Text  = min
                    end
                    MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                    ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0, 0) , "Out", "Sine", 0.2, true)
                    if floor == true then
                        CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                    else
                        CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                    end
                    callback({
                        ["s"] =  CustomValue.Text;
                        ["t"] = check2.toogle2;
                    })
            --       callback({ tonumber(CustomValue.Text),check2.toogle2})
            --  pcall(callback, CustomValue.Text)
                end)


                Addvalue.MouseButton1Click:Connect(function ()
                    if CustomValue.Text == "" then
                        CustomValue.Text  = de
                    end
                    pcall(function()
                        CustomValue.Text  = CustomValue.Text  - tonumber(lol)
                    end)
                    if  tonumber(CustomValue.Text) > max then
                        CustomValue.Text  = max
                    end
                    if  tonumber(CustomValue.Text) < min then
                        CustomValue.Text  = min
                    end
                    MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                    ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
                    if floor == true then
                        CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                    else
                        CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                    end
                    callback({
                        ["s"] =  CustomValue.Text;
                        ["t"] = check2.toogle2
                    })
                --   callback({ tonumber(CustomValue.Text),check2.toogle2})
                --  pcall(callback, CustomValue.Text)
                end)

                Deletevalue.MouseButton1Click:Connect(function ()
                    if CustomValue.Text == "" then
                        CustomValue.Text  = de
                    end
                    pcall(function()
                        CustomValue.Text  = CustomValue.Text  + tonumber(lol)
                    end)
                    if  tonumber(CustomValue.Text) > max then
                        CustomValue.Text  = max
                    end
                    if  tonumber(CustomValue.Text) < min then
                        CustomValue.Text  = min
                    end
                    MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                    ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
                    if floor == true then
                        CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                    else
                        CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                    end
                    callback({
                        ["s"] =  CustomValue.Text;
                        ["t"] = check2.toogle2;
                    })
        --callback({ tonumber(CustomValue.Text),check2.toogle2})
                --  pcall(callback, CustomValue.Text)
                end)




        ---
                TextButton_Toggle.MouseEnter:Connect(function()
                    TweenService:Create(
                        TextButton_4_Toggle,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end
            )

            TextButton_Toggle.MouseLeave:Connect(function()
                    TweenService:Create(
                        TextButton_4_Toggle,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end
            )



        TextButton_Toggle.MouseButton1Click:Connect(function()
            if check2.toogle2 == false   then
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_3_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_2_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
            else
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_3_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_2_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
            end
                check2.toogle2 = not check2.toogle2
                callback({
                    ["t"] = check2.toogle2;

                })
            --   callback({value,check2.toogle2})
                --callback(check2.toogle2)
        end
    )

        if tog == true then
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_3_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_2_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
            check2.toogle2 = true
            callback({
                ["t"] = check2.toogle2;
            })
    --        callback({value,check2.toogle2})
        --  callback(check2.toogle2)
        end


    else
        tog = nil
        local SliderFrame = Instance.new("Frame")

        SliderFrame.Name = "SliderFrame"
        SliderFrame.Parent = ScrollingFrame_Pageframe
        SliderFrame.BackgroundColor3 =  Color3.fromRGB(28, 28, 28)-- Color3.fromRGB(249, 53, 139)
        SliderFrame.BorderSizePixel = 0
        SliderFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        SliderFrame.Size = UDim2.new(0, 213, 0, 75) -- UDim2.new(0, 213, 0, 35)
        SliderFrame.BackgroundTransparency  = 0
        SliderFrame.ClipsDescendants = true

        local SliderFrameConner = Instance.new("UICorner")

        SliderFrameConner.CornerRadius = UDim.new(0, 4)
        SliderFrameConner.Name = ""
        SliderFrameConner.Parent = SliderFrame

        local SliderFrameStroke = Instance.new("UIStroke")

        SliderFrameStroke.Thickness = 1
        SliderFrameStroke.Name = ""
        SliderFrameStroke.Parent = SliderFrame
        SliderFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
        SliderFrameStroke.Color = Color3.fromRGB(255, 255, 255)
        SliderFrameStroke.Transparency = 0.7



        SliderFrame.MouseEnter:Connect(function()
            TweenService:Create(
                SliderFrameStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

        SliderFrame.MouseLeave:Connect(function()
            TweenService:Create(
                SliderFrameStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

        local LabelNameSliderxd = Instance.new("TextLabel")

        LabelNameSliderxd.Parent = SliderFrame
        LabelNameSliderxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelNameSliderxd.BackgroundTransparency = 1
        LabelNameSliderxd.BorderSizePixel = 0
        LabelNameSliderxd.Position = UDim2.new(0.35, 0, 0.2, 0)
        LabelNameSliderxd.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelNameSliderxd.Size = UDim2.new(0, 120, 0, 20)
        LabelNameSliderxd.Font = Enum.Font.GothamBold
        LabelNameSliderxd.Text = tostring(text)
        LabelNameSliderxd.TextColor3 = Color3.fromRGB(255, 255, 255)
        LabelNameSliderxd.TextSize = 11.000
        LabelNameSliderxd.TextXAlignment = Enum.TextXAlignment.Left


        local ShowValueFarm = Instance.new("Frame")

        ShowValueFarm.Name = "ShowValueFarm"
        ShowValueFarm.Parent = SliderFrame
        ShowValueFarm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        ShowValueFarm.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
        ShowValueFarm.Size = UDim2.new(0, 75, 0, 15)
        ShowValueFarm.BackgroundTransparency = 0
        ShowValueFarm.BorderSizePixel = 0
        ShowValueFarm.AnchorPoint = Vector2.new(0.5, 0.5)
        ShowValueFarm.Position = UDim2.new(0.8, 0, 0.2, 0)
        ShowValueFarm.ClipsDescendants = false

        local CustomValue = Instance.new("TextBox")

        CustomValue.Parent = ShowValueFarm
        CustomValue.BackgroundColor3 = Color3.fromRGB(45,45, 45)
        CustomValue.BorderSizePixel = 0
        CustomValue.ClipsDescendants = true
        CustomValue.AnchorPoint = Vector2.new(0.5, 0.5)
        CustomValue.Position = UDim2.new(0.5, 0, 0.5, 0)
        CustomValue.Size = UDim2.new(0, 158, 0, 26)
        CustomValue.Font = Enum.Font.GothamSemibold
        CustomValue.PlaceholderColor3 = Color3.fromRGB(222, 222, 222)
        CustomValue.PlaceholderText =  ""
        if floor == true then
            CustomValue.Text =  tostring(de and string.format("%.1f",(de / max) * (max - min) + min) or 0)
        else
            CustomValue.Text =  tostring(de and math.floor( (de / max) * (max - min) + min) or 0)
        end
        CustomValue.TextColor3 = Color3.fromRGB(255, 255, 255)
        CustomValue.TextSize = 8.000
        CustomValue.BackgroundTransparency = 1

        local ValueFrame = Instance.new("Frame")

        ValueFrame.Name = "ValueFrame"
        ValueFrame.Parent = SliderFrame
        ValueFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        ValueFrame.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
        ValueFrame.Size = UDim2.new(0, 190, 0, 5)
        ValueFrame.BackgroundTransparency = 0
        ValueFrame.BorderSizePixel = 0
        ValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        ValueFrame.Position = UDim2.new(0.5, 0, 0.8, 0)
        ValueFrame.ClipsDescendants = false


        local PartValue = Instance.new("Frame")

        PartValue.Name = "PartValue"
        PartValue.Parent = ValueFrame
        PartValue.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
        PartValue.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
        PartValue.Size = UDim2.new(0, 190, 0, 5)
        PartValue.BackgroundTransparency = 1
        PartValue.BorderSizePixel = 0
        PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
        PartValue.Position = UDim2.new(0.5, 0, 0.5, 0)
        PartValue.ClipsDescendants = false

        local MainValue = Instance.new("Frame")

        MainValue.Name = "MainValue"
        MainValue.Parent = PartValue
        MainValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainValue.Size = UDim2.new((de or 0) / max, 0, 0, 5)
        MainValue.BackgroundTransparency = 0
        MainValue.BorderSizePixel = 0
        -- MainValue.AnchorPoint = Vector2.new(0.5, 0.5)
        MainValue.Position = UDim2.new(0., 0, 0.0, 0)
        MainValue.ClipsDescendants = false

        local Conner_S1 = Instance.new("UICorner")

        Conner_S1.CornerRadius = UDim.new(0, 8)
        Conner_S1.Name = ""
        Conner_S1.Parent = MainValue

        local Conner_S2 = Instance.new("UICorner")

        Conner_S2.CornerRadius = UDim.new(0, 8)
        Conner_S2.Name = ""
        Conner_S2.Parent = ValueFrame

        local ConneValue = Instance.new("Frame")

        ConneValue.Name = "ConneValue"
        ConneValue.Parent = PartValue
        ConneValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ConneValue.Size = UDim2.new(0, 13, 0,13)
        ConneValue.BackgroundTransparency = 0
        ConneValue.BorderSizePixel = 0
        ConneValue.AnchorPoint = Vector2.new(0.5, 0.5)
        ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0.3,0.5, 0)
        ConneValue.ClipsDescendants = false


        local Conner_Conne = Instance.new("UICorner")

        Conner_Conne.CornerRadius = UDim.new(0, 300)
        Conner_Conne.Name = ""
        Conner_Conne.Parent = ConneValue

        local Addvalue = Instance.new("ImageButton")

        Addvalue.Name = "Imatog"
        Addvalue.Parent = SliderFrame
        Addvalue.BackgroundTransparency = 1.000
        Addvalue.BorderSizePixel = 0
        Addvalue.Position = UDim2.new(0.85, 0, 0.35, 0)
        Addvalue.Size = UDim2.new(0, 15, 0, 15)
        Addvalue.Image = "http://www.roblox.com/asset/?id=6035067836"
        Addvalue.ImageColor3 =  Color3.fromRGB(255, 255, 255)

        local Deletevalue = Instance.new("ImageButton")

        Deletevalue.Name = "Imatog"
        Deletevalue.Parent = SliderFrame
        Deletevalue.BackgroundTransparency = 1.000
        Deletevalue.BorderSizePixel = 0
        Deletevalue.Position = UDim2.new(0.7, 0, 0.35, 0)
        Deletevalue.Size = UDim2.new(0, 15, 0, 15)
        Deletevalue.Image = "http://www.roblox.com/asset/?id=6035047377"
        Deletevalue.ImageColor3 =  Color3.fromRGB(255, 255, 255)

        local function move(input)
            local pos =
                UDim2.new(
                    math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                    0,
                    0.3,
                    0
                )
            local pos1 =
                UDim2.new(
                    math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                    0,
                    0,
                    5
                )

                MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)

                ConneValue:TweenPosition(pos, "Out", "Sine", 0.2, true)
                if floor == true then
                    local value = string.format("%.1f",((pos.X.Scale * max) / max) * (max - min) + min)
                    CustomValue.Text = tostring(value)
                    callback(value)
                else
                    local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
                    CustomValue.Text = tostring(value)
                    callback(value)
                end



            end

            local dragging = false
            ConneValue.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true

                    end
                end
            )
            ConneValue.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false

                    end
                end
            )
            SliderFrame.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true

                    end
                end
            )
            SliderFrame.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false

                    end
                end
            )


            ValueFrame.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true

                    end
                end
            )
            ValueFrame.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false

                    end
                end
            )

            game:GetService("UserInputService").InputChanged:Connect(
                function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        move(input)
                    end
                end
                )

                CustomValue.FocusLost:Connect(function()
                    if CustomValue.Text == "" then
                        CustomValue.Text  = de
                    end
                    if  tonumber(CustomValue.Text) > max then
                        CustomValue.Text  = max
                    end
                    MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                    ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0, 0) , "Out", "Sine", 0.2, true)
                    if floor == true then
                        CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                    else
                        CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                    end
                    pcall(callback, CustomValue.Text)
                end)


        Addvalue.MouseButton1Click:Connect(function ()
            if CustomValue.Text == "" then
                CustomValue.Text  = de
            end
            CustomValue.Text  = CustomValue.Text  - tonumber(lol)
            if  tonumber(CustomValue.Text) > max then
                CustomValue.Text  = max
            end
            if  tonumber(CustomValue.Text) < min then
                CustomValue.Text  = min
            end
            MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
            ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
            if floor == true then
                CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
            else
                CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
            end
            pcall(callback, CustomValue.Text)
        end)

        Deletevalue.MouseButton1Click:Connect(function ()
            if CustomValue.Text == "" then
                CustomValue.Text  = de
            end
            CustomValue.Text  = CustomValue.Text  + tonumber(lol)
            if  tonumber(CustomValue.Text) > max then
                CustomValue.Text  = max
            end
            if  tonumber(CustomValue.Text) < min then
                CustomValue.Text  = min
            end
            MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
            ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
            if floor == true then
                CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
            else
                CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
            end
            pcall(callback, CustomValue.Text)
        end)

    end

    end

    function items:Drop(text,use,option,callback)

    if use == false then
        local DropFrame = Instance.new("Frame")

        DropFrame.Name = "DropFrame"
        DropFrame.Parent = ScrollingFrame_Pageframe
        DropFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)-- Color3.fromRGB(249, 53, 139)
        DropFrame.BorderSizePixel = 0
        DropFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        DropFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        DropFrame.Size = UDim2.new(0, 213, 0, 30) -- UDim2.new(0, 213, 0, 35)
        DropFrame.BackgroundTransparency  = 0
        DropFrame.ClipsDescendants = true

        local ConnerDropFrame = Instance.new("UICorner")

        ConnerDropFrame.CornerRadius = UDim.new(0, 4)
        ConnerDropFrame.Name = ""
        ConnerDropFrame.Parent = DropFrame

        local DropFrameStroke = Instance.new("UIStroke")

        DropFrameStroke.Thickness = 1
        DropFrameStroke.Name = ""
        DropFrameStroke.Parent = DropFrame
        DropFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
        DropFrameStroke.Color = Color3.fromRGB(255, 255, 255)
        DropFrameStroke.Transparency = 0.7





        local LabelFrameDrop = Instance.new("TextLabel")

        LabelFrameDrop.Parent = DropFrame
        LabelFrameDrop.Name = "LabelFrameDrop"
        LabelFrameDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelFrameDrop.Position = UDim2.new(0., 0, 0., 0)
        LabelFrameDrop.Size =    UDim2.new(0, 213, 0, 30)
        LabelFrameDrop.Font = Enum.Font.SourceSansSemibold
        LabelFrameDrop.Text = ""
        LabelFrameDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
        LabelFrameDrop.TextSize = 14.000
    --   LabelFrameDrop.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelFrameDrop.BackgroundTransparency = 1
        LabelFrameDrop.TextXAlignment = Enum.TextXAlignment.Left


        local TextLabel_TapDrop = Instance.new("TextLabel")

        TextLabel_TapDrop.Parent = LabelFrameDrop
        TextLabel_TapDrop.Name = "TextLabel_TapDrop"
        TextLabel_TapDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_TapDrop.Position = UDim2.new(0.04, 0, 0.14, 0)
        TextLabel_TapDrop.Size =    UDim2.new(0, 140, 0, 20)
        TextLabel_TapDrop.Font = Enum.Font.SourceSansSemibold
        TextLabel_TapDrop.Text = tostring(text).." :"
        TextLabel_TapDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
        TextLabel_TapDrop.TextSize = 14.000
--     TextLabel_TapDrop.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel_TapDrop.BackgroundTransparency = 1
        TextLabel_TapDrop.TextXAlignment = Enum.TextXAlignment.Left


        local DropArbt_listimage = Instance.new("ImageButton")

        DropArbt_listimage.Parent = LabelFrameDrop
        DropArbt_listimage.BackgroundTransparency = 1.000
        DropArbt_listimage.AnchorPoint = Vector2.new(0.5, 0.5)
        DropArbt_listimage.Position = UDim2.new(0.9, 0, 0.5, 0)
        DropArbt_listimage.BorderSizePixel = 0
        DropArbt_listimage.Size = UDim2.new(0, 25, 0, 25)
        DropArbt_listimage.Image = "http://www.roblox.com/asset/?id=6031091004"
        DropArbt_listimage.ImageColor3 = Color3.fromRGB(155, 155, 155)

        local ScolDown = Instance.new("ScrollingFrame")

        ScolDown.Name = "ScolDown"
        ScolDown.Position = UDim2.new(0.02, 0, 1., 0)
        ScolDown.Parent = LabelFrameDrop
        ScolDown.Active = true
        ScolDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScolDown.BorderSizePixel = 0
        ScolDown.Size = UDim2.new(0, 205, 0, 115)
        ScolDown.ScrollBarThickness = 3
        ScolDown.ClipsDescendants = true
        ScolDown.BackgroundTransparency = 1
        ScolDown.CanvasSize = UDim2.new(0, 0, 0, 2)

        local UIListLayoutlist = Instance.new("UIListLayout")
        local UIPaddinglist = Instance.new("UIPadding")

        UIListLayoutlist.Name = "UIListLayoutlist"
        UIListLayoutlist.Parent = ScolDown
        UIListLayoutlist.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayoutlist.Padding = UDim.new(0, 5)

        UIPaddinglist.Name = "UIPaddinglist"
        UIPaddinglist.Parent = ScolDown
        UIPaddinglist.PaddingTop = UDim.new(0, 5)
        UIPaddinglist.PaddingLeft = UDim.new(0, 12)

        local ButtonDrop = Instance.new("TextButton")

        ButtonDrop.Parent = DropFrame
        ButtonDrop.Name = "ButtonDrop"
        ButtonDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ButtonDrop.Size = UDim2.new(0, 213, 0, 30)
        ButtonDrop.Font = Enum.Font.SourceSansSemibold
        ButtonDrop.Text = ""
        ButtonDrop.TextColor3 = Color3.fromRGB(255, 255, 255)
        ButtonDrop.TextSize = 13.000
    --   ButtonDrop.AnchorPoint = Vector2.new(0.5, 0.5)
        ButtonDrop.Position = UDim2.new(0., 0, 0., 0)
        ButtonDrop.TextXAlignment = Enum.TextXAlignment.Center
        ButtonDrop.BackgroundTransparency = 1
        ButtonDrop.TextWrapped = true
        ButtonDrop.AutoButtonColor = false
        ButtonDrop.ClipsDescendants = true

        local dog = false

        local FrameSize = 75
        local cout = 0
        for i , v in pairs(option) do
            cout =cout + 1
            if cout == 1 then
                FrameSize = 75
            elseif cout == 2 then
                FrameSize = 110
            elseif cout >= 3 then
                FrameSize = 150
            end

            local ListFrame = Instance.new("Frame")

            ListFrame.Name = "ListFrame"
            ListFrame.Parent = ScolDown
            ListFrame.BackgroundColor3 =  Color3.fromRGB(255, 23, 23)-- Color3.fromRGB(249, 53, 139)
            ListFrame.BorderSizePixel = 0
            ListFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            ListFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            ListFrame.Size = UDim2.new(0, 180, 0, 30) -- UDim2.new(0, 213, 0, 35)
            ListFrame.BackgroundTransparency  = 1
            ListFrame.ClipsDescendants = true

            local TextLabel_TapDro2p = Instance.new("TextLabel")

            TextLabel_TapDro2p.Parent = ListFrame
            TextLabel_TapDro2p.Name =  tostring(v).."Dropdown"
            TextLabel_TapDro2p.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_TapDro2p.Position = UDim2.new(0.5, 0, 0.5, 0)
            TextLabel_TapDro2p.Size =  UDim2.new(0, 180, 0, 30)
            TextLabel_TapDro2p.Font = Enum.Font.SourceSansSemibold
            TextLabel_TapDro2p.Text = tostring(v)
            TextLabel_TapDro2p.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_TapDro2p.TextSize = 14.000
            TextLabel_TapDro2p.AnchorPoint = Vector2.new(0.5, 0.5)
            TextLabel_TapDro2p.BackgroundTransparency = 1
            TextLabel_TapDro2p.TextXAlignment = Enum.TextXAlignment.Center

            local ButtonDrop2 = Instance.new("TextButton")

            ButtonDrop2.Parent = ListFrame
            ButtonDrop2.Name = "ButtonDrop2"
            ButtonDrop2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonDrop2.Size = UDim2.new(0, 213, 0, 30)
            ButtonDrop2.Font = Enum.Font.SourceSansSemibold
            ButtonDrop2.Text = ""
            ButtonDrop2.TextColor3 = Color3.fromRGB(255, 255, 255)
            ButtonDrop2.TextSize = 13.000
        --   ButtonDrop2.AnchorPoint = Vector2.new(0.5, 0.5)
            ButtonDrop2.Position = UDim2.new(0., 0, 0., 0)
            ButtonDrop2.TextXAlignment = Enum.TextXAlignment.Center
            ButtonDrop2.BackgroundTransparency = 1
            ButtonDrop2.TextWrapped = true
            ButtonDrop2.AutoButtonColor = false
            ButtonDrop2.ClipsDescendants = true

            ButtonDrop2.MouseEnter:Connect(function ()
                TweenService:Create(
                    TextLabel_TapDro2p,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end)

            ButtonDrop2.MouseLeave:Connect(function ()
                TweenService:Create(
                    TextLabel_TapDro2p,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end)

            ButtonDrop2.MouseButton1Click:Connect(function()
                TweenService:Create(
                    DropFrame,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    DropArbt_listimage,
                    TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Rotation = 0}
                ):Play()
                TextLabel_TapDrop.Text =  text.." : "..tostring(v)
                callback(v)
                dog = not dog
            end
        )


            ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
        end


        DropFrame.MouseEnter:Connect(function()
            TweenService:Create(
                DropFrameStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextLabel_TapDrop,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                DropArbt_listimage,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {ImageColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

    DropFrame.MouseLeave:Connect(function()
            TweenService:Create(
                DropFrameStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextLabel_TapDrop,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                DropArbt_listimage,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {ImageColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )


    ButtonDrop.MouseButton1Click:Connect(function()
        if dog == false then
            TweenService:Create(
                DropFrame,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 213, 0, FrameSize)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                DropArbt_listimage,
                TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                {Rotation = -180}
            ):Play()
            ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
        else
            TweenService:Create(
                DropFrame,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                DropArbt_listimage,
                TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                {Rotation = 0}
            ):Play()
            ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
        end
        dog = not dog
    end
)
ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )

    local dropfunc = {}

    function dropfunc:Clear()
        TextLabel_TapDrop.Text = tostring(text).." :"
        for i, v in next, ScolDown:GetChildren() do
            if v:IsA("Frame") then
                v:Destroy()
            end
        end
        ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
    end

    function dropfunc:Add(t)
        local ListFrame = Instance.new("Frame")

        ListFrame.Name = "ListFrame"
        ListFrame.Parent = ScolDown
        ListFrame.BackgroundColor3 =  Color3.fromRGB(22553, 23, 23)-- Color3.fromRGB(249, 53, 139)
        ListFrame.BorderSizePixel = 0
        ListFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        ListFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        ListFrame.Size = UDim2.new(0, 180, 0, 30) -- UDim2.new(0, 213, 0, 35)
        ListFrame.BackgroundTransparency  = 1
        ListFrame.ClipsDescendants = true

        local TextLabel_TapDro2p = Instance.new("TextLabel")

        TextLabel_TapDro2p.Parent = ListFrame
        TextLabel_TapDro2p.Name =  tostring(t).."Dropdown"
        TextLabel_TapDro2p.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_TapDro2p.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextLabel_TapDro2p.Size =  UDim2.new(0, 180, 0, 30)
        TextLabel_TapDro2p.Font = Enum.Font.SourceSansSemibold
        TextLabel_TapDro2p.Text = tostring(t)
        TextLabel_TapDro2p.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_TapDro2p.TextSize = 14.000
        TextLabel_TapDro2p.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel_TapDro2p.BackgroundTransparency = 1
        TextLabel_TapDro2p.TextXAlignment = Enum.TextXAlignment.Center

        local ButtonDrop2 = Instance.new("TextButton")

        ButtonDrop2.Parent = ListFrame
        ButtonDrop2.Name = "ButtonDrop2"
        ButtonDrop2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ButtonDrop2.Size = UDim2.new(0, 213, 0, 30)
        ButtonDrop2.Font = Enum.Font.SourceSansSemibold
        ButtonDrop2.Text = ""
        ButtonDrop2.TextColor3 = Color3.fromRGB(255, 255, 255)
        ButtonDrop2.TextSize = 13.000
    --   ButtonDrop2.AnchorPoint = Vector2.new(0.5, 0.5)
        ButtonDrop2.Position = UDim2.new(0., 0, 0., 0)
        ButtonDrop2.TextXAlignment = Enum.TextXAlignment.Center
        ButtonDrop2.BackgroundTransparency = 1
        ButtonDrop2.TextWrapped = true
        ButtonDrop2.AutoButtonColor = false
        ButtonDrop2.ClipsDescendants = true

        ButtonDrop2.MouseEnter:Connect(function ()
            TweenService:Create(
                TextLabel_TapDro2p,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end)

        ButtonDrop2.MouseLeave:Connect(function ()
            TweenService:Create(
                TextLabel_TapDro2p,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end)

        ButtonDrop2.MouseButton1Click:Connect(function()
            TweenService:Create(
                DropFrame,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                DropArbt_listimage,
                TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                {Rotation = 0}
            ):Play()
            TextLabel_TapDrop.Text =  text.." : "..tostring(t)
            callback(t)
            dog = not dog
        end
    )

        ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
    end
    return dropfunc

else

    local location = option.location or self.flags
    local flag = not use and option.flag or ""
    local callback = callback or function() end
    local list = option.list or {}
    local default = list.default or list[1].Name

    if not use then
        location[flag] = default
    end


    local DropFrame = Instance.new("Frame")

    DropFrame.Name = "DropFrame"
    DropFrame.Parent = ScrollingFrame_Pageframe
    DropFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)-- Color3.fromRGB(249, 53, 139)
    DropFrame.BorderSizePixel = 0
    DropFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    DropFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    DropFrame.Size = UDim2.new(0, 213, 0, 30) -- UDim2.new(0, 213, 0, 35)
    DropFrame.BackgroundTransparency  = 0
    DropFrame.ClipsDescendants = true

    local ConnerDropFrame = Instance.new("UICorner")

    ConnerDropFrame.CornerRadius = UDim.new(0, 4)
    ConnerDropFrame.Name = ""
    ConnerDropFrame.Parent = DropFrame

    local DropFrameStroke = Instance.new("UIStroke")

    DropFrameStroke.Thickness = 1
    DropFrameStroke.Name = ""
    DropFrameStroke.Parent = DropFrame
    DropFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
    DropFrameStroke.Color = Color3.fromRGB(255, 255, 255)
    DropFrameStroke.Transparency = 0.7





    local LabelFrameDrop = Instance.new("TextLabel")

    LabelFrameDrop.Parent = DropFrame
    LabelFrameDrop.Name = "LabelFrameDrop"
    LabelFrameDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LabelFrameDrop.Position = UDim2.new(0., 0, 0., 0)
    LabelFrameDrop.Size =    UDim2.new(0, 213, 0, 30)
    LabelFrameDrop.Font = Enum.Font.SourceSansSemibold
    LabelFrameDrop.Text = ""
    LabelFrameDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
    LabelFrameDrop.TextSize = 14.000
--   LabelFrameDrop.AnchorPoint = Vector2.new(0.5, 0.5)
    LabelFrameDrop.BackgroundTransparency = 1
    LabelFrameDrop.TextXAlignment = Enum.TextXAlignment.Left


    local TextLabel_TapDrop = Instance.new("TextLabel")

    TextLabel_TapDrop.Parent = LabelFrameDrop
    TextLabel_TapDrop.Name = "TextLabel_TapDrop"
    TextLabel_TapDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_TapDrop.Position = UDim2.new(0.04, 0, 0.14, 0)
    TextLabel_TapDrop.Size =    UDim2.new(0, 140, 0, 20)
    TextLabel_TapDrop.Font = Enum.Font.SourceSansSemibold
    TextLabel_TapDrop.Text = tostring(text).." :"
    TextLabel_TapDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
    TextLabel_TapDrop.TextSize = 14.000
--     TextLabel_TapDrop.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_TapDrop.BackgroundTransparency = 1
    TextLabel_TapDrop.TextXAlignment = Enum.TextXAlignment.Left


    local DropArbt_listimage = Instance.new("ImageButton")

    DropArbt_listimage.Parent = LabelFrameDrop
    DropArbt_listimage.BackgroundTransparency = 1.000
    DropArbt_listimage.AnchorPoint = Vector2.new(0.5, 0.5)
    DropArbt_listimage.Position = UDim2.new(0.9, 0, 0.5, 0)
    DropArbt_listimage.BorderSizePixel = 0
    DropArbt_listimage.Size = UDim2.new(0, 25, 0, 25)
    DropArbt_listimage.Image = "http://www.roblox.com/asset/?id=6031091004"
    DropArbt_listimage.ImageColor3 = Color3.fromRGB(155, 155, 155)

    local ScolDown = Instance.new("ScrollingFrame")

    ScolDown.Name = "ScolDown"
    ScolDown.Position = UDim2.new(0.02, 0, 1., 0)
    ScolDown.Parent = LabelFrameDrop
    ScolDown.Active = true
    ScolDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScolDown.BorderSizePixel = 0
    ScolDown.Size = UDim2.new(0, 205, 0, 115)
    ScolDown.ScrollBarThickness = 3
    ScolDown.ClipsDescendants = true
    ScolDown.BackgroundTransparency = 1
    ScolDown.CanvasSize = UDim2.new(0, 0, 0, 2)

    local UIListLayoutlist = Instance.new("UIListLayout")
    local UIPaddinglist = Instance.new("UIPadding")

    UIListLayoutlist.Name = "UIListLayoutlist"
    UIListLayoutlist.Parent = ScolDown
    UIListLayoutlist.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayoutlist.Padding = UDim.new(0, 5)

    UIPaddinglist.Name = "UIPaddinglist"
    UIPaddinglist.Parent = ScolDown
    UIPaddinglist.PaddingTop = UDim.new(0, 5)
    UIPaddinglist.PaddingLeft = UDim.new(0, 12)

    local ButtonDrop = Instance.new("TextButton")

    ButtonDrop.Parent = DropFrame
    ButtonDrop.Name = "ButtonDrop"
    ButtonDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ButtonDrop.Size = UDim2.new(0, 213, 0, 30)
    ButtonDrop.Font = Enum.Font.SourceSansSemibold
    ButtonDrop.Text = ""
    ButtonDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
    ButtonDrop.TextSize = 13.000
--   ButtonDrop.AnchorPoint = Vector2.new(0.5, 0.5)
    ButtonDrop.Position = UDim2.new(0., 0, 0., 0)
    ButtonDrop.TextXAlignment = Enum.TextXAlignment.Center
    ButtonDrop.BackgroundTransparency = 1
    ButtonDrop.TextWrapped = true
    ButtonDrop.AutoButtonColor = false
    ButtonDrop.ClipsDescendants = true

    local dog = false

    local FrameSize = 75
    local cout = 0
    for i , v in pairs(list) do
        cout =cout + 1
        if cout == 1 then
            FrameSize = 75
        elseif cout == 2 then
            FrameSize = 110
        elseif cout >= 3 then
            FrameSize = 150
        end

        local listtog = Instance.new("Frame")

        listtog.Name = "listtog"
        listtog.Parent = ScolDown
        listtog.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
        listtog.BackgroundTransparency =1
        listtog.BorderSizePixel = 0
        listtog.ClipsDescendants = true
        listtog.AnchorPoint = Vector2.new(0.5, 0.5)
        listtog.Position = UDim2.new(0.5, 0, 0.5, 0)
        listtog.Size = UDim2.new(0, 210, 0, 33)


        local listtextbutton = Instance.new("TextButton")

        listtextbutton.Parent = listtog
        listtextbutton.BackgroundTransparency =1
        listtextbutton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        listtextbutton.BorderSizePixel = 0
        listtextbutton.Size =  UDim2.new(0, 210, 0, 33)
        listtextbutton.AutoButtonColor = false
        listtextbutton.Font = Enum.Font.SourceSans
        listtextbutton.Text = " "
        listtextbutton.TextColor3 = Color3.fromRGB(0, 0, 0)
        listtextbutton.TextSize = 14.000

        local farmtoglist = Instance.new("TextButton")

        farmtoglist.Parent = listtextbutton
        farmtoglist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        farmtoglist.BorderColor3 = Color3.fromRGB(255, 255, 255)
        farmtoglist.BorderSizePixel = 0
        farmtoglist.AnchorPoint = Vector2.new(0.5, 0.5)
        farmtoglist.Position = UDim2.new(0.1, 0, 0.5, 0)
        farmtoglist.Size = UDim2.new(0, 23, 0, 23)
        farmtoglist.Font = Enum.Font.SourceSans
        farmtoglist.Text = " "
        farmtoglist.TextColor3 = Color3.fromRGB(0, 0, 0)
        farmtoglist.TextSize = 14.000
        farmtoglist.AutoButtonColor = false


        local farmtoglist2 = Instance.new("TextButton")

        farmtoglist2.Parent = farmtoglist
        farmtoglist2.BackgroundColor3 = Color3.fromRGB(32, 32,32)
        farmtoglist2.BorderColor3 = Color3.fromRGB(255, 255, 255)
        farmtoglist2.BorderSizePixel = 0
        farmtoglist2.AnchorPoint = Vector2.new(0.5, 0.5)
        farmtoglist2.Position = UDim2.new(0.5, 0, 0.5, 0)
        farmtoglist2.Size = UDim2.new(0, 21, 0, 21)
        farmtoglist2.Font = Enum.Font.SourceSans
        farmtoglist2.Text = " "
        farmtoglist2.TextColor3 = Color3.fromRGB(0, 0, 0)
        farmtoglist2.TextSize = 14.000
        farmtoglist2.AutoButtonColor = false


        local listimage = Instance.new("ImageButton")

        listimage.Parent = farmtoglist2
        listimage.BackgroundTransparency = 1.000
        listimage.AnchorPoint = Vector2.new(0.5, 0.5)
        listimage.Position = UDim2.new(0.5, 0, 0.5, 0)
        listimage.BorderSizePixel = 0
        listimage.Size = UDim2.new(0, 0, 0, 0)
        listimage.Image = "http://www.roblox.com/asset/?id=5880482965"


        local textlist = Instance.new("TextLabel")


        textlist.Parent = listtextbutton
        textlist.Name = "textlist"
        textlist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        textlist.BackgroundTransparency = 1.000
        textlist.AnchorPoint = Vector2.new(0.5, 0.5)
        textlist.Position = UDim2.new(0.5, 0, 0.5, 0)
        textlist.BorderSizePixel = 0
        textlist.Size = UDim2.new(0, 91, 0, 25)
        textlist.Font = Enum.Font.GothamSemibold
        textlist.Text = tostring(v.Name)
        textlist.TextColor3 = Color3.fromRGB(255, 255, 255)
        textlist.TextSize = 13.000



        local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 5)
        TextButton_Pageframe_Uiconner2.Name = ""
        TextButton_Pageframe_Uiconner2.Parent = farmtoglist

        local TextButton_Pageframe_Uiconner22 = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner22.CornerRadius = UDim.new(0, 5)
        TextButton_Pageframe_Uiconner22.Name = ""
        TextButton_Pageframe_Uiconner22.Parent = farmtoglist2



        listtextbutton.MouseButton1Click:Connect(function()
            if not  location[v.flag] then
                listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                wait(0.1)
                listimage:TweenSizeAndPosition(UDim2.new(0, 23, 0, 23), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
            else
                listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                wait(0.1)
                listimage:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
            end
            location[v.flag] = not location[v.flag]
            callback(location[v.flag])
        end
    )

    if  location[v.flag] then
        listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
        wait(0.1)
        listimage:TweenSizeAndPosition(UDim2.new(0, 23, 0, 23), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)

        callback(location[v.flag])
    end

        ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
    end


    DropFrame.MouseEnter:Connect(function()
        TweenService:Create(
            DropFrameStroke,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            TextLabel_TapDrop,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            DropArbt_listimage,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {ImageColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
    end
)

DropFrame.MouseLeave:Connect(function()
        TweenService:Create(
            DropFrameStroke,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            TextLabel_TapDrop,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            DropArbt_listimage,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {ImageColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
    end
)


ButtonDrop.MouseButton1Click:Connect(function()
    if dog == false then
        TweenService:Create(
            DropFrame,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 213, 0, FrameSize)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            DropArbt_listimage,
            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
            {Rotation = -180}
        ):Play()
        ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
    else
        TweenService:Create(
            DropFrame,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            DropArbt_listimage,
            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
            {Rotation = 0}
        ):Play()
        ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
    end
    dog = not dog
end
)
ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )



    end



    end

    function items:TextBox(text,text2,callback)
        local TextFrame = Instance.new("Frame")

        TextFrame.Name = "TextFrame"
        TextFrame.Parent = ScrollingFrame_Pageframe
        TextFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)
        TextFrame.BorderSizePixel = 0
        TextFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        TextFrame.Size = UDim2.new(0, 213, 0, 70)
        TextFrame.BackgroundTransparency  = 1
        TextFrame.ClipsDescendants = true

        local LabelNameSliderxd = Instance.new("TextLabel")

        LabelNameSliderxd.Parent = TextFrame
        LabelNameSliderxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelNameSliderxd.BackgroundTransparency = 1
        LabelNameSliderxd.BorderSizePixel = 0
        LabelNameSliderxd.Position = UDim2.new(0.5, 0, 0.2, 0)
        LabelNameSliderxd.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelNameSliderxd.Size = UDim2.new(0, 160, 0, 20)
        LabelNameSliderxd.Font = Enum.Font.GothamBold
        LabelNameSliderxd.Text = tostring(text)
        LabelNameSliderxd.TextColor3 = Color3.fromRGB(155, 155, 155)
        LabelNameSliderxd.TextSize = 11.000
        LabelNameSliderxd.TextXAlignment = Enum.TextXAlignment.Center

        local ConerTextBox = Instance.new("UICorner")

        ConerTextBox.CornerRadius = UDim.new(0, 4)
        ConerTextBox.Name = ""
        ConerTextBox.Parent = TextFrame

        local FrameBox = Instance.new("Frame")

        FrameBox.Name = "TextFrame"
        FrameBox.Parent = TextFrame
        FrameBox.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)
        FrameBox.BorderSizePixel = 0
        FrameBox.Position = UDim2.new(0.5, 0, 0.65, 0)
        FrameBox.AnchorPoint = Vector2.new(0.5, 0.5)
        FrameBox.Size = UDim2.new(0, 158, 0, 30)
        FrameBox.BackgroundTransparency  = 0.2
        FrameBox.ClipsDescendants = true
        FrameBox.AnchorPoint = Vector2.new(0.5, 0.5)

        local TextFrame2 = Instance.new("TextBox")

        TextFrame2.Parent = FrameBox
        TextFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextFrame2.BorderSizePixel = 0
        TextFrame2.ClipsDescendants = true
        TextFrame2.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
        TextFrame2.Size = UDim2.new(0, 158, 0, 35)
        TextFrame2.Font = Enum.Font.GothamSemibold
        TextFrame2.PlaceholderColor3 = Color3.fromRGB(155, 155, 155)
        TextFrame2.PlaceholderText = text2
        TextFrame2.Text = ""
        TextFrame2.TextColor3 = Color3.fromRGB(155, 155, 155)
        TextFrame2.TextSize = 12.000
        TextFrame2.BackgroundTransparency = 1

        local ConerTextBox2 = Instance.new("UICorner")

        ConerTextBox2.CornerRadius = UDim.new(0, 4)
        ConerTextBox2.Name = ""
        ConerTextBox2.Parent = FrameBox

        local TextBoxStroke = Instance.new("UIStroke")

        TextBoxStroke.Thickness = 1
        TextBoxStroke.Name = ""
        TextBoxStroke.Parent = FrameBox
        TextBoxStroke.LineJoinMode = Enum.LineJoinMode.Round
        TextBoxStroke.Color = Color3.fromRGB(255, 255, 255)
        TextBoxStroke.Transparency = 0.7


        TextFrame.MouseEnter:Connect(function()
            TweenService:Create(
                FrameBox,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                FrameBox,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextFrame2,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {PlaceholderColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextFrame2,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                LabelNameSliderxd,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextBoxStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Thickness = 0} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

    TextFrame.MouseLeave:Connect(function()
        TweenService:Create(
            FrameBox,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 158, 0, 30)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            FrameBox,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(23, 23, 23)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            TextFrame2,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {PlaceholderColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            TextBoxStroke,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Thickness = 1} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            LabelNameSliderxd,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            TextFrame2,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
    end
    )
        TextFrame2.FocusLost:Connect(function ()
            if #TextFrame2.Text > 0 then
                pcall(callback,TextFrame2.Text)
            end
        end)
    end

    function items:Bind(text,bi,callback)
        local BindFrame = Instance.new("Frame")

        BindFrame.Name = "BindFrame"
        BindFrame.Parent = ScrollingFrame_Pageframe
        BindFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)
        BindFrame.BorderSizePixel = 0
        BindFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        BindFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        BindFrame.Size = UDim2.new(0, 213, 0, 35)
        BindFrame.BackgroundTransparency  = 0
        BindFrame.ClipsDescendants = true

        local BindConner = Instance.new("UICorner")

        BindConner.CornerRadius = UDim.new(0, 4)
        BindConner.Name = ""
        BindConner.Parent = BindFrame

        local BindStroke = Instance.new("UIStroke")

        BindStroke.Thickness = 1
        BindStroke.Name = ""
        BindStroke.Parent = BindFrame
        BindStroke.LineJoinMode = Enum.LineJoinMode.Round
        BindStroke.Color = Color3.fromRGB(255, 255, 255)
        BindStroke.Transparency = 0.7

        local LabelBind = Instance.new("TextLabel")

        LabelBind.Parent = BindFrame
        LabelBind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelBind.BackgroundTransparency = 1
        LabelBind.BorderSizePixel = 0
        LabelBind.Position = UDim2.new(0.4, 0, 0.5, 0)
        LabelBind.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelBind.Size = UDim2.new(0, 140, 0, 35)
        LabelBind.Font = Enum.Font.GothamBold
        LabelBind.Text = tostring(text)
        LabelBind.TextColor3 = Color3.fromRGB(155, 155, 155)
        LabelBind.TextSize = 11.000
        LabelBind.TextXAlignment = Enum.TextXAlignment.Left

        local key = bi.Name
        local LabelBind2 = Instance.new("TextButton")

        LabelBind2.Parent = BindFrame
        LabelBind2.Name = "LabelBind2"
        LabelBind2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelBind2.Size = UDim2.new(0, 100, 0, 19)
        LabelBind2.Font = Enum.Font.GothamBold
        LabelBind2.Text =  "KEY : "..key
        LabelBind2.TextColor3 = Color3.fromRGB(155, 155, 155)
        LabelBind2.TextSize = 11.000
        LabelBind2.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelBind2.Position = UDim2.new(0.75, 0, 0.5, 0)
        LabelBind2.TextXAlignment = Enum.TextXAlignment.Center
        LabelBind2.BackgroundTransparency = 1
        LabelBind2.TextWrapped = true

        local LabelBind22 = Instance.new("TextButton")

        LabelBind22.Parent = BindFrame
        LabelBind22.Name = "LabelBind22"
        LabelBind22.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelBind22.Size = UDim2.new(0, 213, 0, 35)
        LabelBind22.Font = Enum.Font.GothamBold
        LabelBind22.Text =  ""
        LabelBind22.TextColor3 = Color3.fromRGB(155, 155, 155)
        LabelBind22.TextSize = 11.000
        LabelBind22.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelBind22.Position = UDim2.new(0.5, 0, 0.5, 0)
        LabelBind22.TextXAlignment = Enum.TextXAlignment.Center
        LabelBind22.BackgroundTransparency = 1
        LabelBind22.TextWrapped = true

        BindFrame.MouseEnter:Connect(function()
            TweenService:Create(
                BindStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                LabelBind22,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                LabelBind2,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                LabelBind,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )
        BindFrame.MouseLeave:Connect(function()
            TweenService:Create(
                BindStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                LabelBind22,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                LabelBind2,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                LabelBind,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

        LabelBind22.MouseButton1Click:Connect(function ()


            LabelBind2.Text = "KEY : ".."..."
            local inputwait = game:GetService("UserInputService").InputBegan:wait()
            local fuckulop = inputwait.KeyCode == Enum.KeyCode.Unknown and inputwait.UserInputType or inputwait.KeyCode

            if
            fuckulop.Name ~= "Focus" and fuckulop.Name ~= "MouseMovement" and fuckulop.Name ~= "Focus"
            then
                LabelBind2.Text =  "KEY : "..fuckulop.Name
                key = fuckulop.Name
            end
            -- if fuckulop.Name ~= "Unknown" then
            --     LabelBind2.Text = fuckulop.Name
            --     key = fuckulop.Name
            -- end

        end)


        game:GetService("UserInputService").InputBegan:connect(
            function(current)
                local fuckulop2 = current.KeyCode == Enum.KeyCode.Unknown and current.UserInputType or current.KeyCode

                    if fuckulop2.Name ==  key then
                        pcall(callback)

                end
            end
            )

    end

    function items:Line()
        local LineFrame = Instance.new("Frame")

        LineFrame.Name = "LineFrame"
        LineFrame.Parent = ScrollingFrame_Pageframe
        LineFrame.BackgroundColor3 =  Color3.fromRGB(255, 255, 255)
        LineFrame.BorderSizePixel = 0
        LineFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        LineFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        LineFrame.Size = UDim2.new(0, 213, 0, 1)
        LineFrame.BackgroundTransparency  = 0
        LineFrame.ClipsDescendants = true

        local LineFrame_BindConner = Instance.new("UICorner")

        LineFrame_BindConner.CornerRadius = UDim.new(0, 30)
        LineFrame_BindConner.Name = ""
        LineFrame_BindConner.Parent = LineFrame

    end

    function items:Color(text,preset,callback)
        local Pixker = Instance.new("Frame")

        Pixker.Name = "Pixker"
        Pixker.Parent = ScrollingFrame_Pageframe
        Pixker.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
        Pixker.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
        Pixker.Size = UDim2.new(0, 213, 0, 33)
        Pixker.BackgroundTransparency = 0
        Pixker.BorderSizePixel = 0
        Pixker.AnchorPoint = Vector2.new(0.5, 0.5)
        Pixker.Position = UDim2.new(0.5, 0, 0.5, 0)
        Pixker.ClipsDescendants = true


        local BoxColorCorner2 = Instance.new("UICorner")

        BoxColorCorner2.CornerRadius = UDim.new(0, 4)
        BoxColorCorner2.Name = "BoxColorCorner"
        BoxColorCorner2.Parent = Pixker

        local MheeFrameStroke = Instance.new("UIStroke")

        MheeFrameStroke.Thickness = 1
        MheeFrameStroke.Name = ""
        MheeFrameStroke.Parent = Pixker
        MheeFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
        MheeFrameStroke.Color = Color3.fromRGB(255, 255, 255)
        MheeFrameStroke.Transparency = 0.7


        local TextFrameColor = Instance.new("TextLabel")

        TextFrameColor.Parent = Pixker
        TextFrameColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextFrameColor.BorderSizePixel = 0
        TextFrameColor.Size = UDim2.new(0, 200, 0, 34)
        TextFrameColor.Font = Enum.Font.SourceSans
        TextFrameColor.Text = "  "
        TextFrameColor.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextFrameColor.TextSize = 14.000
        TextFrameColor.BackgroundTransparency = 1
        TextFrameColor.Position = UDim2.new(0., 0, 0., 0)

        local TextReal = Instance.new("TextLabel")

        TextReal.Parent = TextFrameColor
        TextReal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextReal.BorderSizePixel = 0
        TextReal.Size = UDim2.new(0, 140, 0, 34)
        TextReal.Font = Enum.Font.GothamSemibold
        TextReal.Text = text
        TextReal.TextColor3 = Color3.fromRGB(155,155, 155)
        TextReal.TextSize = 12.000
        TextReal.BackgroundTransparency = 1
        TextReal.Position = UDim2.new(0.05, 0, 0., 0)
        TextReal.TextXAlignment = Enum.TextXAlignment.Left

        local BoxColor = Instance.new("Frame")

        BoxColor.Name = "BoxColor"
        BoxColor.Parent = TextFrameColor
        BoxColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        BoxColor.Position = UDim2.new(0.85, 0, 0.5, 0)
        BoxColor.Size = UDim2.new(0, 35, 0, 19)
        BoxColor.AnchorPoint = Vector2.new(0.5, 0.5)

        local BoxColorCorner = Instance.new("UICorner")

        BoxColorCorner.CornerRadius = UDim.new(0, 4)
        BoxColorCorner.Name = "BoxColorCorner"
        BoxColorCorner.Parent = BoxColor

        local TextButton_Dropdown = Instance.new("TextButton")


        TextButton_Dropdown.Parent = TextFrameColor
        TextButton_Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        TextButton_Dropdown.BorderSizePixel = 0
        TextButton_Dropdown.Position = UDim2.new(0., 0, 0.14705883, 0)
        TextButton_Dropdown.Size = UDim2.new(0, 200, 0, 33)
        TextButton_Dropdown.Font = Enum.Font.SourceSans
        TextButton_Dropdown.Text = "  "
        TextButton_Dropdown.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_Dropdown.TextSize = 14.000
        TextButton_Dropdown.AutoButtonColor = false
        --TextButton_Dropdown.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_Dropdown.Position = UDim2.new(0, 0, 0, 0)
        TextButton_Dropdown.BackgroundTransparency = 1



        Pixker.MouseEnter:Connect(function()
            TweenService:Create(
                MheeFrameStroke,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0.}
            ):Play()
            TweenService:Create(
                TextReal,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255,255, 255)}
            ):Play()

        end)
        Pixker.MouseLeave:Connect(function()
            TweenService:Create(
                MheeFrameStroke,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0.7}
            ):Play()
            TweenService:Create(
                TextReal,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155,155, 155)}
            ):Play()
        end)
    -- Rainbow Toggle


    local TextButton_2_Toggle = Instance.new("TextButton")

    TextButton_2_Toggle.Parent = TextFrameColor
    TextButton_2_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
--        TextButton_2_Toggle.BorderColor3 = Color3.fromRGB(249, 53, 139)
    TextButton_2_Toggle.BorderSizePixel = 0
    TextButton_2_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
    TextButton_2_Toggle.Position = UDim2.new(0.2, 0, 1.87, 0)
    TextButton_2_Toggle.Size = UDim2.new(0, 30, 0, 13)
    TextButton_2_Toggle.Font = Enum.Font.SourceSans
    TextButton_2_Toggle.Text = " "
    TextButton_2_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_2_Toggle.TextSize = 12.000
    TextButton_2_Toggle.AutoButtonColor = false

    local TextButton_Pageframe_Uiconner = Instance.new("UICorner")

    TextButton_Pageframe_Uiconner.CornerRadius = UDim.new(0, 30)
    TextButton_Pageframe_Uiconner.Name = ""
    TextButton_Pageframe_Uiconner.Parent = TextButton_2_Toggle

    local TextButton_3_Toggle = Instance.new("TextButton")

    TextButton_3_Toggle.Parent = TextButton_2_Toggle
    TextButton_3_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(249, 53, 139)
    TextButton_3_Toggle.BorderSizePixel = 0
    TextButton_3_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
    TextButton_3_Toggle.Position = UDim2.new(0.1, 0, 0.5, 0)
    TextButton_3_Toggle.Size = UDim2.new(0, 19, 0, 19)
    TextButton_3_Toggle.Font = Enum.Font.SourceSans
    TextButton_3_Toggle.Text = " "
    TextButton_3_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_3_Toggle.TextSize = 12.000
    TextButton_3_Toggle.AutoButtonColor = false

    local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

    TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 30)
    TextButton_Pageframe_Uiconner2.Name = ""
    TextButton_Pageframe_Uiconner2.Parent = TextButton_3_Toggle

    local TextButton_4_Toggle = Instance.new("TextButton")

    TextButton_4_Toggle.Parent = TextButton_3_Toggle
    TextButton_4_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155,155)
--        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(249, 53, 139)
    TextButton_4_Toggle.BorderSizePixel = 0
    TextButton_4_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
    TextButton_4_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
    TextButton_4_Toggle.Size = UDim2.new(0, 27, 0, 27-2)
    TextButton_4_Toggle.Font = Enum.Font.SourceSans
    TextButton_4_Toggle.Text = " "
    TextButton_4_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_4_Toggle.TextSize = 12.000
    TextButton_4_Toggle.AutoButtonColor = false
    TextButton_4_Toggle.BackgroundTransparency = 1
    TextButton_4_Toggle.Visible = true

    local TextButton_Pageframe_Uiconner4 = Instance.new("UICorner")

    TextButton_Pageframe_Uiconner4.CornerRadius = UDim.new(0, 30)
    TextButton_Pageframe_Uiconner4.Name = ""
    TextButton_Pageframe_Uiconner4.Parent = TextButton_4_Toggle


    local TextButton_Toggle = Instance.new("TextButton")

    TextButton_Toggle.Parent = ValueFrame
    TextButton_Toggle.BackgroundTransparency =1
    TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_Toggle.BorderSizePixel = 0
    TextButton_Toggle.Size = UDim2.new(0, 50, 0, 20)
    TextButton_Toggle.AutoButtonColor = false
    TextButton_Toggle.Font = Enum.Font.SourceSans
    TextButton_Toggle.Text = " "
    TextButton_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_Toggle.TextSize = 12.000
    TextButton_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
    TextButton_Toggle.Position = UDim2.new(1.25, 0, 0.4, 0)

    local TextButton_3_Toggle2 = Instance.new("TextLabel")

    TextButton_3_Toggle2.Parent = TextButton_2_Toggle
    TextButton_3_Toggle2.BackgroundColor3 = Color3.fromRGB(32, 32,32)
    TextButton_3_Toggle2.BorderColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_3_Toggle2.BorderSizePixel = 0
    TextButton_3_Toggle2.AnchorPoint = Vector2.new(0.5, 0.5)
    TextButton_3_Toggle2.Position = UDim2.new(1.9, 0, 0.5, 0)
    TextButton_3_Toggle2.Size = UDim2.new(0, 500, 0, 21)
    TextButton_3_Toggle2.Font = Enum.Font.SourceSansBold
    TextButton_3_Toggle2.Text = "Rainbow"
    TextButton_3_Toggle2.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_3_Toggle2.TextSize = 13.000
    TextButton_3_Toggle2.BackgroundTransparency = 1

    local OMF = Instance.new("TextButton")

    OMF.Parent = TextButton_2_Toggle
    OMF.BackgroundTransparency =1
    OMF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    OMF.BorderSizePixel = 0
    OMF.Size = UDim2.new(0, 100, 0, 20)
    OMF.AutoButtonColor = false
    OMF.Font = Enum.Font.SourceSans
    OMF.Text = " "
    OMF.TextColor3 = Color3.fromRGB(0, 0, 0)
    OMF.TextSize = 12.000
    OMF.AnchorPoint = Vector2.new(0.5, 0.5)
    OMF.Position = UDim2.new(1.3, 0, 0.5, 0)

    local Color =  Instance.new("ImageLabel")

    Color.Name = "Color"
    Color.Parent = TextFrameColor
    Color.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Color.Position = UDim2.new(0.05,0,4,0)
    Color.Size = UDim2.new(0, 195, 0, 40)
    Color.ZIndex = 0
    Color.BorderSizePixel = 0
    Color.Image = "rbxassetid://4155801252"

    local ColorFucj = Instance.new("UICorner")

    ColorFucj.CornerRadius = UDim.new(0, 4)
    ColorFucj.Name = ""
    ColorFucj.Parent = Color

    local ColorSelection =  Instance.new("ImageLabel")

    ColorSelection.Name = "ColorSelection"
    ColorSelection.Parent = Color
    ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
    ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ColorSelection.BackgroundTransparency = 1.000
    ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
    ColorSelection.Size = UDim2.new(0, 18, 0, 18)
    ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
    ColorSelection.ScaleType = Enum.ScaleType.Fit
    ColorSelection.Visible = true

    local Hue =  Instance.new("ImageLabel")

    Hue.Name = "Hue2"
    Hue.Parent = TextFrameColor
    Hue.Position = UDim2.new(0.14,0,3,0)
    Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Hue.Size = UDim2.new(0, 160, 0, 25)
    Hue.ZIndex = 0
    Hue.BorderSizePixel = 0

    local ColorFucj2 = Instance.new("UICorner")

    ColorFucj2.CornerRadius = UDim.new(0, 4)
    ColorFucj2.Name = ""
    ColorFucj2.Parent = Hue

    local HueGradient = Instance.new("UIGradient")

    HueGradient.Color = ColorSequence.new {
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
        ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
        ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
        ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
        ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
    }
    HueGradient.Rotation = 0
    HueGradient.Name = "HueGradient"
    HueGradient.Parent = Hue

    local HueSelection =  Instance.new("ImageLabel")

    HueSelection.Name = "HueSelection"
    HueSelection.Parent = Hue
    HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
    HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    HueSelection.BackgroundTransparency = 1.000
    HueSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
    HueSelection.Size = UDim2.new(0, 18, 0, 18)
    HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
    HueSelection.ScaleType = Enum.ScaleType.Fit
    HueSelection.Visible = true


    local BTN_XD = Instance.new("TextButton")

    BTN_XD.Parent = TextFrameColor
    BTN_XD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BTN_XD.BorderColor3 = Color3.fromRGB(255, 255, 255)
    BTN_XD.BorderSizePixel = 0
    BTN_XD.AnchorPoint = Vector2.new(0.5, 0.5)
    BTN_XD.Position = UDim2.new(0.8, 0, 1.9, 0)
    BTN_XD.Size = UDim2.new(0, 50, 0, 25)
    BTN_XD.Font = Enum.Font.GothamSemibold
    BTN_XD.Text = "Confirm"
    BTN_XD.TextColor3 = Color3.fromRGB(255, 255, 255)
    BTN_XD.TextSize = 11.000
    BTN_XD.AutoButtonColor = false

    local BTN_XD_COnner = Instance.new("UICorner")

    BTN_XD_COnner.CornerRadius = UDim.new(0, 4)
    BTN_XD_COnner.Name = ""
    BTN_XD_COnner.Parent = BTN_XD



    local MheeFrameStroke = Instance.new("UIStroke")

    MheeFrameStroke.Thickness = 1
    MheeFrameStroke.Name = ""
    MheeFrameStroke.Parent = BTN_XD
    MheeFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
    MheeFrameStroke.Color = Color3.fromRGB(255, 255, 255)
    MheeFrameStroke.Transparency = 0.7


    local UwU = false


    OMF.MouseButton1Click:Connect(function()
        if       UwU == false  then
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_3_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_2_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
        else
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_3_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_2_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
        end
        UwU = not UwU
    end
)


OMF.MouseEnter:Connect(function()
        TweenService:Create(
            TextButton_4_Toggle,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
        ):Play()
    end
)

OMF.MouseLeave:Connect(function()
        TweenService:Create(
            TextButton_4_Toggle,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
        ):Play()
    end
)

OMF.MouseButton1Down:Connect(
        function()
            RainbowColorPicker = not RainbowColorPicker

            if ColorInput then
                ColorInput:Disconnect()
            end

            if HueInput then
                HueInput:Disconnect()
            end

            if RainbowColorPicker then


                OldToggleColor = BoxColor.BackgroundColor3
                OldColor = Color.BackgroundColor3
                OldColorSelectionPosition = ColorSelection.Position
                OldHueSelectionPosition = HueSelection.Position

                while RainbowColorPicker do
                    BoxColor.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)
                    Color.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)

                    ColorSelection.Position = UDim2.new(1, 0, 0, 0)
                    HueSelection.Position = UDim2.new(0,  Red.HueSelectionPosition, 0.5,0)

                    pcall(callback, BoxColor.BackgroundColor3)
                    wait()
                end
            elseif not RainbowColorPicker then

                BoxColor.BackgroundColor3 = OldToggleColor
                Color.BackgroundColor3 = OldColor

                ColorSelection.Position = OldColorSelectionPosition
                HueSelection.Position = OldHueSelectionPosition

                pcall(callback, BoxColor.BackgroundColor3)
            end
        end
    )
    TextButton_3_Toggle.MouseButton1Down:Connect(
        function()
            RainbowColorPicker = not RainbowColorPicker

            if ColorInput then
                ColorInput:Disconnect()
            end

            if HueInput then
                HueInput:Disconnect()
            end

            if RainbowColorPicker then


                OldToggleColor = BoxColor.BackgroundColor3
                OldColor = Color.BackgroundColor3
                OldColorSelectionPosition = ColorSelection.Position
                OldHueSelectionPosition = HueSelection.Position

                while RainbowColorPicker do
                    BoxColor.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)
                    Color.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)

                    ColorSelection.Position = UDim2.new(1, 0, 0, 0)
                    HueSelection.Position = UDim2.new(0,  Red.HueSelectionPosition, 0.5,0)

                    pcall(callback, BoxColor.BackgroundColor3)
                    wait()
                end
            elseif not RainbowColorPicker then

                BoxColor.BackgroundColor3 = OldToggleColor
                Color.BackgroundColor3 = OldColor

                ColorSelection.Position = OldColorSelectionPosition
                HueSelection.Position = OldHueSelectionPosition

                pcall(callback, BoxColor.BackgroundColor3)
            end
        end
    )


    local function UpdateColorPicker(nope)
        BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
        Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

        pcall(callback, BoxColor.BackgroundColor3)
    end
    ColorH =
    1 -
    (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
        Hue.AbsoluteSize.Y)
    ColorS =
        (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
            Color.AbsoluteSize.X)
    ColorV =
        1 -
        (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
            Color.AbsoluteSize.Y)

    BoxColor.BackgroundColor3 = preset
    Color.BackgroundColor3 = preset
    pcall(callback, BoxColor.BackgroundColor3)

    local RainbowColorPicker = false

    Color.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                if RainbowColorPicker then
                    return
                end

                if ColorInput then
                    ColorInput:Disconnect()
                end

                ColorInput =
                    RunService.RenderStepped:Connect(
                        function()
                        local ColorX =
                            (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                                Color.AbsoluteSize.X)
                        local ColorY =
                            (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                                Color.AbsoluteSize.Y)

                        ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
                        ColorS = ColorX
                        ColorV = 1 - ColorY

                        UpdateColorPicker(true)
                    end
                    )
            end
        end
    )


        Color.InputEnded:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if ColorInput then
                        ColorInput:Disconnect()
                    end
                end
            end
        )

        Hue.InputBegan:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if RainbowColorPicker then
                        return
                    end

                    if HueInput then
                        HueInput:Disconnect()
                    end

                    HueInput =
                        RunService.RenderStepped:Connect(
                            function()
                            local HueY =
                                (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                                    Hue.AbsoluteSize.Y)
                            local HueX =
                                (math.clamp(Mouse.X- Hue.AbsolutePosition.X, 0, Hue.AbsoluteSize.X) /
                                    Hue.AbsoluteSize.X)

                            HueSelection.Position = UDim2.new(HueX, 0, HueY, 0)
                            ColorH = 1 - HueY

                            UpdateColorPicker(true)
                        end
                        )
                end
            end
        )

        Hue.InputEnded:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if HueInput then
                        HueInput:Disconnect()
                    end
                end
            end
        )
        local sk = false
        TextButton_Dropdown.MouseButton1Click:Connect(function()
            if sk == false then
            TweenService:Create(
                Pixker,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 213, 0, 180)}
            ):Play()
        else
            TweenService:Create(
                Pixker,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 213, 0, 33)}
            ):Play()
        end
        sk = not sk
        end
    )
        BTN_XD.MouseButton1Click:Connect(
            function()
                TweenService:Create(
                    Pixker,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 213, 0, 33)}
                ):Play()
                sk = not sk
            end
        )


    end
    function items:Label(text,image)
        if image == nil then
            image = "6031229361"
        end
        local labaelchange = {}
        local LabelFrame = Instance.new("Frame")


        LabelFrame.Name = "Mainframenoti"
        LabelFrame.Parent = ScrollingFrame_Pageframe
        LabelFrame.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
        LabelFrame.BackgroundTransparency = 0
        LabelFrame.BorderSizePixel = 0
        LabelFrame.ClipsDescendants = false
        LabelFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelFrame.Position = UDim2.new(0.498, 0, 0.5, 0)
        LabelFrame.Size = UDim2.new(0, 213, 0, 28)

        local LabelFarm2 = Instance.new("TextLabel")

        LabelFarm2.Parent = LabelFrame
        LabelFarm2.Name = "TextLabel_Tap"
        LabelFarm2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        LabelFarm2.Size = UDim2.new(0, 130, 0,24 )
        LabelFarm2.Font = Enum.Font.SourceSansSemibold
        LabelFarm2.Text = text
        LabelFarm2.TextColor3 = Color3.fromRGB(255, 255, 255)
        LabelFarm2.TextSize = 12.000
        LabelFarm2.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelFarm2.Position = UDim2.new(0.5, 0, 0.5, 0)
        LabelFarm2.TextXAlignment = Enum.TextXAlignment.Center
        LabelFarm2.BackgroundTransparency = 1
        LabelFarm2.TextWrapped = true

        local ImageLabel_gx = Instance.new("ImageLabel")

        ImageLabel_gx.Parent = LabelFrame
        ImageLabel_gx.BackgroundTransparency = 1.000
        ImageLabel_gx.BorderSizePixel = 0
        ImageLabel_gx.Size = UDim2.new(0, 18, 0, 18)
        ImageLabel_gx.AnchorPoint = Vector2.new(0.5, 0.5)
        ImageLabel_gx.Position = UDim2.new(0.06, 0, 0.45, 0)
        ImageLabel_gx.Image = "http://www.roblox.com/asset/?id="..tostring(image)
        ImageLabel_gx.BackgroundTransparency = 1

        local noticore55 = Instance.new("UICorner")

        noticore55.CornerRadius = UDim.new(0, 4)
        noticore55.Name = ""
        noticore55.Parent = LabelFarm2

        local noticore2777 = Instance.new("UICorner")

        noticore2777.CornerRadius = UDim.new(0, 4)
        noticore2777.Name = ""
        noticore2777.Parent = LabelFrame

        local LabelStroke = Instance.new("UIStroke")

        LabelStroke.Thickness = 1
        LabelStroke.Name = ""
        LabelStroke.Parent = LabelFrame
        LabelStroke.LineJoinMode = Enum.LineJoinMode.Round
        LabelStroke.Color = Color3.fromRGB(255, 255, 255)
        LabelStroke.Transparency = 0.7

        LabelFrame.MouseEnter:Connect(function()
            TweenService:Create(
                LabelStroke,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency =0}
            ):Play()
        end
    )
        LabelFrame.MouseLeave:Connect(function()
            TweenService:Create(
                LabelStroke,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency =0.7}
            ):Play()
        end
    )
        function labaelchange:Change(text2)
            LabelFarm2.Text = text2
        end
        return  labaelchange
    end
    return  items
    end
return  page
end
return top
end

wait(1)

Wapon = {}
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
    if v:IsA("Tool") then
        table.insert(Wapon ,v.Name)
    end
end
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
    if v:IsA("Tool") then
        table.insert(Wapon, v.Name)
    end
end

Player_name = {}
--[[for i,v in pairs(game.Players:GetChildren()) do
    if v.Name ~= game.Players.LocalPlayer.Name then
        table.insert(Player_name ,v.Name)
    end
end]]
for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
    if v.Name ~= game.Players.LocalPlayer.Name then
        table.insert(Player_name ,v.Name)
    end
end

function TP(CFgo)
    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
        local CP = game:GetService("Players").LocalPlayer.Character
        local LPos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
        local tween_s = game:service"TweenService"
        local LP = game.Players.LocalPlayer
        local tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/320, Enum.EasingStyle.Linear), {CFrame = CFgo})
        tween:Play()
        if not tween then
            return tween
        end
    end
end

function TP2(CFgo)
    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
        if (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude < 150 then
            pcall(function()
                game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = CFgo
                return
            end)
        end
        local CP = game:GetService("Players").LocalPlayer.Character
        local LPos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
        local tween_s = game:service"TweenService"
        local LP = game.Players.LocalPlayer
        local tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/400, Enum.EasingStyle.Linear), {CFrame = CFgo})
        tween:Play()
        if not tween then
            return tween
        end
    end
end
-------UI System---------
local ui = create:Win("Locker Hub ( ViP ) By z???z????????s????#4134")
local Tap1 = ui:Taps("Auto Farm")
local page1 = Tap1:newpage()

page1:Label("Function Reset",0)

page1:Button("Reset System All", function()
    pcall(function()
    create:Notifile("System", "Please Wait", 5)
    wait(.5)
    create:Notifile("System", "Anchored = false", 2)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    wait(.5)
    create:Notifile("System", "Break Character", 2)
    game.Players.LocalPlayer.Character:BreakJoints()
    wait(.5)
    create:Notifile("System", "Reset Tween", 2)
    TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    wait(.5)
    create:Notifile("System", "Please wait. All systems are shutting down.", 5)
    wait(.5)
    Reset()
    end)
end)

function Reset(s)
    getgenv().Fastattack = false
    SF015 = false
    FTAK_1x = false
    wait(.1)
    tTp = false
    PTP = false
    PTPp = 30
    wait(.1)
    Noclip = false
    Player_Select = nil
    atoMoB = false
    AutoReMob = false
    _G.SetSpawn = false
    _G.Magnet = false
    AutoHaki = false
    Auto_Farm = false
end

page1:Line()

page1:Button("Reset Character", function()
    game.Players.LocalPlayer.Character:BreakJoints()
end)

page1:Button("Reset Movement", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
end)

page1:Button("Reset System Tween", function()
    wait(.5)
    TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
end)

page1:Label("Auto Farm Misc", 0)

page1:Button("Redeem Code 2xExp", function()
   	function UseCode(Text)
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
    end
    UseCode("Starcodeheo")
    UseCode("Magicbus")
    UseCode("Enyu_is_Pro")
    UseCode("Sub2Fer999")
    UseCode("Bluxxy")
    UseCode("JCWK")
    UseCode("3BVISITS")
    UseCode("UPD16")
    UseCode("SUB2GAMERROBOT_EXP1")
    UseCode("StrawHatMaine")
    UseCode("Sub2OfficialNoobie")
    UseCode("THEGREATACE")
    UseCode("TantaiGaming")
    UseCode("Axiore")
    UseCode("SUB2NOOBMASTER123")
    UseCode("Sub2Daigrock") 
end)

page1:Label("Set Fps Setting",0)

function BeautifulMode()
	_G.LightMode = true
	if game:GetService("Lighting"):FindFirstChild("BloomEffect") then
		game:GetService("Lighting"):FindFirstChild("BloomEffect"):Destroy()
	end
	if game:GetService("Lighting"):FindFirstChild("ColorCorrectionEffect") then
		game:GetService("Lighting"):FindFirstChild("ColorCorrectionEffect"):Destroy()
	end
	if game:GetService("Lighting"):FindFirstChild("DepthOfFieldEffect") then
		game:GetService("Lighting"):FindFirstChild("DepthOfFieldEffect"):Destroy()
	end
	if game:GetService("Lighting"):FindFirstChild("ColorCorrectionEffect") then
		game:GetService("Lighting"):FindFirstChild("ColorCorrectionEffect"):Destroy()
	end
	if game:GetService("Lighting"):FindFirstChild("ColorCorrectionEffect2") then
		game:GetService("Lighting"):FindFirstChild("ColorCorrectionEffect2"):Destroy()
	end
	if game:GetService("Lighting"):FindFirstChild("SunRaysEffect") then
		game:GetService("Lighting"):FindFirstChild("SunRaysEffect"):Destroy()
	end
	local a = game.Lighting
	a.Ambient = Color3.fromRGB(31, 31, 31)
	a.Brightness = 0.7
	a.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
	a.ColorShift_Top = Color3.fromRGB(255, 102, 31)
	a.EnvironmentDiffuseScale = 0.205
	a.EnvironmentSpecularScale = 0.522
	a.GlobalShadows = true
	a.OutdoorAmbient = Color3.fromRGB(67, 67, 67)
	a.ShadowSoftness = 0.5
	a.GeographicLatitude = -15.525
	a.ExposureCompensation = 0.75
	local b = Instance.new("BloomEffect", a)
	b.Name = "BloomEffect"
	b.Enabled = true
	b.Intensity = 0.04
	b.Size = 1900
	b.Threshold = 0.915
	local c = Instance.new("ColorCorrectionEffect", a)
	c.Name = "ColorCorrectionEffect"
	c.Brightness = 0.176
	c.Contrast = 0.39
	c.Enabled = true
	c.Saturation = 0.2
	c.TintColor = Color3.fromRGB(255, 227, 128)
	local d = Instance.new("DepthOfFieldEffect", a)
	d.Name = "DepthOfFieldEffect"
	d.Enabled = true
	d.FarIntensity = 0.077
	d.FocusDistance = 21.54
	d.InFocusRadius = 20.77
	d.NearIntensity = 0.277
	local e = Instance.new("ColorCorrectionEffect", a)
	e.Name = "ColorCorrectionEffect"
	e.Brightness = 0.3
	e.Contrast = -0.07
	e.Saturation = 0
	e.Enabled = true
	e.TintColor = Color3.fromRGB(255, 247, 239)
	local e2 = Instance.new("ColorCorrectionEffect", a)
	e2.Name = "ColorCorrectionEffect2"
	e2.Brightness = 0.1
	e2.Contrast = 0.45
	e2.Saturation = -0.1
	e2.Enabled = true
	e2.TintColor = Color3.fromRGB(167, 167, 167)
	local s = Instance.new("SunRaysEffect", a)
	s.Name = "SunRaysEffect"
	s.Enabled = true
	s.Intensity = 0.01
	s.Spread = 0.146
end

page1:Button("Fps Boost", function()
   	local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end)

page1:Button("Beautiful Mode", function()
    BeautifulMode()
end)

page1:Button("SetFps ( Unlock )", function()
    pcall(setfpscap, 99999)
end)

local page2 = Tap1:newpage()

page2:Label("Auto Farm Setting",0);

Auto_Join_With_Roblox_Prompt = true
page2:Toggle("Auto Rejoin", Auto_Join_With_Roblox_Prompt, function(a2)
    Auto_Join_With_Roblox_Prompt = a2
end)

pcall(function()
    if wat == nil or 0 or "" then
        wat = 0.15
    end
end)

pcall(function()
    if hitboxUp == nil or 0 or "" then
        hitboxUp = 60
    end
end)

page2:Drop("Delay FastAttack ", false, {0,0.05,0.1,0.15,0.20,0.25}, function(Value)
    wat = Value
end)

page2:Drop("Hitbox ", false, {30, 60}, function(Value)
    hitboxUp = Value
end)

stayattack = true
page2:Toggle("StayAttack ", stayattack, function(Value)
    stayattack = Value
end)

getgenv().Fastattack = false
page2:Toggle("Fast Attack ( Idled )", getgenv().Fastattack, function(a2)
    getgenv().Fastattack = a2
end)

SF015 = false
page2:Toggle("Fast Attack", SF015, function(a2)
    SF015 = a2
end)

game:GetService("ReplicatedStorage").Util.Sound.Storage.Ope.RadioKnife.SwordSwing:Destroy()
game:GetService("ReplicatedStorage").Util.Sound.Storage.Swing:Destroy()
game:GetService("ReplicatedStorage").Util.Sound.Storage.Lazy.Hit1:Destroy()
page2:Toggle("Auto Farm Lv", false, function(auto)
    _G.AutoFarmLevel = auto
	if _G.AutoFarmLevel and SelectToolWeapon == nil then
        create:Notifile("Farm Level","Select Weapon plsss",5)
	else
        AutoReMob = false
        _G.SetSpawn = auto
        _G.Magnet = auto
        AutoHaki = auto
        Auto_Farm = auto
        if auto == false then
            wait(0.5)
            FTAK_1x = false
            AutoReMob = true
            TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end
end)

page2:Toggle("Auto Kaiton", false, function(auto)
    _G.AutoKaiton = auto
	if _G.AutoKaiton and SelectToolWeapon == nil then
        create:Notifile("Kaiton","Select Weapon plsss",5)
    else
        _G.SetSpawn = auto
        _G.Magnet = auto
        AutoHaki = auto
        Auto_Farm = auto
        AutoNew = auto
        RedeemCode2exp = auto
        autobuya = auto
        if auto == false then
            wait(0.5)
            FTAK_1x = false
            TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end
end)

local SelectWeapon = page2:Drop("SelectWeapon", false, Wapon,function(Value)
    SelectToolWeapon = Value
    SelectToolWeaponOld = Value
end)

page2:Button("Refresh Weapon",function()
    SelectWeapon:Clear()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
        if v:IsA("Tool") then
            SelectWeapon:Add(v.Name)
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            SelectWeapon:Add(v.Name)
        end
    end
end)

page2:Label("Function More",0);
if ThreeWorld or NewWorld then
    page2:Toggle("Auto Kill 500 Mob", false, function(auto)
        a1 = auto
        if a1 and SelectToolWeapon == nil then
            create:Notifile("Farm","Select Weapon",5)
        else            
            TP(CFrame.new(-1927.83056640625, 38.360443115234375, -12842.0908203125))
            _G.Magnet = auto
            AutoHaki = auto 
            atoMoB = auto
            if auto == false then
                wait(.5)
                FTAK_1x = false
                FTAK_1Ato = false
                TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
            end
        end
    end)
end

if not ThreeWorld or NewWorld then
    page2:Toggle("Auto NewWorld", false, function(auto)
        AutoNew = auto
        if auto == false then
            FTAK_1x = false
            wait(.5)
            TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end)
end

page2:Toggle("Auto Buy Abilities", false, function(t)
    while t do wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
    end
end)

local Tap2 = ui:Taps("Stats")
local page3 = Tap2:newpage()
page3:Label("Set Stats", 0)

page3:Toggle("Auto Stats Kaiton", false, function(p)
    _G.AutoStat = p
end)

page3:Toggle("Auto Melee", false, function(v)
    melee = v
end)

page3:Toggle("Auto Defense", false, function(v)
    def = v
end)

page3:Toggle("Auto Sword", false, function(v)
    sword = v
end)

page3:Toggle("Auto Gun", false, function(v)
    gun = v
end)

page3:Toggle("Auto DevilFruit", false, function(v)
    DevilFruit = v
end)

local page4 = Tap2:newpage()

page4:Toggle("Use Code Reset", false, function(a1)
    SCR = a1
    wait(.1)
    while a1 do wait(.1)
        if SCR then
            function UseCodeReset(Text)
                game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
            end
        end
    end
end)

page4:Drop("Select Code Reset", false, {"RESET_5B", "SUB2GAMERROBOT_RESET1", "SUB2UNCLEKIZARU"}, function(Value)
    UseCodeReset(Value)
end)

local Tap3 = ui:Taps("Function")
local page5 = Tap3:newpage()
page5:Label("Function Auto",0)

page5:Toggle("Auto Order", false, function(p1)
    Auto_Order = p1
    AutoHaki = p1
    if p1 == false then
        wait(.5)
        FTAK_1x = false
        TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end
end)

page5:Toggle("Auto Bone", Auto_Bone, function(ap1)
    Auto_Bone = ap1
    _G.Magnet = ap1
    AutoHaki = ap1
    if ap1 == false then
        wait(.5)
        FTAK_1x = false
        TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end
end)

page5:Toggle("Auto Scrap Metal", false, function(p1)
    Auto_Give_Scrap_Metal = p1
end)

page5:Toggle("Auto SuperHuman", false, function(p1)
    Superhuman = p1
end)

page5:Toggle("AutoBuySurprise", false, function(p1)
    AutoBuySurprise = p1
end)

page5:Toggle("Auto DeathStep", false, function(p1)
    DeathStep = p1
end)

local page6 = Tap3:newpage()
page6:Label("Function TP",0)

if OldWorld then
    ReTP = {
        "Jones Salad",
        "Marine1",
        "Marine2",
        "Midle Town",
        "Jungle",
        "Pirate Village",
        "Desert",
        "Frozen Village",
        "Colosseum",
        "Prison",
        "Mob Leader",
        "Magma Village",
        "UnderWater Gate",
        "UnderWater City",
        "Fountain City",
        "Sky1",
        "Sky2",
        "Sky3"
    }
elseif NewWorld then
    ReTP = {
        "Dock",
        "Mansion",
        "Kingdom Of Rose",
        "Cafe",
        "Sunflower Field",
        "Jeramy Mountain",
        "Colossuem",
        "Factory",
        "The Bridge",
        "Green Bit",
        "Graveyard",
        "Dark Area",
        "Snow Mountain",
        "Hot Island",
        "Cold Island",
        "Ice Castle",
        "Usopp's Island",
        "inscription Island",
        "Forgotten Island",
        "Ghost Ship",
    }
elseif ThreeWorld then
    ReTP = {
        "Port Town",
        "Hydra Island",
        "Gaint Tree",
        "Mansion",
        "Castle on the Sea",
        "Graveyard Island",
        "Icecream Island",
        "Peanut Island",
        "Lab",
        "Dummy"
    }
end

page6:Line()

local TPdrop = page6:Drop("Select Teleport", false, ReTP,function(Value)
    TweenNameMap = Value
end)

page6:Line()

page6:Bind("Stop TP Key", Enum.KeyCode.Home, function()
    tTp = false
    wait(.5)
    TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
end)

page6:Line()

page6:Toggle("Teleport", false, function(v)
    tTp = v
    if v == false then
        wait(.5)
        tTp = false
        TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end
end)

page6:Line()

local TPPlayer = page6:Drop("Select Player", false, Player_name, function(bool)
    Player_Select = bool
end)

page6:Drop("Select CFrame", false, {30, 60, 120, 200}, function(v)
    PTPp = v
end)

page6:Toggle("Teleport Player", false, function(v)
        PTP = v
        Noclip = true
    if v == false then
        wait(.5)
        Noclip = false
        TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end
end)

page6:Toggle("Spectate Player", false, function(bool)
    Sp = bool
    local plr1 = game.Players.LocalPlayer.Character.Humanoid
    local plr2 = game.Players:FindFirstChild(Player_Select)
    repeat wait(.1)
        game.Workspace.Camera.CameraSubject = plr2.Character.Humanoid
    until Sp == false 
    game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
end)

spawn(function()
    while wait() do
        if PTP then
            pcall(function()
                local p2 = game.Players:FindFirstChild(Player_Select)
                TP(p2.Character.HumanoidRootPart.CFrame * CFrame.new(0, PTPp, 0))
            end)
        end
    end
end)

page6:Button("Refresh Player", function()
    Player_name = {}
    TPPlayer:Clear()
    for i,v in pairs(game.Players:GetChildren()) do
		if v.Name ~= game.Players.LocalPlayer.Name then
	        TPPlayer:Add(v.Name)
		end
    end
end)

page6:Toggle("Aimbot Skill", false, function(vu)
	AimSkillNearest = vu
end)

--[[spawn(function()
	while wait() do
		pcall(function()
			local MaxDistance = 500
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v.Name ~= game.Players.LocalPlayer.Name then
					local Distance = v:DistanceFromCharacter(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
					if Distance < MaxDistance then
						MaxDistance = Distance
						TargetPlayerAim = v.Name
					end
				end
			end
		end)
	end
end)]]

spawn(function()
	pcall(function()
		game:GetService("RunService").Stepped:connect(function()
            pcall(function()
                if AimSkillNearest and Player_Select ~= nil and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name]:FindFirstChild("MousePos") then
                    local args = {
                        [1] = game:GetService("Players"):FindFirstChild(Player_Select).Character.HumanoidRootPart.Position
                    }
                    game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                end
            end)
		end)
	end)
end)

local Tap4 = ui:Taps("Store")
local page7 = Tap4:newpage()
page7:Label("Function Buy",0)

page7:Button("Refund Stat [2500 F]", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
end)

page7:Button("Reroll Race [3000 F]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
end)
page7:Button("Buy Random Devil Fruit", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
end)

page7:Toggle("Auto Buy Random Devil Fruit", false, function(v)
    DevilAuto = v
end)

function CheckLevel()
    local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
    if OldWorld then
        if Lv == 1 or Lv <= 149 or SelectMonster == "Shanda [Lv. 475]" then -- Shanda
            Ms = "Shanda [Lv. 475]"
            NameMon = "Shanda"
            CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
            CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
			end
        elseif Lv == 150 or Lv <= 174 or SelectMonster == "Sky Bandit [Lv. 150]" then -- Sky Bandit
            Ms = "Sky Bandit [Lv. 150]"
            NameQuest = "SkyQuest"
            QuestLv = 1
            NameMon = "Sky Bandit"
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
        elseif Lv == 175 or Lv <= 249 or SelectMonster == "Dark Master [Lv. 175]" then -- Dark Master
            Ms = "Dark Master [Lv. 175]"
            NameQuest = "SkyQuest"
            QuestLv = 2
            NameMon = "Dark Master"
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
        elseif Lv == 250 or Lv <= 274 or SelectMonster == "Toga Warrior [Lv. 250]" then -- Toga Warrior
            Ms = "Toga Warrior [Lv. 250]"
            NameQuest = "ColosseumQuest"
            QuestLv = 1
            NameMon = "Toga Warrior"
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
        elseif Lv == 275 or Lv <= 299 or SelectMonster == "Gladiator [Lv. 275]" then -- Gladiator
            Ms = "Gladiator [Lv. 275]"
            NameQuest = "ColosseumQuest"
            QuestLv = 2
            NameMon = "Gladiator"
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1270.7352294921875, 7.567874908447266, -3275.294189453125)
        elseif Lv == 300 or Lv <= 324 or SelectMonster == "Military Soldier [Lv. 300]" then -- Military Soldier
            Ms = "Military Soldier [Lv. 300]"
            NameQuest = "MagmaQuest"
            QuestLv = 1
            NameMon = "Military Soldier"
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5481.966796875, 9.47974967956543, 8533.9453125)
        elseif Lv == 325 or Lv <= 374 or SelectMonster == "Military Spy [Lv. 325]" then -- Military Spy
            Ms = "Military Spy [Lv. 325]"
            NameQuest = "MagmaQuest"
            QuestLv = 2
            NameMon = "Military Spy"
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5984.0532226563, 82.14656829834, 8753.326171875)
        elseif Lv == 375 or Lv <= 399 or SelectMonster == "Fishman Warrior [Lv. 375]" then -- Fishman Warrior 
            Ms = "Fishman Warrior [Lv. 375]"
            NameQuest = "FishmanQuest"
            QuestLv = 1
            NameMon = "Fishman Warrior"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60924.0625, 18.6081485748291, 1499.62158203125)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
			end
        elseif Lv == 400 or Lv <= 449 or SelectMonster == "Fishman Commando [Lv. 400]" then -- Fishman Commando
            Ms = "Fishman Commando [Lv. 400]"
            NameQuest = "FishmanQuest"
            QuestLv = 2
            NameMon = "Fishman Commando"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
			end
        elseif Lv == 450 or Lv <= 474 or SelectMonster == "God's Guard [Lv. 450]" then -- God's Guard
            Ms = "God's Guard [Lv. 450]"
            NameQuest = "SkyExp1Quest"
            QuestLv = 1
            NameMon = "God's Guard"
            CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
            CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
			end
        elseif Lv == 475 or Lv <= 524 or SelectMonster == "Shanda [Lv. 475]" then -- Shanda
            Ms = "Shanda [Lv. 475]"
            NameQuest = "SkyExp1Quest"
            QuestLv = 2
            NameMon = "Shanda"
            CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
            CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
			end
        elseif Lv == 525 or Lv <= 549 or SelectMonster == "Royal Squad [Lv. 525]" then -- Royal Squad
            Ms = "Royal Squad [Lv. 525]"
            NameQuest = "SkyExp2Quest"
            QuestLv = 1
            NameMon = "Royal Squad"
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
        elseif Lv == 550 or Lv <= 624 or SelectMonster == "Royal Soldier [Lv. 550]" then -- Royal Soldier
            Ms = "Royal Soldier [Lv. 550]"
            NameQuest = "SkyExp2Quest"
            QuestLv = 2
            NameMon = "Royal Soldier"
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
        elseif Lv == 625 or Lv <= 649 or SelectMonster == "Galley Pirate [Lv. 625]" then -- Galley Pirate
            Ms = "Galley Pirate [Lv. 625]"
            NameQuest = "FountainQuest"
            QuestLv = 1
            NameMon = "Galley Pirate"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
        elseif Lv >= 650 or SelectMonster == "Galley Captain [Lv. 650]" then -- Galley Captain
            Ms = "Galley Captain [Lv. 650]"
            NameQuest = "FountainQuest"
            QuestLv = 2
            NameMon = "Galley Captain"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
        end
    end
    if NewWorld then
        if Lv == 700 or Lv <= 724 or SelectMonster == "Raider [Lv. 700]" then -- Raider
            Ms = "Raider [Lv. 700]"
            NameQuest = "Area1Quest"
            QuestLv = 1
            NameMon = "Raider"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
			CFrameMon = CFrame.new(-750.0274658203125, 39.265113830566406, 2375.60400390625)
        elseif Lv == 725 or Lv <= 774 or SelectMonster == "Mercenary [Lv. 725]" then -- Mercenary
            Ms = "Mercenary [Lv. 725]"
            NameQuest = "Area1Quest"
            QuestLv = 2
            NameMon = "Mercenary"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(-973.1364135742188, 73.25519561767578, 1399.2318115234375)
        elseif Lv == 775 or Lv <= 799 or SelectMonster == "Swan Pirate [Lv. 775]" then -- Swan Pirate
            Ms = "Swan Pirate [Lv. 775]"
            NameQuest = "Area2Quest"
            QuestLv = 1
            NameMon = "Swan Pirate"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(969.056396484375, 136.31959533691406, 1231.5203857421875)
        elseif Lv == 800 or Lv <= 874 or SelectMonster == "Factory Staff [Lv. 800]" then -- Factory Staff
            Ms = "Factory Staff [Lv. 800]"
            NameQuest = "Area2Quest"
            QuestLv = 2
            NameMon = "Factory Staff"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
			if raMon == 1 then
				CFrameMon = CFrame.new(661.5947265625, 73.08507537841797, 34.038272857666016)
			elseif raMon == 2 then
				CFrameMon = CFrame.new(-241.59727478027344, 73.0850830078125, -448.80029296875)
            end
        elseif Lv == 875 or Lv <= 899 or SelectMonster == "Marine Lieutenant [Lv. 875]" then -- Marine Lieutenant
            Ms = "Marine Lieutenant [Lv. 875]"
            NameQuest = "MarineQuest3"
            QuestLv = 1
            NameMon = "Marine Lieutenant"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2881.047119140625, 73.20455169677734, -2985.87939453125)
        elseif Lv == 900 or Lv <= 949 or SelectMonster == "Marine Captain [Lv. 900]" then -- Marine Captain
            Ms = "Marine Captain [Lv. 900]"
            NameQuest = "MarineQuest3"
            QuestLv = 2
            NameMon = "Marine Captain"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-1913.3197021484375, 73.2123031616211, -3332.065185546875)
        elseif Lv == 950 or Lv <= 974 or SelectMonster == "Zombie [Lv. 950]" then -- Zombie
            Ms = "Zombie [Lv. 950]"
            NameQuest = "ZombieQuest"
            QuestLv = 1
            NameMon = "Zombie"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
        elseif Lv == 975 or Lv <= 999 or SelectMonster == "Vampire [Lv. 975]" then -- Vampire
            Ms = "Vampire [Lv. 975]"
            NameQuest = "ZombieQuest"
            QuestLv = 2
            NameMon = "Vampire"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-6020.2216796875, 6.528029441833496, -1280.1217041015625)
        elseif Lv == 1000 or Lv <= 1049 or SelectMonster == "Snow Trooper [Lv. 1000]" then -- Snow Trooper
            Ms = "Snow Trooper [Lv. 1000]"
            NameQuest = "SnowMountainQuest"
            QuestLv = 1
            NameMon = "Snow Trooper"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
        elseif Lv == 1050 or Lv <= 1099 or SelectMonster == "Winter Warrior [Lv. 1050]" then -- Winter Warrior
            Ms = "Winter Warrior [Lv. 1050]"
            NameQuest = "SnowMountainQuest"
            QuestLv = 2
            NameMon = "Winter Warrior"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
        elseif Lv == 1100 or Lv <= 1124 or SelectMonster == "Lab Subordinate [Lv. 1100]" then -- Lab Subordinate
            Ms = "Lab Subordinate [Lv. 1100]"
            NameQuest = "IceSideQuest"
            QuestLv = 1
            NameMon = "Lab Subordinate"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-5778.29833984375, 42.52165222167969, -4481.79443359375)
        elseif Lv == 1125 or Lv <= 1174 or SelectMonster == "Horned Warrior [Lv. 1125]" then -- Horned Warrior
            Ms = "Horned Warrior [Lv. 1125]"
            NameQuest = "IceSideQuest"
            QuestLv = 2
            NameMon = "Horned Warrior"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-6466.01611328125, 15.97756290435791, -5667.28857421875)
        elseif Lv == 1175 or Lv <= 1199 or SelectMonster == "Magma Ninja [Lv. 1175]" then -- Magma Ninja
            Ms = "Magma Ninja [Lv. 1175]"
            NameQuest = "FireSideQuest"
            QuestLv = 1
            NameMon = "Magma Ninja"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
        elseif Lv == 1200 or Lv <= 1249 or SelectMonster == "Lava Pirate [Lv. 1200]" then -- Lava Pirate
            Ms = "Lava Pirate [Lv. 1200]"
            NameQuest = "FireSideQuest"
            QuestLv = 2
            NameMon = "Lava Pirate"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
        elseif Lv == 1250 or Lv <= 1274 or SelectMonster == "Ship Deckhand [Lv. 1250]" then -- Ship Deckhand
            Ms = "Ship Deckhand [Lv. 1250]"
            NameQuest = "ShipQuest1"
            QuestLv = 1
            NameMon = "Ship Deckhand"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
        elseif Lv == 1275 or Lv <= 1299 or SelectMonster == "Ship Engineer [Lv. 1275]" then -- Ship Engineer
            Ms = "Ship Engineer [Lv. 1275]"
            NameQuest = "ShipQuest1"
            QuestLv = 2
            NameMon = "Ship Engineer"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
        elseif Lv == 1300 or Lv <= 1324 or SelectMonster == "Ship Steward [Lv. 1300]" then -- Ship Steward
            Ms = "Ship Steward [Lv. 1300]"
            NameQuest = "ShipQuest2"
            QuestLv = 1
            NameMon = "Ship Steward"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
        elseif Lv == 1325 or Lv <= 1349 or SelectMonster == "Ship Officer [Lv. 1325]" then -- Ship Officer
            Ms = "Ship Officer [Lv. 1325]"
            NameQuest = "ShipQuest2"
            QuestLv = 2
            NameMon = "Ship Officer"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
        elseif Lv == 1350 or Lv <= 1374 or SelectMonster == "Arctic Warrior [Lv. 1350]" then -- Arctic Warrior
            Ms = "Arctic Warrior [Lv. 1350]"
            NameQuest = "FrostQuest"
            QuestLv = 1
            NameMon = "Arctic Warrior"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
			end
        elseif Lv == 1375 or Lv <= 1424 or SelectMonster == "Snow Lurker [Lv. 1375]" then -- Snow Lurker
            Ms = "Snow Lurker [Lv. 1375]"
            NameQuest = "FrostQuest"
            QuestLv = 2
            NameMon = "Snow Lurker"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
        elseif Lv == 1425 or Lv <= 1449 or SelectMonster == "Sea Soldier [Lv. 1425]" then -- Sea Soldier
            Ms = "Sea Soldier [Lv. 1425]"
            NameQuest = "ForgottenQuest"
            QuestLv = 1
            NameMon = "Sea Soldier"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
        elseif Lv >= 1450 or SelectMonster == "Water Fighter [Lv. 1450]" then -- Water Fighter
            Ms = "Water Fighter [Lv. 1450]"
            NameQuest = "ForgottenQuest"
            QuestLv = 2
            NameMon = "Water Fighter"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3436.071044921875, 290.5218200683594, -10503.736328125)
		end
	end
	if ThreeWorld then
		if Lv == 1500 or Lv <= 1524 or SelectMonster == "Pirate Millionaire [Lv. 1500]" then -- Pirate Millionaire
			Ms = "Pirate Millionaire [Lv. 1500]"
			NameQuest = "PiratePortQuest"
			QuestLv = 1
			NameMon = "Pirate Millionaire"
			CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
			CFrameMon = CFrame.new(-302.28338623046875, 57.51716232299805, 5615.92919921875)
		elseif Lv == 1525 or Lv <= 1574 or SelectMonster == "Pistol Billionaire [Lv. 1525]" then -- Pistol Billoonaire
			Ms = "Pistol Billionaire [Lv. 1525]"
			NameQuest = "PiratePortQuest"
			QuestLv = 2
			NameMon = "Pistol Billionaire"
			CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
			CFrameMon = CFrame.new(-635.3514404296875, 111.48406982421875, 5952.5869140625)
		elseif Lv == 1575 or Lv <= 1599 or SelectMonster == "Dragon Crew Warrior [Lv. 1575]" then -- Dragon Crew Warrior
			Ms = "Dragon Crew Warrior [Lv. 1575]"
			NameQuest = "AmazonQuest"
			QuestLv = 1
			NameMon = "Dragon Crew Warrior"
			CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
			CFrameMon = CFrame.new(6506.54345703125, 113.297119140625, -957.8739624023438)
		elseif Lv == 1600 or Lv <= 1624 or SelectMonster == "Dragon Crew Archer [Lv. 1600]" then -- Dragon Crew Archer
			Ms = "Dragon Crew Archer [Lv. 1600]"
			NameQuest = "AmazonQuest"
			QuestLv = 2
			NameMon = "Dragon Crew Archer"
			CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
			CFrameMon = CFrame.new(6716.9052734375, 430.8106384277344, 111.39741516113281)
		elseif Lv == 1625 or Lv <= 1649 or SelectMonster == "Female Islander [Lv. 1625]" then -- Female Islander
			Ms = "Female Islander [Lv. 1625]"
			NameQuest = "AmazonQuest2"
			QuestLv = 1
			NameMon = "Female Islander"
			CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
			CFrameMon = CFrame.new(4662.99951171875, 735.8788452148438, 676.922119140625)
		elseif Lv == 1650 or Lv <= 1699 or SelectMonster == "Giant Islander [Lv. 1650]" then -- Giant Islander
			Ms = "Giant Islander [Lv. 1650]"
			NameQuest = "AmazonQuest2"
			QuestLv = 2
			NameMon = "Giant Islander"
			CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
			CFrameMon = CFrame.new(5009.5068359375, 664.11071777344, -40.960144042969)
		elseif Lv == 1700 or Lv <= 1724 or SelectMonster == "Marine Commodore [Lv. 1700]" then -- Marine Commodore
			Ms = "Marine Commodore [Lv. 1700]"
			NameQuest = "MarineTreeIsland"
			QuestLv = 1
			NameMon = "Marine Commodore"
			CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
			CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
		elseif Lv == 1725 or Lv <= 1774 or SelectMonster == "Marine Rear Admiral [Lv. 1725]" then -- Marine Rear Admiral
			Ms = "Marine Rear Admiral [Lv. 1725]"
			NameQuest = "MarineTreeIsland"
			QuestLv = 2
			NameMon = "Marine Rear Admiral"
			CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
			CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
		elseif Lv == 1775 or Lv <= 1799 or SelectMonster == "Fishman Raider [Lv. 1775]" then -- Fishman Raide
			Ms = "Fishman Raider [Lv. 1775]"
			NameQuest = "DeepForestIsland3"
			QuestLv = 1
			NameMon = "Fishman Raider"
			CFrameQ = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
			CFrameMon = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
		elseif Lv == 1800 or Lv <= 1824 or SelectMonster == "Fishman Captain [Lv. 1800]" then -- Fishman Captain
			Ms = "Fishman Captain [Lv. 1800]"
			NameQuest = "DeepForestIsland3"
			QuestLv = 2
			NameMon = "Fishman Captain"
			CFrameQ = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
			CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
		elseif Lv == 1825 or Lv <= 1849 or SelectMonster == "Forest Pirate [Lv. 1825]" then -- Forest Pirate
			Ms = "Forest Pirate [Lv. 1825]"
			NameQuest = "DeepForestIsland"
			QuestLv = 1
			NameMon = "Forest Pirate"
			CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
			CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
		elseif Lv == 1850 or Lv <= 1899 or SelectMonster == "Mythological Pirate [Lv. 1850]" then -- Mythological Pirate
			Ms = "Mythological Pirate [Lv. 1850]"
			NameQuest = "DeepForestIsland"
			QuestLv = 2
			NameMon = "Mythological Pirate"
			CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
			CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
		elseif Lv == 1900 or Lv <= 1924 or SelectMonster == "Jungle Pirate [Lv. 1900]" then -- Jungle Pirate
			Ms = "Jungle Pirate [Lv. 1900]"
			NameQuest = "DeepForestIsland2"
			QuestLv = 1
			NameMon = "Jungle Pirate"
			CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
			CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
		elseif Lv == 1925 or Lv <= 1974 or SelectMonster == "Musketeer Pirate [Lv. 1925]" then -- Musketeer Pirate
			Ms = "Musketeer Pirate [Lv. 1925]"
			NameQuest = "DeepForestIsland2"
			QuestLv = 2
			NameMon = "Musketeer Pirate"
			CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
			CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
		elseif Lv == 1975 or Lv <= 1999 or SelectMonster == "Reborn Skeleton [Lv. 1975]" then
			Ms = "Reborn Skeleton [Lv. 1975]"
			NameQuest = "HauntedQuest1"
			QuestLv = 1
			NameMon = "Reborn Skeleton"
			CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
			CFrameMon = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -1.3950732e-05, -0.208259016, -1.08073925e-06, 1, -7.20630269e-05, 0.208259016, 7.07080399e-05, 0.978073597)
		elseif Lv == 2000 or Lv <= 2024 or SelectMonster == "Living Zombie [Lv. 2000]" then
			Ms = "Living Zombie [Lv. 2000]"
			NameQuest = "HauntedQuest1"
			QuestLv = 2
			NameMon = "Living Zombie"
			CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
			CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 2.77547141e-08, 0.0324240364, -2.58006327e-08, 1, -6.06848474e-08, -0.0324240364, 5.98163865e-08, 0.999474227)
		elseif Lv == 2025 or Lv <= 2049 or SelectMonster == "Demonic Soul [Lv. 2025]" then
			Ms = "Demonic Soul [Lv. 2025]"
			NameQuest = "HauntedQuest2"
			QuestLv = 1
			NameMon = "Demonic Soul"
			CFrameQ = CFrame.new(-9515.39551, 172.266037, 6078.89746, 0.0121199936, -9.78649624e-08, 0.999926567, 2.30358754e-08, 1, 9.75929382e-08, -0.999926567, 2.18513581e-08, 0.0121199936)
			CFrameMon = CFrame.new(-9709.30762, 204.695892, 6044.04688, -0.845798075, -3.4587876e-07, -0.533503294, -4.46235369e-08, 1, -5.77571257e-07, 0.533503294, -4.64701827e-07, -0.845798075)
		elseif Lv == 2050 or Lv <= 2075 or SelectMonster == "Posessed Mummy [Lv. 2050]" then
			Ms = "Posessed Mummy [Lv. 2050]"
			NameQuest = "HauntedQuest2"
			QuestLv = 2
			NameMon = "Posessed Mummy"
			CFrameQ = CFrame.new(-9515.39551, 172.266037, 6078.89746, 0.0121199936, -9.78649624e-08, 0.999926567, 2.30358754e-08, 1, 9.75929382e-08, -0.999926567, 2.18513581e-08, 0.0121199936)
			CFrameMon = CFrame.new(-9554.11035, 65.6141663, 6041.73584, -0.877069294, 5.33355795e-08, -0.480364174, 2.06420765e-08, 1, 7.33423562e-08, 0.480364174, 5.44105987e-08, -0.877069294)
		elseif Lv == 2075 or Lv <= 2100 or SelectMonster == "Peanut Scout [Lv. 2075]" then
			Ms = "Peanut Scout [Lv. 2075]"
			NameQuest = "NutsIslandQuest"
			QuestLv = 1
			NameMon = "Peanut Scout"
			CFrameQ = CFrame.new(-2103.401611328125, 38.447044372558594, -10192.44140625)
			CFrameMon = CFrame.new(-2190.37, 94.6626, -10098.3)
		elseif Lv == 2100 or Lv <= 2125 or SelectMonster == "Peanut President [Lv. 2100]" then
			Ms = "Peanut President [Lv. 2100]"
			NameQuest = "NutsIslandQuest"
			QuestLv = 2
			NameMon = "Peanut President"
			CFrameQ = CFrame.new(-2103.401611328125, 38.447044372558594, -10192.44140625)
			CFrameMon = CFrame.new(-2137.686279296875, 170.53089904785156, -10609.388671875)
		elseif Lv == 2125 or Lv <= 2150 or SelectMonster == "Ice Cream Chaf [Lv. 2125]" then
			Ms = "Ice Cream Chaf [Lv. 2125]"
			NameQuest = "IceCraeamIslandQuest"
			QuestLv = 1
			NameMon = "Ice Cream Chaf"
			CFrameQ = CFrame.new(-821.259033203125, 66.16278839111328, -10964.5791015625)
			CFrameMon = CFrame.new(-801.5482788085938, 211.06137084960938, -10972.814453125)
		elseif Lv == 2150 or Lv <= 2200 or SelectMonster == "Ice Cream Commander [Lv. 2150]" then
			Ms = "Ice Cream Commander [Lv. 2150]"
			NameQuest = "IceCraeamIslandQuest"
			QuestLv = 2
			NameMon = "Ice Cream Commander"
			CFrameQ = CFrame.new(-821.259033203125, 66.16278839111328, -10964.5791015625)
			CFrameMon = CFrame.new(-552.3236694335938, 111.17111206054688, -11291.3271484375)
		elseif Lv == 2200 or Lv <= 2225 or SelectMonster == "Cookie Crafter [Lv. 2200]" then
			Ms = "Cookie Crafter [Lv. 2200]"
			NameQuest = "CakeQuest1"
			QuestLv = 1
			NameMon = "Cookie Crafter"
			CFrameQ = CFrame.new(-2022.6387939453125, 38.1414680480957, -12027.939453125)
			CFrameMon = CFrame.new(-2301.03125, 112.88335418701172, -12206.984375)
		elseif Lv == 2225 or Lv <= 2250 or SelectMonster == "Cake Guard [Lv. 2225]" then
			Ms = "Cake Guard [Lv. 2225]"
			NameQuest = "CakeQuest1"
			QuestLv = 2
			NameMon = "Cake Guard"
			CFrameQ = CFrame.new(-2022.6387939453125, 38.1414680480957, -12027.939453125)
			CFrameMon = CFrame.new(-1602.900146484375, 196.0018310546875, -12376.7861328125)
		elseif Lv == 2250 or Lv <= 2275 or SelectMonster == "Baking Staff [Lv. 2250]" then
			Ms = "Baking Staff [Lv. 2250]"
			NameQuest = "CakeQuest2"
			QuestLv = 1
			NameMon = "Baking Staff"
			CFrameQ = CFrame.new(-1927.83056640625, 38.360443115234375, -12842.0908203125)
			CFrameMon = CFrame.new(-2052.93896484375, 68.81322479248047, -12960.2685546875)
		    elseif Lv == 2275 or Lv <= 2300 or SelectMonster == "Head Baker [Lv. 2275]" then
			Ms = "Head Baker [Lv. 2275]"
			NameQuest = "CakeQuest2"
			QuestLv = 2
			NameMon = "Head Baker"
			CFrameQ = CFrame.new(-1927.83056640625, 38.360443115234375, -12842.0908203125)
			CFrameMon = CFrame.new(-2287.00732421875, 103.9866943359375, -12822.05078125)
            elseif Lv == 2300 or Lv <= 2325 or SelectMonster == "Cocoa Warrior [Lv. 2300]" then
			Ms = "Cocoa Warrior [Lv. 2300]"
			NameQuest = "ChocQuest1"
			QuestLv = 1
			NameMon = "Cocoa Warrior"
			CFrameQ = CFrame.new(231.75, 24.9003, -12200.3)
			CFrameMon = CFrame.new(37.12930679321289, 53.66633224487305, -12315.0166015625)
            elseif Lv == 2325 or Lv <= 2350 or SelectMonster == "Chocolate Bar Battler [Lv. 2325]" then
			Ms = "Chocolate Bar Battler [Lv. 2325]"
			NameQuest = "ChocQuest1"
			QuestLv = 2
			NameMon = "Chocolate Bar Battler"
			CFrameQ = CFrame.new(231.75, 24.9003, -12200.3)
			CFrameMon = CFrame.new(627.2858276367188, 75.59115600585938, -12586.1337890625)
            elseif Lv == 2350 or Lv <= 2375 or SelectMonster == "Sweet Thief [Lv. 2350]" then
			Ms = "Sweet Thief [Lv. 2350]"
			NameQuest = "ChocQuest2"
			QuestLv = 1
			NameMon = "Sweet Thief"
			CFrameQ = CFrame.new(151.198, 24.8907, -12774.6)
			CFrameMon = CFrame.new(65.77503967285156, 77.56488037109375, -12636.5615234375)
            elseif Lv >= 2375 or SelectMonster == "Candy Rebel [Lv. 2375]" then
			Ms = "Candy Rebel [Lv. 2375]"
			NameQuest = "ChocQuest2"
			QuestLv = 2
			NameMon = "Candy Rebel"
			CFrameQ = CFrame.new(151.198, 24.8907, -12774.6)
			CFrameMon = CFrame.new(59.33293914794922, 64.40779876708984, -12892.9638671875)
		end
	end
end

spawn(function()
	game:GetService("RunService").Heartbeat:connect(function()
		if Auto_Farm or AutoNew or Noclip then
			for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
				if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
					v.Humanoid:ChangeState(11)
				end
			end
		end
	end)
end)

function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end

spawn(function()
    while wait() do
        if Auto_Farm then
            pcall(function()
                local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
                CheckLevel()
                if Lv <= 150 then
                    autofarm()
                elseif Lv == 150 or Lv >= 150 then
                    autofarm2()
                end
            end)
        end
    end
end)
 
--[[local inputkeyboard = game:GetService('UserInputService') 
inputkeyboard.InputBegan:Connect(function(input) 
    if input.KeyCode == Enum.KeyCode.G then
        tTp = false
        Noclip = false
        wait(.5)
        TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end
end)]]

spawn(function()
    while wait() do
        if AutoNew then
            CheckLevel()
            autoNew()
        end
    end
end)

CFrame_ = 1
spawn(function()
	while wait(.1) do
        if CFrame_ == 1 then
		    CFrame_x = CFrame.new(0, 45, 1)
        elseif CFrame_ == 2 then
            CFrame_x = CFrame.new(0, 45, 1)
        end
	end
end)

spawn(function()
	while wait(.1) do 
        CFrame_ = 1
        wait(5)
        CFrame_ = 2
        wait(1)
	end
end)

function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end

function autofarm()
    CheckLevel()
    pcall(function()
        if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
            for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    repeat game:GetService("RunService").Heartbeat:wait()
                        if game:GetService("Workspace").Enemies:GetChildren(Ms) then
                            EquipWeapon(SelectToolWeapon)
                            v.HumanoidRootPart.CanCollide = false
                            MagnetActive = true
                            v.Head.CanCollide = false
                            TP2(CFrameMon * CFrame_x)
                            FTAK_1x = true
                        else
                            TP(CFrameMon * CFrame_x)
                            CheckLevel()
                            FTAK_1x = false
                            MagnetActive = false
                        end
                    until not v.Parent or v.Humanoid.Health <= 0 or Auto_Farm == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:GetChildren(v.Name)
                end
            end
        else
            TP(CFrameMon * CFrame_x)
            CheckLevel()
            FTAK_1x = false
            MagnetActive = false
        end
    end)
end

function autofarm2()
    CheckLevel()
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
        MagnetActive = false
        FTAK_1x = false
        TP(CFrameQ)
        CheckLevel()
        if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
            wait(1.1)
            if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                local string_1 = "StartQuest"
                local string_2 = NameQuest
                local string_3 = QuestLv
                local CommF_ = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                CommF_:InvokeServer(string_1, string_2, string_3)
            end
        end
    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
        pcall(function()
            if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        repeat game:GetService("RunService").Heartbeat:wait()
                            if game:GetService("Workspace").Enemies:GetChildren(Ms) then
                                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                    EquipWeapon(SelectToolWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    MagnetActive = true
                                    v.Head.CanCollide = false
                                    TP2(CFrameMon * CFrame_x)
                                    FTAK_1x = true
                                else
                                    MagnetActive = false    
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                end
                            else
                                CheckLevel()
                                TP(CFrameMon * CFrame_x)
                                FTAK_1x = false
                                MagnetActive = false
                            end
                        until not v.Parent or v.Humanoid.Health <= 0 or Auto_Farm == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:GetChildren(v.Name)
                    end
                end
            else
                CheckLevel()
                TP(CFrameMon * CFrame_x)
                FTAK_1x = false
                MagnetActive = false
            end
        end)
    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible == true then
        repeat game:GetService("RunService").Heartbeat:wait()
            TP(CFrameMon * CFrame.new(0,500,0))
        until game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible == false
    end
end

if OldWorld then
    function autoNew() 
        if game.Players.LocalPlayer.Data.Level.Value >= 700 then
            Auto_Farm = false
            if game.Workspace.Map.Ice.Door.CanCollide == true and game.Workspace.Map.Ice.Door.Transparency == 0 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
                EquipWeapon("Key")
                TP(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                wait(1)
                FTAK_1x = false
            elseif game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 then
                if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Ice Admiral [Lv. 700] [Boss]" and v.Humanoid.Health > 0 then
                            repeat game:GetService("RunService").Heartbeat:wait()
                                pcall(function()
                                    EquipWeapon(SelectToolWeapon)
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    FTAK_1x = true
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                end)
                            until v.Humanoid.Health <= 0 or not v.Parent
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                        end
                    end
                else
                    FTAK_1x = false
                    TP(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                end
            else
                FTAK_1x = false
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
            end
        end
    end
end

-- 1 -2226.81982421875, 53.53757858276367, -12858.2705078125
-- 2 -1874.0467529296875, 37.83319854736328, -12941.5166015625
-- 3 -1590.4227294921875, 37.83308792114258, -12379.3876953125
-- 4 -2353.299072265625, 37.83314895629883, -12108.23046875
--[[function checkMob500()
    pcall(function()
        local randomMob = math.random(0,3)
        if randomMob == 0 then
            atoMB = "Head Baker [Lv. 2275]"
            Ato500 = CFrame.new(-2226.81982421875, 53.53757858276367, -12858.2705078125)
        elseif randomMob == 1 then
            atoMB = "Baking Staff [Lv. 2250]"
            Ato500 = CFrame.new(-1874.0467529296875, 37.83319854736328, -12941.5166015625)
        elseif randomMob == 2 then
            atoMB = "Cookie Guard [Lv. 2225]"
            Ato500 = CFrame.new(-1590.4227294921875, 37.83308792114258, -12379.3876953125)
        elseif randomMob == 3 then
            atoMB = "Cookie Crafter [Lv. 2200]"
            Ato500 = CFrame.new(-2353.299072265625, 37.83314895629883, -12108.23046875)
        end
    end)
end]]

--[[spawn(function()
    while wait() do
        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
            if v.Name == "Head Baker [Lv. 2275]" and v:WaitForChild("Humanoid").Health > 0 then
                atoMB = "Head Baker [Lv. 2275]"
                Ato500 = CFrame.new(-2287.00732421875, 103.9866943359375, -12822.05078125)
            elseif v.Name == "Baking Staff [Lv. 2250]" and v:WaitForChild("Humanoid").Health > 0 then
                atoMB = "Baking Staff [Lv. 2250]"
                Ato500 = CFrame.new(-1874.0467529296875, 37.83319854736328, -12941.5166015625)
            elseif v.Name == "Cake Guard [Lv. 2225]" and v:WaitForChild("Humanoid").Health > 0 then
                atoMB = "Cake Guard [Lv. 2225]"
                Ato500 = CFrame.new(-1590.4227294921875, 37.83308792114258, -12379.3876953125)
            elseif v.Name == "Cookie Crafter [Lv. 2200]" and v:WaitForChild("Humanoid").Health > 0 then
                atoMB = "Cookie Crafter [Lv. 2200]"
                Ato500 = CFrame.new(-2353.299072265625, 37.83314895629883, -12108.23046875)
            end
        end
    end
end)]]
-- or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff [Lv. 2250]") or game:GetService("Workspace").Enemies:FindFirstChild("Cookie Guard [Lv. 2225]") or game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter [Lv. 2200]")  
--or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Cookie Guard [Lv. 2225]" or v.Name == "Cookie Crafter [Lv. 2200]"
--[[function checklist5001()
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
        if (game:GetService("Workspace").Enemies:FindFirstChild("Head Baker [Lv. 2275]")) then
            if (v.Name == "Head Baker [Lv. 2275]") and v.Humanoid.Health > 0 then
                Ato500 = CFrame.new(-2287.00732421875, 103.9866943359375, -12822.05078125)
            end
        end
    end
end
function checklist5002()
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
        if (game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff [Lv. 2250]")) then
            if (v.Name == "Baking Staff [Lv. 2250]") and v.Humanoid.Health > 0 then 
                Ato500 = CFrame.new(-1874.0467529296875, 37.83319854736328, -12941.5166015625)
            end
        end
    end
end
function checklist5003()
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
        if (game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard [Lv. 2225]")) then
            if (v.Name == "Cake Guard [Lv. 2225]") and v.Humanoid.Health > 0 then 
                Ato500 = CFrame.new(-1590.4227294921875, 37.83308792114258, -12379.3876953125)
            end
        end
    end
end
function checklist5004()
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
        if (game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter [Lv. 2200]")) then
            if (v.Name == "Cookie Crafter [Lv. 2200]") and v.Humanoid.Health > 0 then
                Ato500 = CFrame.new(-2353.299072265625, 37.83314895629883, -12108.23046875)
            end
        end
    end
end]]

spawn(function()
    while wait(.1) do
        pcall(function()
            if atoMoB then
                if (game:GetService("Workspace").Enemies:FindFirstChild("Head Baker [Lv. 2275]") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff [Lv. 2250]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard [Lv. 2225]") or game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter [Lv. 2200]")) then
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if (v.Name == "Head Baker [Lv. 2275]" or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name == "Cookie Crafter [Lv. 2200]") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then 
                            if v.Humanoid.Health > 0 then
                                repeat wait()
                                    pcall(function()
                                        v.Humanoid:ChangeState(11)
                                        v.Head.CanCollide = false
                                        Ato500 = v.HumanoidRootPart.CFrame
                                        TP2(Ato500 * CFrame.new(0,20,0))
                                        EquipWeapon(SelectToolWeapon)
                                        FTAK_1x = true
                                        MagnetActive = true
                                    end)
                                until atoMoB == false or v.Humanoid.Health <= 0 or not v.Parent
                            end
                        end
                    end
                else
                    TP(CFrame.new(-2098.639404296875, 223.8921356201172, -12464.45703125))
                    FTAK_1x = false
                    MagnetActive = false
                end
            end
        end)
    end
end)

Tp_Scrap_Metal2 = CFrame.new(-1139.2738037109375, 94.07817077636719, 4318.9150390625)

spawn(function()
	while wait(.1) do
		pcall(function()
			if Auto_Give_Scrap_Metal then
				if game:GetService("Workspace").Enemies:FindFirstChild("Brute [Lv. 45]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Brute [Lv. 45]" then
							if v:WaitForChild("Humanoid") and v.Humanoid.Health > 0 then
								repeat game:GetService("RunService").Heartbeat:wait()
                                    pcall(function()
                                        v.Humanoid:ChangeState(11)
                                        v.Head.CanCollide = false
                                        TP2(Tp_Scrap_Metal2 * CFrame.new(0,20,0))
                                        EquipWeapon(SelectToolWeapon)
                                        FTAK_1x = true
                                        MagnetActive3 = true
                                    end)
								until Auto_Give_Scrap_Metal == false or not v.Parent or v.Humanoid.Health <= 0
							end
						end
					end
				else
                    FTAK_1x = false
                    MagnetActive3 = false
				end
			end
		end)
	end
end)

spawn(function()
	while wait(.1) do
		pcall(function()
			if Auto_Bone then
				if (game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Domenic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]")) then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if (v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]") then
							if v.Humanoid.Health > 0 then
								repeat game:GetService("RunService").Heartbeat:wait()
                                    pcall(function()
                                        v.Humanoid:ChangeState(11)
                                        v.Head.CanCollide = false
                                        BoneEv = v.HumanoidRootPart.CFrame
                                        TP2(BoneEv * CFrame.new(0,15,0))
                                        EquipWeapon(SelectToolWeapon)
                                        FTAK_1x = true
                                        MagnetActive2 = true
                                    end)
								until Auto_Bone == false or not v.Parent or v.Humanoid.Health <= 0
							end
						end
					end
				else
                    FTAK_1x = false
					MagnetActive2 = false
					TP(CFrame.new(-9501.64453, 582.052612, 6034.20117))
				end
			end
		end)
	end
end)

spawn(function()
	while wait(.1) do
		pcall(function()
			if Auto_Order then
				if game:GetService("Workspace").Enemies:FindFirstChild("Order [Lv. 1250] [Raid Boss]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Order [Lv. 1250] [Raid Boss]" then
							if v.Humanoid.Health > 0 then
								repeat game:GetService("RunService").Heartbeat:wait()
                                    pcall(function()
                                        v.Humanoid:ChangeState(11)
                                        v.Head.CanCollide = false
                                        TP2(v.HumanoidRootPart.CFrame * CFrame.new(0,50,1))
                                        EquipWeapon(SelectToolWeapon)
                                        FTAK_1x = true
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    end)
								until Auto_Order == false or not v.Parent or v.Humanoid.Health <= 0
							end
						end
					end
				end
			end
		end)
	end
end)
--Order [Lv. 1250] [Raid Boss]
spawn(function()
    while wait(1) do
        if AutoHaki then
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            end
        end
    end
end)

spawn(function()
    while wait(1) do
        if DevilAuto then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
        end
    end
end)

spawn(function()
	while wait(.1) do
		if AutoBuySurprise then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
		end
	end
end)

spawn(function()
	raMon = 1
	while wait(5) do
		raMon += 1
		if raMon > 2 then
			raMon = 1
		end
	end
end)

spawn(function()
    game:GetService("RunService").Heartbeat:connect(function()
        pcall(function()
            for _,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if _G.Magnet and MagnetActive then
                    if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        if (v.HumanoidRootPart.Position - CFrameMon.Position).Magnitude <= 400 then
                            pcall(function()
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.CFrame = CFrameMon
                                if v.Humanoid:FindFirstChild("Animator") and MagnetActive then
                                    sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", 950)
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 500)
                                    v.Humanoid.Animator:Destroy()
                                end
                            end)
                        end
                    end
                end
            end
        end)
    end)
end)

spawn(function()
    game:GetService("RunService").Heartbeat:connect(function()
        pcall(function()
            for _,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if Auto_Give_Scrap_Metal and MagnetActive3 then
                    if v.Name == "Brute [Lv. 45]" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        if (v.HumanoidRootPart.Position - Tp_Scrap_Metal2.Position).Magnitude <= 400 then
                            pcall(function()
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.CFrame = Tp_Scrap_Metal2
                                if v.Humanoid:FindFirstChild("Animator") and MagnetActive3 then
                                    sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", 1000)
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 400)
                                    v.Humanoid.Animator:Destroy()
                                end
                            end)
                        end
                    end
                end
            end
        end)
    end)
end)

spawn(function()
    while wait(1) do
        pcall(function()
            for _,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if _G.Magnet and MagnetActive then
                    if atoMoB and MagnetActive then
                        if (v.Name == "Head Baker [Lv. 2275]" or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name == "Cookie Crafter [Lv. 2200]") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if (v.HumanoidRootPart.Position - Ato500.Position).Magnitude <= 400 then
                                pcall(function()
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.CFrame = Ato500
                                    if v.Humanoid:FindFirstChild("Animator") and MagnetActive then
                                        sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", 1000)
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 400)
                                        v.Humanoid.Animator:Destroy()
                                    end
                                end)
                            end
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait(.5) do
        pcall(function()
            for _,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if Auto_Bone and MagnetActive2 then
                    if (v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]") and (v.HumanoidRootPart.Position - BoneEv.Position).Magnitude <= 300 then
                        pcall(function()
                            v.Head.CanCollide = false
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.CFrame = BoneEv
                            if v.Humanoid:FindFirstChild("Animator") and MagnetActive2 then
                                sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", 1000)
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 300)
                                v.Humanoid.Animator:Destroy()
                            end
                        end)
                    end
                end
            end
        end)
    end
end)

function tweenTP()
    if tTp then
        if OldWorld then
            if TweenNameMap == "Jones Salad" then
                TP(CFrame.new(1042.1501464844, 16.299360275269, 1444.3442382813))
            elseif TweenNameMap == "Marine1" then
                TP(CFrame.new(-2599.6655273438, 6.9146227836609, 2062.2216796875))
            elseif TweenNameMap == "Marine2" then
                TP(CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188))
            elseif TweenNameMap == "Midle Town" then
                TP(CFrame.new(-655.97088623047, 7.878026008606, 1573.7612304688))
            elseif TweenNameMap == "Jungle" then
                TP(CFrame.new(-1499.9877929688, 22.877912521362, 353.87060546875))
            elseif TweenNameMap == "Pirate Village" then
                TP(CFrame.new(-1163.3889160156, 44.777843475342, 3842.8276367188))
            elseif TweenNameMap == "Desert" then
                TP(CFrame.new(954.02056884766, 6.6275520324707, 4262.611328125))
            elseif TweenNameMap ==  "Frozen Village" then
                TP(CFrame.new(1144.5270996094, 7.3292083740234, -1164.7322998047))
            elseif TweenNameMap == "Colosseum" then
                TP(CFrame.new(-1667.5869140625, 39.385631561279, -3135.5817871094))
            elseif TweenNameMap == "Prison" then
                TP(CFrame.new(4857.6982421875, 5.6780304908752, 732.75750732422))
            elseif TweenNameMap ==  "Mob Leader" then
                TP(CFrame.new(-2841.9604492188, 7.3560485839844, 5318.1040039063))
            elseif TweenNameMap == "Magma Village" then
                TP(CFrame.new(-5328.8740234375, 8.6164798736572, 8427.3994140625))
            elseif TweenNameMap == "UnderWater Gate" then
                TP(CFrame.new(3893.953125, 5.3989524841309, -1893.4851074219))
            elseif TweenNameMap == "UnderWater City" then
                TP(CFrame.new(61191.12109375, 18.497436523438, 1561.8873291016))
            elseif TweenNameMap == "Fountain City" then
                TP(CFrame.new(5244.7133789063, 38.526943206787, 4073.4987792969))
            elseif TweenNameMap == "Sky1" then
                TP(CFrame.new(-4878.0415039063, 717.71246337891, -2637.7294921875))
            elseif TweenNameMap == "Sky2" then
                TP(CFrame.new(-7899.6157226563, 5545.6030273438, -422.21798706055))
            elseif TweenNameMap == "Sky3" then
                TP(CFrame.new(-7868.5288085938, 5638.205078125, -1482.5548095703))
            end
        elseif NewWorld then
            if TweenNameMap == "Dock" then
                TP(CFrame.new(-12.519311904907, 19.302536010742, 2827.853515625))
            elseif TweenNameMap == "Mansion" then
                TP(CFrame.new(-390.34829711914, 321.89730834961, 869.00506591797))
            elseif TweenNameMap == "Kingdom Of Rose" then
                TP(CFrame.new(-388.29895019531, 138.35575866699, 1132.1662597656))
            elseif TweenNameMap == "Cafe" then
                TP(CFrame.new(-379.70889282227, 73.0458984375, 304.84692382813))
            elseif TweenNameMap == "Sunflower Field" then
                TP(CFrame.new(-1576.7171630859, 198.61849975586, 13.725157737732))
            elseif TweenNameMap == "Jeramy Mountain" then
                TP(CFrame.new(1986.3519287109, 448.95678710938, 796.70239257813))
            elseif TweenNameMap == "Colossuem" then
                TP(CFrame.new(-1871.8974609375, 45.820514678955, 1359.6843261719))
            elseif TweenNameMap == "Factory" then
                TP(CFrame.new(349.53750610352, 74.446998596191, -355.62420654297))
            elseif TweenNameMap == "The Bridge" then
                TP(CFrame.new(-1860.6354980469, 88.384948730469, -1859.1593017578))
            elseif TweenNameMap == "Green Bit" then
                TP(CFrame.new(-2202.3706054688, 73.097663879395, -2819.2687988281))
            elseif TweenNameMap == "Graveyard" then
                TP(CFrame.new(-5617.5927734375, 492.22183227539, -778.3017578125))
            elseif TweenNameMap == "Dark Area" then
                TP(CFrame.new(3464.7700195313, 13.375151634216, -3368.90234375))
            elseif TweenNameMap == "Snow Mountain" then
                TP(CFrame.new(561.23834228516, 401.44781494141, -5297.14453125))
            elseif TweenNameMap == "Hot Island" then
                TP(CFrame.new(-5505.9633789063, 15.977565765381, -5366.6123046875))
            elseif TweenNameMap == "Cold Island" then
                TP(CFrame.new(-5924.716796875, 15.977565765381, -4996.427734375))
            elseif TweenNameMap == "Ice Castle" then
                TP(CFrame.new(6111.7109375, 294.41259765625, -6716.4829101563))
            elseif TweenNameMap == "Usopp's Island" then
                TP(CFrame.new(4760.4985351563, 8.3444719314575, 2849.2426757813))
            elseif TweenNameMap == "inscription Island" then
                TP(CFrame.new(-5099.01171875, 98.241539001465, 2424.4035644531))
            elseif TweenNameMap == "Forgotten Island" then
                TP(CFrame.new(-3051.9514160156, 238.87203979492, -10250.807617188))
            elseif TweenNameMap == "Ghost Ship" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif ThreeWorld then
            if TweenNameMap == "Port Town" then
                TP(CFrame.new(-275.21615600586, 43.755737304688, 5451.0659179688))
            elseif TweenNameMap == "Hydra Island" then
                TP(CFrame.new(5541.2685546875, 668.30456542969, 195.48069763184))
            elseif TweenNameMap == "Gaint Tree" then
                TP(CFrame.new(2276.0859375, 25.87850189209, -6493.03125))
            elseif TweenNameMap == "Mansion" then
                TP(CFrame.new(-12548.998046875, 332.40396118164, -7603.1865234375))
            elseif TweenNameMap == "Castle on the Sea" then
                TP(CFrame.new(-5498.0458984375, 313.79473876953, -2860.6022949219))
            elseif TweenNameMap == "Graveyard Island" then
                TP(CFrame.new(-9515.07324, 142.130615, 5537.58398))
            elseif TweenNameMap == "Icecream Island" then
                TP(CFrame.new(-880.894531, 118.245354, -11030.7607))
            elseif TweenNameMap == "Peanut Island" then
                TP(CFrame.new(-2124.06738, 44.0723495, -10179.8281))
            elseif TweenNameMap == "Lab" then
                TP(CFrame.new(-5057.146484375, 314.54132080078, -2934.7995605469))
            elseif TweenNameMap == "Dummy" then
                TP(CFrame.new(3469.6611328125, 90.88251495361328, 257.87103271484375))
            end
        end
    end
end

spawn(function()
    while wait() do
        pcall(function()
            if tTp then
                tweenTP()
            end
        end)
    end
end)

local CSR = require(game.ReplicatedStorage.Util.CameraShaker)
local CbFw = debug.getupvalues(require(game.Players.LocalPlayer.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]

spawn(function()
     while task.wait() do
        pcall(function()
            CSR:Stop()
            CbFw2.activeController.increment = 4
            CbFw2.activeController.hitSound = 0
            CbFw2.activeController.focusStart = 0
            CbFw2.activeController.timeToNextBlock = tick() 
            CbFw2.activeController.timeToNextAttack = tick()
            CbFw2.activeController.hitboxMagnitude = hitboxUp
            CbFw2.activeController.attacking = false
            CbFw2.activeController.blocking = false
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
            game.Players.LocalPlayer.Character.Stun.Value = 0
            if SF015 or FTAK_1x and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                (function()
                    repeat wait(wat)
                        spawn(function()
                            local ga1 = {}
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):ClickButton1(Vector2.new(1300,760), game:GetService("Workspace").Camera.CFrame)
                            return ga1
                        end)
                    game:GetService("RunService").Heartbeat:wait()
                    until Auto_Order == false or Auto_Bone == false or atoMoB == false or Auto_Farm == false or FTAK_1x == false
                end)()
            elseif Auto_Bone == false or atoMoB == false or Auto_Farm == false and FTAK_1x == true then
                FTAK_1x = false
            end
        end)
    end
end)

spawn(function()
	pcall(function()
		while wait(.5) do
			if Superhuman then
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") or game.Players.LocalPlayer.Character:FindFirstChild("Death Step") then
					local args = {
						[1] = "BuyBlackLeg"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
				if game.Players.LocalPlayer.Character:FindFirstChild("Combat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") then
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
						SelectToolWeapon = "Combat"
						SelectToolWeaponOld = "Combat"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") then
						SelectToolWeapon = "Black Leg"
						SelectToolWeaponOld = "Black Leg"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") then
						SelectToolWeapon = "Electro"
						SelectToolWeaponOld = "Electro"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") then
						SelectToolWeapon = "Fishman Karate"
						SelectToolWeaponOld = "Fishman Karate"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") then
						SelectToolWeapon = "Dragon Claw"
						SelectToolWeaponOld = "Dragon Claw"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Superhuman") then
						SelectToolWeapon = "Superhuman"
						SelectToolWeaponOld = "Superhuman"
					end
					if (game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300) or (game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300) then
						local args = {
							[1] = "BuyElectro"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
					if (game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300) or (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300) then
						local args = {
							[1] = "BuyFishmanKarate"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
				end
			end
		end
	end)
end)

spawn(function()
    while wait(0.15) do
        if DeathStep then
			if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 450 then
				local args = {
					[1] = "BuyDeathStep"
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end
			if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 450 then
				local args = {
					[1] = "BuyDeathStep"
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end
			if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 449 then
				SelectToolWeapon = "Black Leg"
			end
		end
    end
end)

spawn(function()
	while game:GetService("RunService").Heartbeat:wait() do
		if melee then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", 1)
		end
	end
end)

spawn(function()
	while game:GetService("RunService").Heartbeat:wait() do
		if def then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", 1)
		end
	end
end)

spawn(function()
	while game:GetService("RunService").Heartbeat:wait() do
		if sword then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Sword", 1)
		end
	end
end)

spawn(function()
	while game:GetService("RunService").Heartbeat:wait() do
		if gun then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Gun", 1)
		end
	end
end)

spawn(function()
	while game:GetService("RunService").Heartbeat:wait() do
		if DevilFruit then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", 1)
		end
	end
end)

spawn(function()
	while game:GetService("RunService").Heartbeat:wait() do
		if _G.AutoStat then
            if game.Players.LocalPlayer.Data.Stats.Melee.Level.Value <= 2300 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", 1)
            elseif game.Players.LocalPlayer.Data.Stats.Defense.Level.Value <= 2300 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", 1)
			end
		end
	end
end)

local Tp_ = game:GetService('TeleportService')
local Gc_ = game.CoreGui.RobloxPromptGui.promptOverlay

spawn(function()
    while wait(.1) do
        pcall(function()
            Gc_.ChildAdded:connect(function(a)
                if Auto_Join_With_Roblox_Prompt then
                    if a.Name == 'ErrorPrompt' then
                        Tp_:Teleport(game.PlaceId)
                    end
                end
            end)
        end)
    end
end)

spawn(function()
    pcall(function()
        while task.wait() do
            if tTp or Auto_Order or Auto_Give_Scrap_Metal or Auto_Bone or Noclip or atoMoB or Auto_Farm then
                if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local BodyV = Instance.new("BodyVelocity")
                    BodyV.Name = "BodyClip"
                    BodyV.Parent = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") 
                    BodyV.MaxForce = Vector3.new(10000000, 10000000, 10000000)
                    BodyV.Velocity = Vector3.new(0, 0, 0)
                end
            else
                if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                end
            end
        end
    end)
end)

game:GetService("RunService").Stepped:Connect(function()
    if tTp or Auto_Order or Auto_Give_Scrap_Metal or Auto_Bone or Noclip or atoMoB or Auto_Farm then
        for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false    
            end
        end
    end
end)

spawn(function()
    while wait(1) do 
        if autobuya then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
        end
    end
end)

spawn(function()
    pcall(function()
        while wait(.1) do
            if RedeemCode2exp then
                function UseCode(Text)
                    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
                    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
                end
                UseCode("Starcodeheo")
                UseCode("Magicbus")
                UseCode("Enyu_is_Pro")
                UseCode("Sub2Fer999")
                UseCode("Bluxxy")
                UseCode("JCWK")
                UseCode("3BVISITS")
                UseCode("UPD16")
                UseCode("SUB2GAMERROBOT_EXP1")
                UseCode("StrawHatMaine")
                UseCode("Sub2OfficialNoobie")
                UseCode("THEGREATACE")
                UseCode("TantaiGaming")
                UseCode("Axiore")
                UseCode("SUB2NOOBMASTER123")
                UseCode("Sub2Daigrock")
            end
        end
    end)
end)

if _G.BoostFPS then
	local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end

--[[local sound1 = Instance.new("Sound")
sound1.Name = "Sound"
sound1.SoundId = "http://www.roblox.com/asset/?id=HiIdHerePleaseThanks"
sound1.Volume = 2
sound1.Looped = true
sound1.archivable = false
sound1.Parent = game.Workspace
sound1:Play()]]

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
