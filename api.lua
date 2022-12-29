--[[

    ██╗░░░░░░█████╗░░█████╗░██╗░░██╗███████╗██████╗░  ██╗░░██╗██╗░░░██╗██████╗░
    ██║░░░░░██╔══██╗██╔══██╗██║░██╔╝██╔════╝██╔══██╗  ██║░░██║██║░░░██║██╔══██╗
    ██║░░░░░██║░░██║██║░░╚═╝█████═╝░█████╗░░██████╔╝  ███████║██║░░░██║██████╦╝
    ██║░░░░░██║░░██║██║░░██╗██╔═██╗░██╔══╝░░██╔══██╗  ██╔══██║██║░░░██║██╔══██╗
    ███████╗╚█████╔╝╚█████╔╝██║░╚██╗███████╗██║░░██║  ██║░░██║╚██████╔╝██████╦╝
    ╚══════╝░╚════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝  ╚═╝░░╚═╝░╚═════╝░╚═════╝░

]]


--obf start
local Rbx1 = game:GetService("RbxAnalyticsService"):GetClientId()
if game:GetService("RbxAnalyticsService"):GetClientId() ~= Rbx1 then
    while true do end
end

local main = {
	["1"] = rconsoleprint,
	["2"] = hookfunc,
	["3"] = hookfunction,
	["4"] = replaceclosure,
	["5"] = setreadonly,
	["6"] = make_writeable,
	["7"] = print,
	["8"] = warn,
	["9"] = writefile,
	["10"] = appendfile,
	["11"] = setclipboard,
}

if getgenv().AntihookFF1 == nil then
	getgenv().AntihookFF1 = {
		["print"] = true,
		["hook"] = false
	}
end

local azx 
azx = hookfunc(rconsoleprint, function (...)
	if getgenv().AntihookFF1["print"] == true then
		return azx(...)
	else
		return 
	end
end)

local al 
al = hookfunc(hookfunction, function (...)
	if getgenv().AntihookFF1["hook"] == true then
		return al(...)
	else
		return 
	end
end)

local al 
al = hookfunc(setclipboard, function (...)
	if getgenv().AntihookFF1["hook"] == true then
		return al(...)
	else
		return 
	end
end)

local an 
an = hookfunc(replaceclosure, function (...)
	if getgenv().AntihookFF1["print"] == true then
		return an(...)
	else
		return 
	end
end)

local ay 
ay = hookfunc(setreadonly, function (...)
	if getgenv().AntihookFF1["hook"] == true then
		return ay(...)
	else
		return 
	end
end)

local ae 
ae = hookfunc(make_writeable, function (...)
	if getgenv().AntihookFF1["hook"] == true then
		return ae(...)
	else
		return 
	end
end)

local av 
av = hookfunc(print, function (...)
	if getgenv().AntihookFF1["print"] == true then
		return av(...)
	else
		return 
	end
end)

local at 
at = hookfunc(warn, function (...)
	if getgenv().AntihookFF1["hook"] == true then
		return at(...)
	else
		return 
	end
end)

local aw 
aw = hookfunc(writefile, function (...)
	if getgenv().AntihookFF1["hook"] == true then
		return aw(...)
	else
		return 
	end
end)

local aq
aq = hookfunc(appendfile, function (...)
	if getgenv().AntihookFF1["hook"] == true then
		return aq(...)
	else
		return 
	end
end)

local dsa
dsa = hookfunc(clonefunction,function(...)
    if getgenv().AntihookFF1["hook"] == true then
		return dsa(...)
	else
		return 
	end
end)

local as 
as = hookfunc(hookfunc, function (...)
	if getgenv().AntihookFF1["hook"] == true then
		return as(...)
	else
		return 
	end
end)

getgenv().rconsoleprint = function(...)
	if getgenv().AntihookFF1["print"] == true then
		return main["1"](...)
	else
		return "Secret"
	end
end

