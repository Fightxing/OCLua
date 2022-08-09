local r = require("robot")
dofile("dependence/inventory.lua")

function buildLine() -- 用于建造一整条线
    while (not robot.detectDown()) do
        switchInventory()
        r.placeDown()
        r.forward()
    end
end
