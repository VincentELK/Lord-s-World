local mobs = require("mobs")

zone = {}
zone.caveZone = {}
zone.caveZone.name = "Caverne"
zone.caveZone.map_level = 1
zone.caveZone.mobs = {mobs.decayed_zombie.name, mobs.viscious_snake.name}

return zone
