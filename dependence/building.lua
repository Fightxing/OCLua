function buildLine() -- 用于建造一整条线
    while (not robot.detectDown()) do
        if(robot.count()==0) then
            slot=slot+1
            robot.select(slot)  -- 如果这个物品栏的物品数量是 0（没了）就换到下一格子
        end
        robot.placeDown()
        robot.forward()
    end
end