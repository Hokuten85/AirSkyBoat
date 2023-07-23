-----------------------------------------
-- ID: 6161
-- Item: T.W. Enchiridion
-- A guide to the finer points of hurling projectile objects at opponents,
-- written by an anonymous individual.
-- Adventurers note that reading it increases one's throwing skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.THROW) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.THROWING)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.THROWING)

    if target:getCharMod(xi.mod.THROW) < 20 then
        target:addCharMod(xi.mod.THROW,1)
        if target:getCharMod(xi.mod.THROW) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of T.W. Enchiridion is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
