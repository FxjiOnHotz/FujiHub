local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "FujiHub",
    SubTitle = "Game Selector",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Starting tab
local FujiHubInfo = Window:AddTab({ Title = "FujiHub 🏠" })
FujiHubInfo:AddParagraph({
    Title = "Welcome to FujiHub!",
    Content = "Choose a game below to execute its script or view its source code."
})
FujiHubInfo:AddButton({
    Title = "Game Selector Info",
    Description = "Click here for more information.",
    Callback = function()
        print("Welcome to FujiHub! Select a game tab to proceed.")
    end
})

-- Function to add elements to game tabs
table.foreach({
    DOORS = "DOORS 🚪",
    MurderMystery2 = "Murder Mystery 2 🔪",
    FleeTheFacility = "Flee The Facility 🔨",
    IdentityFraud = "Identity Fraud 🖥️",
    DandysWorld = "Dandy's World 🌈",
    NinjaLegends = "Ninja Legends ⚔️",
    BuildABoatForTreasure = "Build A Boat For Treasure ⛵",
    KaijuArisen = "Basketball Legends 🏀",
    ShardSeekers = "Shard Seekers ✨",
    KaijuArisen = "Kaiju Arisen 🐊",
    UltimateTownSandbox = "Ultimate Town Sandbox 🌲"
}, function(varName, title)
    _G[varName] = Window:AddTab({ Title = title })
    
    _G[varName]:AddParagraph({
        Title = title .. " Info",
        Content = "This tab contains scripts and options for " .. title .. "."
    })
    
    _G[varName]:AddButton({
        Title = "Execute Script",
        Description = "Run the script for " .. title,
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/" .. varName .. ".lua"))()
        end
    })
    
    _G[varName]:AddButton({
        Title = "View Source Code",
        Description = "View the source for " .. title,
        Callback = function()
            setclipboard("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/" .. varName .. ".lua")
            print("Copied source URL to clipboard!")
        end
    })
end)

-- Select the starting tab
Window:SelectTab(FujiHubInfo)
