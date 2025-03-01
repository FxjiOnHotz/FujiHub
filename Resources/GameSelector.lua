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

local TargetGame = nil

local GamesList = {
    DOORS = "DOORS 🚪",
    MurderMystery2 = "Murder Mystery 2 🔪",
    FleeTheFacility = "Flee The Facility 🔨",
    IdentityFraud = "Identity Fraud 🖥️",
    DandysWorld = "Dandy's World 🌈",
    NinjaLegends = "Ninja Legends ⚔️",
    BuildABoatForTreasure = "Build A Boat For Treasure ⛵",
    BasketballLegends = "Basketball Legends 🏀",
    ShardSeekers = "Shard Seekers ✨",
    KaijuArisen = "Kaiju Arisen 🐊",
    UltimateTownSandbox = "Ultimate Town Sandbox 🌲"
}

local Main = Window:AddTab({ Title = "Game Selector" })

-- Main

local GamesDropdown = Main:AddDropdown("Games", {
    Title = "Games 🎮",
    Description = "Sets the game to execute.",
    Values = GamesList,
    Multi = false,
    Default = 1,
})

GamesDropdown:OnChanged(function(Value)
    TargetGame = Value
end)

Main:AddButton({
    Title = "Execute 📜",
    Description = "Executes the script for the targeted game.",
    Callback = function()
        if TargetGame == GamesList.DOORS then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/DOORS.lua"))()
        elseif TargetGame == GamesList.MurderMystery2 then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/MurderMystery2.lua"))()
        elseif TargetGame == GamesList.FleeTheFacility then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/FleeTheFacility.lua"))()
        elseif TargetGame == GamesList.IdentityFraud then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/IdentityFraud.lua"))()
        elseif TargetGame == GamesList.DandysWorld then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/DandysWorld.lua"))()
        elseif TargetGame == GamesList.NinjaLegends then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/NinjaLegends.lua"))()
        elseif TargetGame == GamesList.BuildABoatForTreasure then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/BuildABoatForTreasure.lua"))()
        elseif TargetGame == GamesList.BasketballLegends then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/BasketballLegends.lua"))()
        elseif TargetGame == GamesList.ShardSeekers then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/ShardSeekers.lua"))()
        elseif TargetGame == GamesList.KaijuArisen then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/KaijuArisen.lua"))()
        elseif TargetGame == GamesList.UltimateTownSandbox then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/UltimateTownSandbox.lua"))()
        end
    end
})
