--_G.inspect = require("lib/inspect")
require("macro")
--主入口函数。从这里开始lua逻辑
function Main()

	print("--主入口函数")

	local person = class()
	person.name = "人"
	local man = class(person)
	print("",person.name ,man.name)
end

--场景切换通知
function OnLevelWasLoaded(level)
	collectgarbage("collect")
	Time.timeSinceLevelLoad = 0
end

function OnApplicationQuit()
end