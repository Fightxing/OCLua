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