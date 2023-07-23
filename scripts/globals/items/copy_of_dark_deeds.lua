-----------------------------------------
-- ID: 6171
-- Item: Dark Deeds
-- A guide to the finer points of insidious dark magic, as compiled by Azima.
-- Proceeds from this tome have gone to fund her various purchases dealing with alchemical research.
-- Adventurers note that reading it increases one's dark magic skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.DARK) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.DARK_MAGIC)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.DARK_MAGIC)

    if target:getCharMod(xi.mod.DARK) < 20 then
        target:addCharMod(xi.mod.DARK,1)
        if target:getCharMod(xi.mod.DARK) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Dark Deeds is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
