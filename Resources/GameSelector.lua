local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/shit-lib/src.lua"))()
local Window = Library:Create("FujiHub","v1.0.3")

local MurderMystery2 = Window:tab("Murder Mystery 2 🔪",false)
local FleeTheFacility = Window:tab("Flee The Facility 🔨",false)
local DOORS = Window:tab("DOORS 👁️",false)

-- MM2

MurderMystery2:button("Execute Script",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/MurderMystery2.lua"))()
end)

-- Flee The Facility

FleeTheFacility:button("Execute Script",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/FleeTheFacility.lua"))()
end)

-- DOORS

DOORS:button("Execute Script",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/DOORS.lua"))()
end)
