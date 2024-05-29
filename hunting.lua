
local zone = require("zone")




function MobDetected()
    math.randomseed(os.time())
    local selection = math.random(1, #zone.caveZone.mobs)
    local randomMob = zone.caveZone.mobs[selection]

    io.write("Un" .. " " .. randomMob .. " " .. "vous attaque")
end

-- Function Hunting

function HuntingMob()
    local sleep_cmd = package.config:sub(1, 1) == "\\" and "timeout /t 1 >nul " or "sleep 1"
    local function sleep(seconds)
        os.execute(sleep_cmd)
    end
    local numberFinded = 0
    while numberFinded ~= 1 do
        math.randomseed(os.time())

        local numberToFind = 2
        local randomNumber = math.random(1, 2)

        for i = 1, 3 do
            io.write("\rVous etes en recherche" .. string.rep(".", i % 4))
            io.flush()
            sleep(1)
        end

        if numberToFind == randomNumber then
            numberFinded = 1
        end
    end
    io.write("\r" .. string.rep(" ", 25) .. "\r")
    MobDetected()
end
