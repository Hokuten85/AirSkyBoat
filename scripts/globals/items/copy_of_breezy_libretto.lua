-----------------------------------------
-- ID: 6172
-- Item: Breezy Libretto
-- A musical score composed by Lewenhart.
-- Its notes symbolize a fragrant, early morning summer breeze.
-- Adventurers note that reading it increases one's singing skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.SINGING) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.SINGING)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.SINGING)

    if target:getCharMod(xi.mod.SINGING) < 20 then
        target:addCharMod(xi.mod.SINGING,1)
        if target:getCharMod(xi.mod.SINGING) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Breezy Libretto is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
