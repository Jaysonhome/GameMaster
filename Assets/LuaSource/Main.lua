
require("macro")
local Image = require("game.image")
local RawImage = require("game.rawimage")


--主入口函数。从这里开始lua逻辑
function Main()

	print("//////////////// - 主入口函数 - ////////////" )

	local t = {2}

	--local before = GetMem()

	--assert(0==nil,"0==nil 错误")
	--assert(0==false,"0==false 错误")

	local res = true==(not nil)
	assert(res,"false==nil 错误")
	print("1 ",(true==(not nil)) )
	print("11 ",(false==( nil)) )
	print("2 ",(not nil) )
	print("3  ",(not 0) )

	if false==( nil) then

	end

	if false==( nil) then

	end
end

--场景切换通知
function OnLevelWasLoaded(level)
	collectgarbage("collect")
	Time.timeSinceLevelLoad = 0
end

function OnApplicationQuit()
end

-----

function GetMem()
	return collectgarbage("count")
end