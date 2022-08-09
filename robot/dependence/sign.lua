local c = require("component")

function finishTone()
    tones = {261,293,329,349,392}
    for i,v in ipairs(tones) do
        c.computer.beep(v,sec)
    end
end
