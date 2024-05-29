--REQUIRE
local player = require("player")
local mobs = require("mobs")
require("world_function")
local zone = require("zone")
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

--World Functions

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
