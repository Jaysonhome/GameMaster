--_G.inspect = require("lib/inspect")

--主入口函数。从这里开始lua逻辑
function Main()					
	print("--主入口函数")
end

--场景切换通知
function OnLevelWasLoaded(level)
	collectgarbage("collect")
	Time.timeSinceLevelLoad = 0
end

function OnApplicationQuit()
end