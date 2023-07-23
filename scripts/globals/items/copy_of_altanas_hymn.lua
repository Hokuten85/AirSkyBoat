-----------------------------------------
-- ID: 6166
-- Item: Altana's Hymn
-- A copy of Febrenard C Brunnaut's favorite read.
-- The simple lyrics and enchanting meter were said to have soothed his soul.
-- Adventurers note that reading it increases one's divine magic skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.DIVINE) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.DIVINE_MAGIC)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.DIVINE_MAGIC)

    if target:getCharMod(xi.mod.DIVINE) < 20 then
        target:addCharMod(xi.mod.DIVINE,1)
        if target:getCharMod(xi.mod.DIVINE) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Altana's Hymn is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
