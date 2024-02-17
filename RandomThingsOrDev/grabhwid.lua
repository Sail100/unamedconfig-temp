local rbxanalytics = game:GetService("RbxAnalyticsService")
local hwid = rbxanalytics:GetClientId()

setclipboard(hwid)
