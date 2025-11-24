--[[
 ___       ___  ___     ___    ___ ___  ___  ________      ___    ___      ___  ___  ___  ___  ________     
|\  \     |\  \|\  \   |\  \  /  /|\  \|\  \|\   __  \    |\  \  /  /|    |\  \|\  \|\  \|\  \|\   __  \    
\ \  \    \ \  \\\  \  \ \  \/  / | \  \\\  \ \  \|\  \   \ \  \/  / /    \ \  \\\  \ \  \\\  \ \  \|\ /_   
 \ \  \    \ \  \\\  \  \ \    / / \ \  \\\  \ \   _  _\   \ \    / /      \ \   __  \ \  \\\  \ \   __  \  
  \ \  \____\ \  \\\  \  /     \/   \ \  \\\  \ \  \\  \|   \/  /  /        \ \  \ \  \ \  \\\  \ \  \|\  \ 
   \ \_______\ \_______\/  /\   \    \ \_______\ \__\\ _\ __/  / /           \ \__\ \__\ \_______\ \_______\
    \|_______|\|_______/__/ /\ __\    \|_______|\|__|\|__|\___/ /             \|__|\|__|\|_______|\|_______|
                       |__|/ \|__|                       \|___|/                                            
                                                                                                            
--// This made by #byfronera                                                                                      
]]

if not game:IsLoaded() then game.Loaded:Wait() end

local _cloneref							= cloneref or function(func) return func end
local Services							= setmetatable({}, { __index = function(Self, Key) return _cloneref(game.GetService(game, Key)) end })
local Client							= Services.Players.LocalPlayer
local GameID							= game.GameId

type array<I,V> = {[I]: V}

---------/// Wait For Load ///---------

local __f : array<string, any> = {
    ['__game'] = function() : string
        local g : number = game.GameId
        if g == 648454481 then 
            return "Kaitan" -- Grand Piece Kaitan
        else
            return "lmao"
        end
    end;
    ['__load'] = function(s : string) : nil (load or loadstring)(game:HttpGet(s))() end;
    ['__ismobile'] = function() : boolean
        local uis : Instance = getService.UserInputService
        if uis.TouchEnabled and not uis.KeyboardEnabled and not uis.MouseEnabled then return true
        elseif not uis.TouchEnabled and uis.KeyboardEnabled and uis.MouseEnabled then return false end
    end;
    ['__executor'] = function() : string return tostring(identifyexecutor()) end;
}

if not getgenv().Configs then
	getgenv().Configs = {
	    Mode = "Normal",
	}
end

---------/// Check Executor ///---------

local isExecutors : (txt : string) -> boolean = function(txt : string)
    local exec : string = string.lower(__f['__executor']())
    return exec == tostring(txt) or string.find(exec, tostring(txt))
end

local someModule : () -> Instance = function()
    local playerScript : Instance = Client:FindFirstChild("PlayerScripts")

    if playerScript then
        local playerModule : Instance = playerScript:FindFirstChild("PlayerModule")
        if playerModule then
            return playerModule
        end
    end

    for i, v in pairs(game:GetDescendants()) do
        if v.ClassName == "ModuleScript" then
            return v
        end
    end
    
    return nil
end

print(string.format("\nEXECUTOR DETECTED : %s", __f['__executor']()))
if hookfunction then print("✅ Support [HOOKFUNCTION]") else warn("❌ Not Support [HOOKFUNCTION]") end
if hookmetamethod then print("✅ Support [HOOKMETAMETHOD]") else warn("❌ Not Support [HOOKMETAMETHOD]") end
if writefile then print("✅ Support [WRITEFILE]") else warn("❌ Not Support [WRITEFILE]") end
if readfile then print("✅ Support [READFILE]") else warn("❌ Not Support [READFILE]") end
if getconnections then print("✅ Support [GETCONNECTION]") else warn("❌ Not Support [GETCONNECTION]") end
if pcall(require, someModule()) then print("✅ Support [REQUIRE]") else warn("❌ Not Support [REQUIRE]") end
if (request or http_request) then print("✅ Support [REQUEST]\n") else warn("❌ Not Support [REQUEST]\n") end

---------/// Anti AFK ///---------
task.spawn(function(InitializeService)
    if getconnections then
        for i,v in pairs(getconnections(Client.Idled)) do
            v:Disable() 
        end
    end
end)

---------/// Check if not execute 2 times ///---------

if not(getgenv().run_time) then
    ---------/// Mark as already execute ///---------

    getgenv().run_time = true

    ---------/// Load Scripts ///---------

    local tar : any = nil;
    tar = __f['__game'](); 
    print(tar)
    if tar ~= "lmao" then
        __f['__load'](`https://github.com/ObiTobie/Luxury/blob/main/src/{tar}.lua?raw=true`) 
    else
        Client:Kick("ลูกหรี่ชอบโง่รันผิดแมพ")
    end
end
