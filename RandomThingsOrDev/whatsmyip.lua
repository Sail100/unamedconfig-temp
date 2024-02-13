-- tells you your ip
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Whats My IP? | Roblox Version", IntroEnabled = false})
local friendlything = game:HttpGet("https://api.ipify.org")
local useragentandstuff = game:HttpGet("https://httpbin.org/get")

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "IP: "..friendlything
})

local Section2 = Tab:AddSection({
	Name = "extra: "..useragentandstuff
})