local robot_api = require("robot")

function buildLine()
    while (not robot.detectDown()) do
        if(robot.count()==0) then
            slot=slot+1
            robot.select(slot)  -- 如果这个物品栏的物品数量是 0（没了）就换到下一格子
        end
        robot.placeDown()
        robot.forward()
    end
end

function turnL()
    robot.back()
    robot.turnLeft()
    robot.forward()
    robot.turnLeft()
end

function turnR()
    robot.back()
    robot.turnRight()
    robot.forward()
    robot.turnRight()
end

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
