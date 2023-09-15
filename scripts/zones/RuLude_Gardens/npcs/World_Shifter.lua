-----------------------------------
-- Area: Ru'Lud Gardens
--  NPC: World_Shifter
-----------------------------------
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
	npc:facePlayer(player, true)
	npc:setRotation(npc:getRotPos())
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
