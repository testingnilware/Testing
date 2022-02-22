_G.settingsTable = { 
    autoHatch = false;
}

local remotePath = game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction

function autoHatch(eggName, typ)
    spawn(function()
        while wait() do 
            if not _G.settingsTable.autoHatch then break end;
            remotePath.BuyEgg:InvokeServer(eggName, typ)
        end
    end)
end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("Rich.#6969")

local a = w:CreateFolder("Main")

a:Toggle("Auto Hatch",function(bool)
    _G.settingsTable.autoHatch = bool
    if bool then
        autoHatch("Lovely Egg", "Buy3")
    end
end)
