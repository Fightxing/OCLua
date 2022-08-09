function turnL() -- 左转
    robot.back()
    robot.turnLeft()
    robot.forward()
    robot.turnLeft()
end

function turnR() -- 右转
    robot.back()
    robot.turnRight()
    robot.forward()
    robot.turnRight()
end