--player
player = {}
player.name = "Marcus"
player.health = 100
player.maxHealth = 100
player.level = 1
player.xp = 0
player.ranking = 0
player.inventory = {"Epee", "Potion"}
player.location = ""
player.gold = 1000

--Weapons

--mobs Stats
decayed_zombie = {}
decayed_zombie.name = "Zombie decomposee"
decayed_zombie.health = 20
decayed_zombie.level = 1
decayed_zombie.damage = 5
decayed_zombie.drop = {}

viscious_snake = {}
viscious_snake.name = "Serpent viscieux"

--World
zone = {}
zone.caveZone = {}
zone.caveZone.name = "Caverne"
zone.caveZone.map_level = 1
zone.caveZone.mobs = {decayed_zombie.name, viscious_snake.name}

--fonctions

function exit()
    io.write("Vous avez quitter le jeu")
    gameStart = 0
end

function Answer()
    local playerAnswer = io.read()
    return playerAnswer
end

function ShowPlayer()
    print("Sante :" .. player.health)
    print("Niveau :" .. " " .. player.level)
    print("Rang:" .. " " .. player.ranking)
    print("Location :" .. " " .. player.location)
end

function ShowInventory()
    print("Inventaire :")
    for i, item in ipairs(player.inventory) do
        print("-" .. item)
    end
end

-- Function mob detection
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

function mobsCaveXpDrop()
    math.randomseed(os.time())
    local xpAmount = math.random(50, 200)
    player.xp = player.xp + xpAmount
end

--World Functions

function Cave()
    player.location = "cave"
    print(
        "Vous voici dans la caverne, vous souhaitez :\n 1. Chasser des monstres.\n 2. Afficher personnage.\n 3. Sortir"
    )

    local caveAction = {
        ["1"] = HuntingMob,
        ["2"] = ShowPlayer,
        ["3"] = Village
    }
    local userAnswer = Answer()
    local action = caveAction[userAnswer]

    if action then
        action()
    end
end

function Portal()
    player.location = "Portail"
    print("Bienvenue dans votre royaume seigneur" .. " " .. player.name .. "!")
    print("Ou souahitez-vous allez?")
    print(
        " 1.Caverne.\n 2.Village.\n 3.Arene de Lords.\n 4.Foret.\n 5.Afficher le personnage.\n 6.Afficher l'inventaire\n 7.Sortir"
    )
    local portalAction = {
        ["1"] = Cave,
        ["2"] = Village,
        ["3"] = LordsArena,
        ["4"] = Forest,
        ["5"] = ShowPlayer,
        ["6"] = ShowInventory,
        ["7"] = exit
    }
    local userAnswer = Answer()
    local action = portalAction[userAnswer]

    if action then
        action()
    end
end

function Shop()
    player.location = "Magasin"
    print("Vous etes au magasin")
end

function LordsArena()
    player.location = "Arene"
    print("Vous etes dans l'arene des Lords")
end

function Village()
    print("Vous etes au village")
    print("1. Vous reposer (sauvegarde)")
    print("2. Allez au magasin")
    print("3. Allez au portail")
end

function Forest()
    print("Vous etes dans la foret")
end

--Mobs List

--lords

Portal()
