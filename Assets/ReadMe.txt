【修改ToLua根目录时修改配置路径】
LuaConst.cs
    public static string luaDir = Application.dataPath + "/ToLuaLib/Lua";                //lua逻辑代码目录
    public static string toluaDir = Application.dataPath + "/ToLuaLib/ToLua/Lua";        //tolua lua文件目录
	
CustomSettings.cs
	   public static string saveDir = Application.dataPath + "/ToLuaLib/Source/Generate/";    
    public static string toluaBaseType = Application.dataPath + "/ToLuaLib/ToLua/BaseType/";
    public static string baseLuaDir = Application.dataPath + "/ToLuaLib/ToLua/Lua/";
    public static string injectionFilesPath = Application.dataPath + "/ToLuaLib/ToLua/Injection/";