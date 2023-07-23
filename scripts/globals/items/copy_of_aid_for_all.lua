-----------------------------------------
-- ID: 6168
-- Item: Aid for All
-- A guide to the finer points of heightening the potential of one's compatriots, written by Rainemard.
-- It also includes some tips on how to swing special swords.
-- Adventurers note that reading it increases one's enhancing magic skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.ENHANCE) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.ENHANCING_MAGIC)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.ENHANCING_MAGIC)

    if target:getCharMod(xi.mod.ENHANCE) < 20 then
        target:addCharMod(xi.mod.ENHANCE,1)
        if target:getCharMod(xi.mod.ENHANCE) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Aid for All is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