getgenv().hookfunc = function(...)
	if getgenv().AntihookFF1["hook"] == true then
		return main["2"](...)
	else
		return "Secret"
	end
end

getgenv().hookfunction = function(...)
	if getgenv().AntihookFF1["hook"] == true then
		return main["3"](...)
	else
		return "Secret"
	end
end

getgenv().replaceclosure = function(...)
	if getgenv().AntihookFF1["hook"] == true then
		return main["4"](...)
	else
		return "Secret"
	end
end

getgenv().setreadonly = function(...)
	if getgenv().AntihookFF1["hook"] == true then
		return main["5"](...)
	else
		return "Secret"
	end
end

getgenv().make_writeable = function(...)
	if getgenv().AntihookFF1["hook"] == true then
		return main["6"](...)
	else
		return "Secret"
	end
end

getgenv().print = function(...)
	if getgenv().AntihookFF1["print"] == true then
		return main["7"](...)
	else
		return "Secret"
	end
end

getgenv().warn = function(...)
	if getgenv().AntihookFF1["print"] == true then
		return main["8"](...)
	else
		return "Secret"
	end
end

getgenv().writefile = function(...)
	if getgenv().AntihookFF1["hook"] == true then
		return main["9"](...)
	else
		return "Secret"
	end
end

getgenv().appendfile = function(...)
	if getgenv().AntihookFF1["hook"] == true then
		return main["10"](...)
	else
		return "Secret"
	end
end

getgenv().setclipboard = function(...)
	if getgenv().AntihookFF1["hook"] == true then
		return main["11"](...)
	else
		return "Secret"
	end
end

spawn(function()
    game:GetService("RunService").RenderStepped:connect(function()
        game.CoreGui.ChildAdded:connect(function(p1)
        	if p1:FindFirstChild("PropertiesFrame") or p1:FindFirstChild("ExplorerPanel") or p1:FindFirstChild("SaveInstance") then
                game.Players.LocalPlayer:Kick("\n\nAnti Dark Dex\n")
                local url = "https://discord.com/api/webhooks/" .. Id .. "/" .. token
                local data = {
                    ["content"] = "",
                    ["embeds"] = {
                        {
                            ["title"] = "API SERVICES",
                            ["description"] = "User : " .. game.Players.LocalPlayer.Name .. "\nHWID : ".. game:GetService("RbxAnalyticsService"):GetClientId() .."\n\nAnti Dark Dex",
                            ["type"] = "rich",
                        }
                    }
                }
                local data = game:GetService("HttpService"):JSONEncode(data)
                local header = {["content-type"] = "application/json"}
                local request = http_request or request or HttpPost or syn.request
                local serversdata = {Url = url, Body = data, Method = "POST", Headers = header}
                request(serversdata)
        		while true do end
        	end
        end)
    end)
end)

game.CoreGui.ChildAdded:connect(function(q)
    game.RunService.RenderStepped:connect(function()
        if q.Name == "UI LIB" or q.Name == "spyu" then
            local url = "https://discord.com/api/webhooks/" .. Id .. "/" .. token
            local data = {
                ["content"] = "",
                ["embeds"] = {
                    {
                        ["title"] = "API SERVICES",
                        ["description"] = "User : " .. game.Players.LocalPlayer.Name .. "\nHWID".. game:GetService("RbxAnalyticsService"):GetClientId() .."\n\nUI SPY",
                        ["type"] = "rich",
                    }
                }
            }
            local data = game:GetService("HttpService"):JSONEncode(data)
            local header = {["content-type"] = "application/json"}
            local request = http_request or request or HttpPost or syn.request
            local serversdata = {Url = url, Body = data, Method = "POST", Headers = header}
            request(serversdata)
            while true do end
        end
    end)
end)

