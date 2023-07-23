-----------------------------------------
-- ID: 6165
-- Item: Kage. Journal
-- A journal kept by Kagetora that delineates the extent to which
-- he and Yomi lost themselves in their studies of the martial arts
-- Adventurers note that reading it increases one's parrying skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.PARRY) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.PARRY)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.PARRY)

    if target:getCharMod(xi.mod.PARRY) < 20 then
        target:addCharMod(xi.mod.PARRY,1)
        if target:getCharMod(xi.mod.PARRY) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Kage. Journal is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
