-----------------------------------------
-- ID: 6176
-- Item: Astral Homeland
-- A specious work written by an unknown individual that both reads and feels like an illusion from the ancient past.
-- It discusses the world avatars inhabit, but seems too absurd to be true.
-- Adventurers note that reading it increases one's summoning magic skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.SUMMONING) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.SUMMONING_MAGIC)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.SUMMONING_MAGIC)

    if target:getCharMod(xi.mod.SUMMONING) < 20 then
        target:addCharMod(xi.mod.SUMMONING,1)
        if target:getCharMod(xi.mod.SUMMONING) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Astral Homeland is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
