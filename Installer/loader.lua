--[[
    Unnamed Render Config.
    Made by Sail100 and OuterScripts.
    Render by SystemXVoid.
    Credits to SystemXVoid for the uninstaller code.
]]
local goodexecutor
local version = 'beta'
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Unnamed Config", HidePremium = false, IntroText = "Unmamed Config UI is loading.."})
local lplr = game.Players.LocalPlayer
local httpService = game:GetService('HttpService')
local executor = (identifyexecutor or getexecutorname or function() return 'your executor' end)()
local httprequest = (http and http.request or http_request or fluxus and fluxus.request or request or function() end)
local setclipboard = setclipboard or function(data) writefile('clipboard.txt', data) end
local isfile = isfile or function(file)
    local success, filecontents = pcall(function() return readfile(file) end)
    return success and type(filecontents) == 'string'
end 

if executor ~= 'Fluxus' then -- only good executor lmao
    lplr:Kick("Your executor isnt supported! Use Fluxus.")
else
    notify("Installer", "supported, executor: "..executor)
end

local function notify(name, text)
    OrionLib:MakeNotification({
    Name = name,
    Content = text,
    Image = "rbxassetid://4483345998",
    Time = 6
})
end

function section(sectionname, tab, text)
   local sectionname = tab:AddSection({
   Name = text
})
end

function exeTest()
    if not isfile or readfile or makefolder or writefile or delfile then
		lplr:Kick("not supported")
	else
        notify("Installer", "executor is supported")
    end
end

exeTest()

function ResetProfiles()
    if not isfolder('vape/Profiles') then
        makefolder('vape/Profiles')
    else
        print("Render Profiles already installed.")
        delfolder('vape/Profiles')
        task.wait(0.1)
        makefolder('vape/Profiles')
    end
end

function testUninstaller()
	lplr:Kick("Reinstall Render.")
end

if version = 'beta' then
    notify('Installer Warning', 'This installer is in beta. Expect some bugs.')
    task.wait(1)
    print("Version: "..version)
    makefolder('Installer')
    setclipboard(executor) -- test
    writefile('Installer/installerverison.txt', version)
else
    print("Verison is not beta.")
    makefolder('Installer')
    writefile('Installer/installerverison.txt', "invalid")
end

function uninstall()
    repeat task.wait() until uninstalled == true
    print("Starting uninstall.")
    notify("Uninstaller", "Uninstalling..")
    ResetProfiles()
    print("Finished!")
    notify("Uninstaller", "Finished uninstalling.")
    local uninstalled = true
end

local UTab = Window:MakeTab({
	Name = "Uninstall",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local ITab = Window:MakeTab({
    Name = "Install",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
UTab:AddButton({
    Name = "Remove",
	Callback = function()
        uninstall()
  	end    
})


ITab:AddButton({
    Name = "Install"
    Callback = function()
        notify('Installer', 'Releasing later.')
    end
})
