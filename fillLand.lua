dofile("dependence/moving.lua")
dofile("dependence/building.lua")

local robot = require("robot")

-- 判断机器人处于哪个角
robot.turnLeft()
robot.forward()
if (robot.detectDown()) then
    isLeftSide = true
end -- 如果左侧有方块，说明机器人在左侧，反之右侧
robot.back()
robot.turnRight()   -- 归位

slot = 1    -- 初始化物品栏选择 
robot.select(1)
while 1 do
    buildLine() -- 建到对面去
    if(isLeftSide) then
        turnR()
        isLeftSide=false
    else
        turnL()
        isLeftSide=true
    end     -- 左边向右建造，右边向左建造，造完一条就交换
    if(robot.detectDown()) then
        break   -- 如果掉头之后还是有方块，说明建到边框了，可以停下了
    end
end
