---
--- 云风的class实现
---

local _class={}


local function class(super)
    local class_type={}
    class_type.ctor=false
    class_type.super=super
    local vtbl={}
    class_type.new=function(...)
        local obj={}
        do
            local create
            create = function(c,...)
                if c.super then  ---先create 基类
                    create(c.super,...)
                end
                if c.ctor then
                    c.ctor(obj,...)
                end
            end
            create(class_type,...)---create 本类
        end
        setmetatable(obj,{ __index=vtbl })--_class[class_type]
        return obj
    end

       --- 思考：是否class_type、vtbl指向同一个table?? A:显然是可以的,如下（--For call parent method）
    _class[class_type]=vtbl   ---在全局表_class注册本类类型(虽然在new函数后面，但是执行时机早于new)
    --class_type.base = vtbl  ---By Jay. (为了可以实现子类函数调用基类的虚函数--以下__index = vtbl 代替)
    setmetatable(class_type,{__newindex= ---定义成员变量的时候执行（settable的时候没有改key时执行该元方法）
                             function(t,k,v)
                                 vtbl[k]=v     ---猜测vtbl存在的原因是不能class_type[k]=v（死循环）
                                 --print("本类 newindex：",k,v,t,inspect(t),inspect(vtbl))
                             end,
                            --For call parent method
                             __index = vtbl})


    if super then
        setmetatable(vtbl,{__index=
                           function(t,k)
                               local ret=_class[super][k]  ---子类没有该key，尝试在父类的_class[super]列表拿且赋值给本类table
                               vtbl[k]=ret ---拷贝父类的属性给本类
                               --print("父类：",k,inspect(ret),inspect( _class[super]),inspect(vtbl))
                               return ret
                           end })
    end
    return class_type
end

return class