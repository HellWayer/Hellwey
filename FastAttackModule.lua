local plrgetm = game.Players.LocalPlayer:GetMouse()
local CSR = require(game.ReplicatedStorage.Util.CameraShaker)
local CbFw = debug.getupvalues(require(game.Players.LocalPlayer.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]

function GetCurrentBlade() 
    local Combat = CbFw2.activeController
    local ret = Combat.blades[1]
    if not ret then 
        return 
    end
    while ret.Parent ~= game.Players.LocalPlayer.Character do 
        ret = ret.Parent 
    end
    return ret
end

function AttackNoCD() 
    for i = 1,1 do
        local Combat = CbFw2.activeController
        local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(game.Players.LocalPlayer.Character, {game.Players.LocalPlayer.Character.HumanoidRootPart}, 60)
        local cac = {}
        local hash = {}
        for k, v in pairs(bladehit) do
            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                table.insert(cac, v.Parent.HumanoidRootPart)
                hash[v.Parent] = true
            end
        end
        bladehit = cac
        if #bladehit > 0 then
            local u8 = debug.getupvalue(Combat.attack, 5)
            local u9 = debug.getupvalue(Combat.attack, 6)
            local u7 = debug.getupvalue(Combat.attack, 4)
            local u10 = debug.getupvalue(Combat.attack, 7)
            local u12 = (u8 * 798405 + u7 * 727595) % u9
            local u13 = u7 * 798405
                u12 = (u12 * u9 + u13) % 1099511627776
                u8 = math.floor(u12 / u9)
                u7 = u12 - u8 * u9
            u10 = u10 + 1
            debug.setupvalue(Combat.attack, 5, u8)
            debug.setupvalue(Combat.attack, 6, u9)
            debug.setupvalue(Combat.attack, 4, u7)
            debug.setupvalue(Combat.attack, 7, u10)
            pcall(function()
                for i,v in pairs(Combat.animator.anims.basic) do
                    v:Play()
                end
            end)
            if Combat.blades and Combat.blades[1] then 
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
            end
        end
    end
end


plrgetm.Button1Down:Connect(function()
    if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
        pcall(function()
            CbFw2.activeController.increment = 1
            CbFw2.activeController.hitboxMagnitude = 30
            AttackNoCD()
        end)
    end
end)

spawn(function()
    while wait(wat) do
        pcall(function()
            CSR:Stop()
            CbFw2.activeController.increment = 3
            CbFw2.activeController.hitboxMagnitude = 100
            CbFw2.activeController.timeToNextAttack = 0
            CbFw2.activeController.attacking = false
            CbFw2.activeController.blocking = false
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
            game.Players.LocalPlayer.Character.Stun.Value = 0
            if FTAK_1x == true and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                (function()
                    AttackNoCD()
                end)()
            elseif SF015 == true and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                (function()
                    AttackNoCD()
                end)()
            elseif Auto_Farm == false and FTAK_1x == true then
                FTAK_1x = false
            end
        end)
    end
end)
