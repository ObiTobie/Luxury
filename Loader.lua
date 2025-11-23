local Services							= setmetatable({}, { __index = function(Self, Key) return game.GetService(game, Key) end })
local Client							= Services.Players.LocalPlayer
local GameID							= game.GameId

if not getgenv().Configs then
	getgenv().Configs = {
	    Mode = "Normal",
	}
end

if GameID == 648454481 then --// Grand Piece Online
	if getgenv().Configs.Mode == "Kaitan" then
		loadstring(game:HttpGet("https://github.com/ObiTobie/Luxury/blob/main/src/Kaitan.lua?raw=true"))()
	else
		loadstring(game:HttpGet("https://github.com/ObiTobie/Luxury/blob/main/src/Luxury.lua?raw=true"))()
	end
else
	Client:Kick("ลูกหรี่ชอบโง่รันผิดแมพ")
end
