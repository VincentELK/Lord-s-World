local player = require("player")
local mobs = require("mobs")
require("hunting")
local player = require("player")

-- Fonction d'entrée utilisateur

function Answer()
    local playerAnswer = io.read()
    return playerAnswer
end

--Fonction de la cave

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

-- Fonction du portail

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
