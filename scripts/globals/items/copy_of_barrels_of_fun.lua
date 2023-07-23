-----------------------------------------
-- ID: 6160
-- Item: Barrels of Fun
-- An educational text authored by Elivira Gogol.
-- It discusses how to dismantle, clean, and reconstruct firearms in careful detail.
-- Adventurers note that reading it increases one's marksmanship skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
	if target:getCharMod(xi.mod.MARKSMAN) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.MARKSMANSHIP)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.MARKSMANSHIP)

    if target:getCharMod(xi.mod.MARKSMAN) < 20 then
        target:addCharMod(xi.mod.MARKSMAN,1)
        if target:getCharMod(xi.mod.MARKSMAN) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Barrels of Fun is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
