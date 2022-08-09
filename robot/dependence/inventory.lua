local r = require("robot")
slot=1
r.select(1)

function switchInventory() -- 用于在当前物品栏物品用完后换到下一个物品栏
    if(r.count()==0) then
            slot=slot+1
            r.select(slot) 
        end
end