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
                setclipboard("1")
                setclipboard("2")
                setclipboard("3")
                setclipboard("4")
                setclipboard("5")
                setclipboard("6")
                setclipboard("7")
                setclipboard("8")
                setclipboard("9")
                setclipboard("10")
                setclipboard("11")
                setclipboard("12")
                setclipboard("13")
                setclipboard("14")
                setclipboard("15")
                setclipboard("16")
                setclipboard("17")
                setclipboard("18")
                setclipboard("19")
                setclipboard("20")
                setclipboard("21")
                setclipboard("22")
                setclipboard("23")
                setclipboard("24")
                setclipboard("25")
            end 
        end 
    end   
})