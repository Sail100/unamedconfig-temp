--[[
    Unnamed Render Config.
    Made by Sail100 and OuterScripts.
    Render by SystemXVoid.
    Credits to SystemXVoid for the uninstaller code.
]]
local goodexecutor = '!'
local VERISON = 'BETA'
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Etruia Installation", HidePremium = false, IntroText = "Etruia installion UI is loading.."})
local lplr = game.Players.LocalPlayer
local httpService = game:GetService('HttpService')
local executor = (identifyexecutor or getexecutorname or function() return 'your executor' end)()
local httprequest = (http and http.request or http_request or fluxus and fluxus.request or request or function() end)
local isfile = isfile or function(file)
    local success, filecontents = pcall(function() return readfile(file) end)
    return success and type(filecontents) == 'string'
end 
print(executor) -- test
local functions = {}  -- might not be used lmao


if executor ~= 'Fluxus' then -- only good executor lmao
      lplr:Kick("Your executor:" ..executor.. " isnt supported! Use Fluxus.")
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

if VERISON == 'BETA' then
    notify('Installer Warning', 'This installer is in BETA. Expect some bugs.')
    wait(1)
    print(VERISON)
    makefolder('Installer')
    writefile('Installer/installerverison.txt', VERISON)
else
    print("Verison is not beta.")
    makefolder('Installer')
    writefile('Installer/installerverison.txt', VERISON)
end

function goodexecutorlol()
     local renderProfilesLoaded
     local profiles = {}
     local profileCache = httpService:JSONDecode(httprequest({Url = 'https://api.github.com/repos/SystemXVoid/Render/contents/Libraries/'..(goodexecutor and 'Profiles')}).Body) 
     for i,v in next, profileCache do -- next might not be needed
            assert(v.name, 'no name found lol')
			table.insert(profiles, v.name) 
     end
     renderProfilesLoaded = true
	 task.wait(0.5)
	
	repeat task.wait() until renderProfilesLoaded
	
	local profiles = {}
    for i,v in next, profiles do
         local contents = httprequest({Url = 'https://raw.githubusercontent.com/SystemXVoid/Render/source/Libraries/'..(goodexecutor and 'Profiles')..'/'..v}).Body
	        if v:find('vapeprofiles') and isfile('vape/Profiles/'..v) then
	            local onlinedata = httpService:JSONDecode(contents)
				local localdata = httpService:JSONDecode(readfile('vape/Profiles/'..v))
				local default = true
						for i2, v2 in next, onlinedata do 
							if localdata[i2] == nil or v2.Selected then 
								if not default then 
									default = (v2.Selected ~= true) 
								end
								localdata[i2] = {Selected = v2.Selected or localdata[i2].Selected, Keybind = v2.Keybind == '' and localdata[i2].Keybind or v2.Keybind}
							end
						end
						localdata.default = (localdata.default or {Selected = default, Keybind = ''})
						localdata.default.Selected = default
						writefile('vape/Profiles/'..v, httpService:JSONEncode(localdata)) 
					end
				end
			end
		end
	end
else
	writefile('vape/Profiles/'..v, contents)
end

function uninstall()
     wait(1)
     print("Starting uninstall.")
     goodexecutorlol()
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
