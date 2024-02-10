--[[
    Unnamed Render Config.
    Made by Sail100 and OuterScripts.
    Render by SystemXVoid.
    Credits to SystemXVoid for the uninstaller code.
]]
local goodexecutor = '!'
local VERISON = 'BETA'
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Unnamed Config", HidePremium = false, IntroText = "Unmamed Config UI is loading.."})
local lplr = game.Players.LocalPlayer
local httpService = game:GetService('HttpService')
local executor = (identifyexecutor or getexecutorname or function() return 'your executor' end)()
local httprequest = (http and http.request or http_request or fluxus and fluxus.request or request or function() end)
local isfile = isfile or function(file)
    local success, filecontents = pcall(function() return readfile(file) end)
    return success and type(filecontents) == 'string'
end 

if executor ~= 'Fluxus' then -- only good executor lmao
      lplr:Kick("Your executor: "..executor.. " isnt supported! Use Fluxus.")
end

function notify(name, text)
  OrionLib:MakeNotification({
    Name = name,
    Content = text,
    Image = "rbxassetid://4483345998",
    Time = 6,
})
end

function section(sectionname, tab, text)
   local sectionname = tab:AddSection({
   Name = text
})
end

function exeTest()
      if not isfile then
		lplr:Kick("Executor does not support isfile, use Fluxus or Delta.")
	end

	if not readfile then
		lplr:Kick("Executor does not support readfile, use Fluxus or Delta.")
	end

	if not makefolder then
		lplr:Kick("Executor does not support makefolder, use Fluxus or Delta.")
	end

	if not writefile then
		lplr:Kick("Executor does not support writefile, use Fluxus or Delta.")
	end

	if not delfile then
		lplr:Kick("Executor does not support delfile, use Fluxus or Delta")
	end
end

exeTest()

function ResetProfiles()
    if not isfolder('vape/Profiles') then
        makefolder('vape/Profiles')
    else
        print("Render Profiles already installed.")
        delfolder('vape/Profiles')
        wait(.1)
        makefolder('vape/Profiles')
    end
end

function testUninstaller()
	lplr:Kick("Reinstall Render.")
end

if VERISON == 'BETA' then
    notify('Installer Warning', 'This installer is in BETA. Expect some bugs.')
    wait(1)
    print(VERISON)
    makefolder('Installer')
    print(executor) -- test
    writefile('Installer/installerverison.txt', VERISON)
else
    print("Verison is not beta.")
    makefolder('Installer')
    writefile('Installer/installerverison.txt', VERISON)
end

function uninstall()
     wait(1)
     print("Starting uninstall.")
     notify("Uninstaller", "Uninstalling..")
     ResetProfiles()
     print("Finished!")
     testUninstaller()
     repeat task.wait() until finishedInstall
     notify("Uninstaller", "Finished uninstalling.")
end

local UTab = Window:MakeTab({
	Name = "Uninstall",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


UTab:AddButton({
    Name = "Remove",
	Callback = function()
         uninstall()
  	end    
})

OrionLib:Init()