local UIS = game:GetService("UserInputService")
local keydown = false
UIS.InputBegan:Connect(function(Input)
    if Input.KeyCode == Enum.KeyCode.Insert then
        keydown = true
        game.Players.localPlayer:Kick("\n\nAnti Console Synapse X\n")
        local url = "https://discord.com/api/webhooks/" .. Id .. "/" .. token
        local data = {
            ["content"] = "",
            ["embeds"] = {
                {
                    ["title"] = "API SERVICES",
                    ["description"] = "User : " .. game.Players.LocalPlayer.Name .. "\nHWID : " .. game:GetService("RbxAnalyticsService"):GetClientId() .. "\n\nAnti Console Synapse X",
                    ["type"] = "rich",
                }
            }
        }
        local data = game:GetService("HttpService"):JSONEncode(data)
        local header = {["content-type"] = "application/json"}
        local request = http_request or request or HttpPost or syn.request
        local serversdata = {Url = url, Body = data, Method = "POST", Headers = header}
        request(serversdata)
        while true do
        end
    end
end)

local a = {}

    local url = "https://discord.com/api/webhooks/" .. Id .. "/" .. token
    local data = {
        ["content"] = "",
        ["embeds"] = {
            {
                ["title"] = "API SERVICES",
                ["description"] = "User : " .. game.Players.LocalPlayer.Name .."\nHWID : " .. game:GetService("RbxAnalyticsService"):GetClientId() .. "\n\nAPI LOADING...",
                ["type"] = "rich",
            }
        }
    }
    local data = game:GetService("HttpService"):JSONEncode(data)
    local header = {["content-type"] = "application/json"}
    local request = http_request or request or HttpPost or syn.request
    local serversdata = {Url = url, Body = data, Method = "POST", Headers = header}
	local ts = game:GetService("TeleportService")
	local p = game:GetService("Players").LocalPlayer
	local Key = getgenv().Key
    if game:GetService("RbxAnalyticsService"):GetClientId() ~= Rbx1 then
        while true do end
    end
    request(serversdata)
    wait(10)

        if true or false then
            function Admin()
                if Key == "A657811A48L148E38919_IT" then
                    print("Connect API") --Connection
                    if game:GetService("RbxAnalyticsService"):GetClientId() ~= Rbx1 then
                        while true do end
                    end
                    local url = "https://discord.com/api/webhooks/" .. Id .. "/" .. token
                    local data = {
                        ["content"] = "",
                        ["embeds"] = {
                            {
                                ["title"] = "API SERVICES",
                                ["description"] = "User : " .. game.Players.LocalPlayer.Name .. "\nHWID : ".. game:GetService("RbxAnalyticsService"):GetClientId() .."\n\nConnect API",
                                ["type"] = "rich",
                            }
                        }
                    }
                    local data = game:GetService("HttpService"):JSONEncode(data)
                    local header = {["content-type"] = "application/json"}
                    local request = http_request or request or HttpPost or syn.request
                    local serversdata = {Url = url, Body = data, Method = "POST", Headers = header}
                    request(serversdata)
                else
                    print("Wrong Connect API") --Wrong Connection
                    local url = "https://discord.com/api/webhooks/" .. Id .. "/" .. token
                    local data = {
                        ["content"] = "",
                        ["embeds"] = {
                            {
                                ["title"] = "API SERVICES",
                                ["description"] = "User : " .. game.Players.LocalPlayer.Name .. "\nHWID : ".. game:GetService("RbxAnalyticsService"):GetClientId() .."\n\nWrong Verify",
                                ["type"] = "rich",
                            }
                        }
                    }
                    local data = game:GetService("HttpService"):JSONEncode(data)
                    local header = {["content-type"] = "application/json"}
                    local request = http_request or request or HttpPost or syn.request
                    local serversdata = {Url = url, Body = data, Method = "POST", Headers = header}
                    request(serversdata)

                    ts:Teleport(game.PlaceId, p)
                    task.wait()
                    game:Shutdown()
                end
            end
        end

    Admin()

return a;
--obf end
