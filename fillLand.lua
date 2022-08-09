local r = require("robot")
dofile("dependence/moving.lua")
dofile("dependence/building.lua")



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
