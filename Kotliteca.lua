-- ==========================================
-- KOTLITECA UI (Библиотека)
-- Версия: 1.0
-- ==========================================

local Kotliteca = {}

-- Тема (можешь менять цвета тут)
Kotliteca.Theme = {
    Background = Color3.fromRGB(18, 19, 22),
    Surface    = Color3.fromRGB(26, 28, 33),
    SurfaceLight = Color3.fromRGB(34, 37, 44),
    Text       = Color3.fromRGB(235, 237, 240),
    TextDim    = Color3.fromRGB(150, 155, 165),
    Accent     = Color3.fromRGB(88, 130, 255),
    ToggleOff  = Color3.fromRGB(50, 53, 62),
}

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local T = Kotliteca.Theme

-- Создание окна
function Kotliteca:CreateWindow(config)
    config = config or {}
    local titleText = config.Title or "Kotliteca UI"
    
    -- Хранилище для вкладок
    local window = { Tabs = {} }

    -- GUI
    local gui = Instance.new("ScreenGui")
    gui.Name = "KotlitecaUI"
    gui.ResetOnSpawn = false
    gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Main
    local main = Instance.new("Frame")
    main.Size = UDim2.fromOffset(520, 380)
    main.Position = UDim2.new(0.5, -260, 0.5, -190)
    main.BackgroundColor3 = T.Background
    main.BorderSizePixel = 0
    main.ClipsDescendants = true
    main.Parent = gui
    local c1 = Instance.new("UICorner", main); c1.CornerRadius = UDim.new(0, 8)

    -- TopBar
    local topBar = Instance.new("Frame")
    topBar.Size = UDim2.new(1, 0, 0, 36)
    topBar.BackgroundColor3 = T.Surface
    topBar.BorderSizePixel = 0
    topBar.Parent = main
    local c2 = Instance.new("UICorner", topBar); c2.CornerRadius = UDim.new(0, 8)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -80, 1, 0)
    title.Position = UDim2.new(0, 12, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = titleText
    title.TextColor3 = T.Text
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = topBar

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.fromOffset(28, 28)
    closeBtn.Position = UDim2.new(1, -34, 0.5, -14)
    closeBtn.BackgroundColor3 = T.SurfaceLight
    closeBtn.BorderSizePixel = 0
    closeBtn.Text = "×"
    closeBtn.TextColor3 = T.Text
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 16
    closeBtn.AutoButtonColor = false
    closeBtn.Parent = topBar
    local c3 = Instance.new("UICorner", closeBtn); c3.CornerRadius = UDim.new(0, 6)
    closeBtn.MouseButton1Click:Connect(function() gui.Enabled = false end)

    -- Drag
    local dragging, dragStart, startPos
    topBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true; dragStart = input.Position; startPos = main.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)

    -- Sidebar & Content
    local sidebar = Instance.new("Frame")
    sidebar.Size = UDim2.new(0, 140, 1, -36)
    sidebar.Position = UDim2.new(0, 0, 0, 36)
    sidebar.BackgroundColor3 = T.Surface
    sidebar.BorderSizePixel = 0
    sidebar.Parent = main

    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, -140, 1, -36)
    content.Position = UDim2.new(0, 140, 0, 36)
    content.BackgroundTransparency = 1
    content.Parent = main

    local tabY = 8

    -- Метод создания вкладки
    function window:CreateTab(name)
        local tab = {}

        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -16, 0, 32)
        btn.Position = UDim2.new(0, 8, 0, tabY)
        btn.BackgroundColor3 = T.Surface
        btn.BorderSizePixel = 0
        btn.Text = name
        btn.TextColor3 = T.TextDim
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 13
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.AutoButtonColor = false
        btn.Parent = sidebar
        local pad = Instance.new("UIPadding", btn); pad.PaddingLeft = UDim.new(0, 10)
        local cor = Instance.new("UICorner", btn); cor.CornerRadius = UDim.new(0, 6)
        tabY = tabY + 36

        local page = Instance.new("ScrollingFrame")
        page.Size = UDim2.new(1, 0, 1, 0)
        page.BackgroundTransparency = 1
        page.Visible = false
        page.BorderSizePixel = 0
        page.ScrollBarThickness = 2
        page.ScrollBarImageColor3 = T.SurfaceLight
        page.CanvasSize = UDim2.new(0, 0, 0, 0)
        page.AutomaticCanvasSize = Enum.AutomaticSize.Y
        page.Parent = content

        local layout = Instance.new("UIListLayout", page)
        layout.Padding = UDim.new(0, 8)
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        local pad2 = Instance.new("UIPadding", page)
        pad2.PaddingTop = UDim.new(0, 12); pad2.PaddingLeft = UDim.new(0, 12)
        pad2.PaddingRight = UDim.new(0, 12); pad2.PaddingBottom = UDim.new(0, 12)

        table.insert(window.Tabs, { Button = btn, Page = page })

        btn.MouseButton1Click:Connect(function()
            for _, t in ipairs(window.Tabs) do
                t.Button.BackgroundColor3 = T.Surface
                t.Button.TextColor3 = T.TextDim
                t.Page.Visible = false
            end
            btn.BackgroundColor3 = T.SurfaceLight
            btn.TextColor3 = T.Text
            page.Visible = true
        end)

        if #window.Tabs == 1 then
            btn.BackgroundColor3 = T.SurfaceLight
            btn.TextColor3 = T.Text
            page.Visible = true
        end

        -- Метод добавления кнопки
        function tab:AddButton(cfg)
            cfg = cfg or {}
            local b = Instance.new("TextButton")
            b.Size = UDim2.new(1, 0, 0, 32)
            b.BackgroundColor3 = T.SurfaceLight
            b.BorderSizePixel = 0
            b.Text = cfg.Name or "Button"
            b.TextColor3 = T.Text
            b.Font = Enum.Font.Gotham
            b.TextSize = 13
            b.AutoButtonColor = false
            b.Parent = page
            local c = Instance.new("UICorner", b); c.CornerRadius = UDim.new(0, 6)
            
            b.MouseButton1Click:Connect(function()
                if cfg.Callback then pcall(cfg.Callback) end
            end)
        end

        -- Метод добавления тоггла
        function tab:AddToggle(cfg)
            cfg = cfg or {}
            local row = Instance.new("Frame")
            row.Size = UDim2.new(1, 0, 0, 32)
            row.BackgroundTransparency = 1
            row.Parent = page

            local lbl = Instance.new("TextLabel")
            lbl.Size = UDim2.new(1, -50, 1, 0)
            lbl.BackgroundTransparency = 1
            lbl.Text = cfg.Name or "Toggle"
            lbl.TextColor3 = T.Text
            lbl.Font = Enum.Font.Gotham
            lbl.TextSize = 13
            lbl.TextXAlignment = Enum.TextXAlignment.Left
            lbl.Parent = row

            local switch = Instance.new("Frame")
            switch.Size = UDim2.fromOffset(40, 20)
            switch.Position = UDim2.new(1, -40, 0.5, -10)
            local def = cfg.Default or false
            switch.BackgroundColor3 = def and T.Accent or T.ToggleOff
            switch.BorderSizePixel = 0
            switch.Parent = row
            local sc = Instance.new("UICorner", switch); sc.CornerRadius = UDim.new(0, 10)

            local knob = Instance.new("Frame")
            knob.Size = UDim2.fromOffset(16, 16)
            knob.Position = def and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            knob.BackgroundColor3 = T.Text
            knob.BorderSizePixel = 0
            knob.Parent = switch
            local kc = Instance.new("UICorner", knob); kc.CornerRadius = UDim.new(0, 8)

            local state = def
            local function setState(newState)
                state = newState
                switch.BackgroundColor3 = state and T.Accent or T.ToggleOff
                knob.Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
                if cfg.Callback then pcall(cfg.Callback, state) end
            end

            switch.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    setState(not state)
                end
            end)
        end

        return tab
    end

    return window
end

return Kotliteca
