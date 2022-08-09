-- 用于填造陆地

local r = require("robot")

function turnL() -- 左转
    r.turnLeft()
    r.forward()
    r.turnLeft()
end

function turnR() -- 右转
    r.turnRight()
    r.forward()
    r.turnRight()
end

function switchInventory() -- 用于在当前物品栏物品用完后换到下一个物品栏
    if(r.count()==0) then
            slot=slot+1
            r.select(slot) 
        end
end

local c = require("component")

function finishTone()   -- 完成后提示
    tones = {261,293,329,349,392}
    for i,v in ipairs(tones) do
        c.computer.beep(v,sec)
    end
end

slot=1
r.select(1)     -- 初始化物品栏选择

-- 判断机器人处于哪个角
r.turnLeft()
r.forward()
if (r.detectDown()) then
    isLeftSide = true
end -- 如果左侧有方块，说明机器人在左侧，反之右侧
r.back()
r.turnRight()   -- 归位

while 1 do
    buildLine()
    if(isLeftSide) then
        r.back()
        turnR()
        isLeftSide=false
    else
        r.back()
        turnL()
        isLeftSide=true
    end     -- 左边向右建造，右边向左建造，造完一条就交换
    if(r.detectDown()) then
        break   -- 如果掉头之后还是有方块，说明建到边框了，可以停下了
    end
end
