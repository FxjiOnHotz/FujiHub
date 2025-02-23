--loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Resources/GameSelector.lua"))()

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Key = "6-7"
local KeyEntered = nil

local Window = Fluent:CreateWindow({
    Title = "FujiHub",
    SubTitle = "Key System",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Key = Window:AddTab({ Title = "Key", Icon = "key" }),
    Info = Window:AddTab({ Title = "About", Icon = "info" }),
    Credits = Window:AddTab({ Title = "Credits", Icon = "star" }),
}

-- Key Tab

Tabs.Key:AddInput("Key", {
    Title = "Key",
    Description = "Enter your key here.",
    Placeholder = "Enter Key",
    Numeric = false, -- Only allows numbers
    Finished = false, -- Only calls callback when you press enter
    Callback = function(Value)
        KeyEntered = Value
    end
})

Tabs.Key:AddButton({
    Title = "Get Key",
    Callback = function()
        setclipboard("https://sites.google.com/view/fujihubscript/home")
        game.StarterGui:SetCore("SendNotification", {Title = "FujiHub", Text = "The key was copied into your clipboard.", Icon = "", Duration = 5})
    end
})

Tabs.Key:AddButton({
    Title = "Submit Key",
    Callback = function()
        if KeyEntered == Key then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Resources/GameSelector.lua"))()
            Fluent:Destroy()
        end
    end
})

-- About Tab

Tabs.Info:AddParagraph({
    Title = "Information",
    Content = "This Roblox script was made out of pure premium scripting and gives the user a premium-experience and make them overpowered."
})

Window:SelectTab(1)
