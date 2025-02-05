if game.PlaceId == 6839171747 then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/DOORS.lua"))()
elseif game.PlaceId == 142823291 then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/MurderMystery2.lua"))()
elseif game.PlaceId == 893973440 then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/FleeTheFacility.lua"))()
elseif game.PlaceId == 338521019 then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/IdentityFraud.lua"))()
else
  return "FujiHub doesn't support that game!"
end
