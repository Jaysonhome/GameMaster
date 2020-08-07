--本文件弃用。入口修改为： D:\Z_Jay\Git\GameMaster\Assets\LuaSource\Main.lua
--主入口函数。从这里开始lua逻辑
function Main()					
	print("logic start")

	local t = {
	1,2,3,4,
	}

end

--场景切换通知
function OnLevelWasLoaded(level)
	collectgarbage("collect")
	Time.timeSinceLevelLoad = 0
end

function OnApplicationQuit()
end