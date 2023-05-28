-----------------------------------
-- Area: Port Jeuno
--  NPC: Synergy Furnace
-- Type: Synergy Furnace
-- !pos -65.063 0.000 6.551 197
-----------------------------------
require("scripts/globals/abyssea")
require("scripts/globals/synergy")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
	xi.synergy.onTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option, npc)

end

return entity
