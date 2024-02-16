--[[

    Unnamed Render Config.
    Made by Sail100 and OuterScripts.
    Render by SystemXVoid.
    Credits to SystemXVoid for for some local stuff
    
]]

local goodexecutor
local version = 'beta'
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local lplr = game.Players.LocalPlayer
local httpService = game:GetService('HttpService')
local executor = (identifyexecutor or getexecutorname or function() return 'your executor' end)()
local httprequest = (http and http.request or http_request or fluxus and fluxus.request or request or function() end)
local setclipboard = setclipboard or function(data) writefile('clipboard.txt', data) end
local rbxanalytics = game:GetService("RbxAnalyticsService")
local hwid = rbxanalytics:GetClientId()
local File1 = game:HttpGet("https://raw.githubusercontent.com/Sail100/unamedconfig-temp/main/Installer/Profiles/6872274481.vapeprofile.txt")
local File2 = game:HttpGet("https://raw.githubusercontent.com/Sail100/unamedconfig-temp/main/Installer/Profiles/6872265039GUIPositions.vapeprofile.txt")
local File3 = game:HttpGet("https://raw.githubusercontent.com/Sail100/unamedconfig-temp/main/Installer/Profiles/6872265039.vapeprofile.txt")
local isfile = isfile or function(file)
    local success, filecontents = pcall(function() return readfile(file) end)
    return success and type(filecontents) == 'string'
end 

local Window = Fluent:CreateWindow({
    Title = "Unnamedconfig " .. version,
    SubTitle = "by sammz and outer",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Credits = Window:AddTab({ Title = "Credits", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

function cancelnotification()
    Fluent:Notify({
        Title = "Cancel",
        Content = "The action was cancelled.",
        Duration = 5 -- Set to nil to make the notification not disappear
    })
end

function notify(name, text)
    Fluent:Notify({
        Title = name,
        Content = text,
        Duration = 5 -- Set to nil to make the notification not disappear
    })
end

if executor ~= 'Fluxus' then -- only good executor lmao
    lplr:Kick("Your executor isnt supported! Use Fluxus.")
else
    notify("Installer", "supported, executor: "..executor)
end


function failnotification()
    Fluent:Notify({
        Title = "Module",
        Content = "The operation failed.",
        Duration = 5 -- Set to nil to make the notification not disappear
    })
end

function copiednotification()
    Fluent:Notify({
        Title = "Clipboard",
        Content = "Copied to clipboard.",
        Duration = 5 -- Set to nil to make the notification not disappear
    })
end



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

function uninstall()
    repeat task.wait() until uninstalled == true
    ResetProfiles()
    print("Finished!")
    notify("Uninstaller", "Finished uninstalling.")
    local uninstalled = true
end


Tabs.Main:AddButton({
    Title = "Install",
    Description = "Installs the config.",
    Callback = function()
        Window:Dialog({
            Title = "Install",
            Content = "Are you sure you want to proceed?",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        ResetProfiles()
                        
                        writefile('vape/Profiles/6872274481.vapeprofile.txt', File1)
                        writefile('vape/Profiles/6872265039GUIPositions.vapeprofile.txt', File2)
                        writefile('vape/Profiles/6872265039.vapeprofile.txt', File3)
                        
                        Fluent:Notify({
                            Title = "Install",
                            Content = "Finished Installing!",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        })
                        
                        task.wait(2)
                        
                        do
                            Window:Dialog({
                                Title = "Installer",
                                Content = "Do you want to load Render?",
                                Buttons = {
                                    {
                                        Title = "Yes!",
                                        Callback = function()
                                            loadfile("vape/NewMainScript.lua")
                                        end
                                    },
                                    {
                                        Title = "No.",
                                        Callback = function()
                                            cancelnotification()
                                        end
                                    }
                                }
                            })
                        end
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        cancelnotification()
                    end
                }
            }
        })
    end
})

Tabs.Main:AddButton({
    Title = "Uninstall",
    Description = "Uninstalls the config.",
    Callback = function()
        Window:Dialog({
            Title = "Uninstall",
            Content = "Are you sure you want to proceed?",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        uninstall()
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        cancelnotification()
                    end
                }
            }
        })
    end
})

Tabs.Credits:AddButton({
    Title = "Support us",
    Description = "wanna support us?.",
    Callback = function()
        Window:Dialog({
            Title = "Support us",
            Content = "Which one?",
            Buttons = {
                {
                    Title = "Sammz",
                    Callback = function()
                        setclipboard("https://youtube.com/@kwlzi")
                        copiednotification()
                    end
                },
                {
                    Title = "Outer",
                    Callback = function()
                        setclipboard("https://youtube.com/@OuterScripts")
                        copiednotification()
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        cancelnotification()
                    end
                }
            }
        })
    end
})


InterfaceManager:SetLibrary(Fluent)
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
