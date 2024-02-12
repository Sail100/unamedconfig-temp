-- this spams your clipboard
local setclipboard = setclipboard or function(data) writefile('clipboard.txt', data) end
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Clipboard Spammer", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Spammer",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddToggle({
	Name = "Spammer",
	Default = false,
	Callback = function(callback)
        if callback then
            repeat
                setclipboard("apple")
                setclipboard("blanked is cool")
                setclipboard("champion is weird")
                setclipboard("delta")            
                setclipboard("end function")
                setclipboard("fluxus")
                setclipboard("green")
                setclipboard("hi")
                setclipboard("itch")
                setclipboard("just kidding")
                setclipboard("keep")
                setclipboard("lamp")
                setclipboard("month")
                setclipboard("nuts")
                setclipboard("outer")
                setclipboard("punk team")
                setclipboard("queen")
                setclipboard("run")
                setclipboard("sammz")
                setclipboard("trenches")
                setclipboard("undo")
                setclipboard("venus")
                setclipboard("when")
                setclipboard("xenon")
                setclipboard("youve")
                setclipboard("zen")
            end
        end 
    end   
})