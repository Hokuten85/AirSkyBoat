-----------------------------------------
-- ID: 6178
-- Item: Hrohj's Record
-- A record of what happened on the fateful day the lifestream overflowed,
-- as kept by Hrohj Wagrehsa.
-- Adventurers note that reading it increases one's geomancy skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.GEOMANCY_SKILL) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.GEOMANCY)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.GEOMANCY)

    if target:getCharMod(xi.mod.GEOMANCY_SKILL) < 20 then
        target:addCharMod(xi.mod.GEOMANCY_SKILL,1)
        if target:getCharMod(xi.mod.GEOMANCY_SKILL) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Hrohj's Record is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
