-----------------------------------------
-- ID: 6173
-- Item: Cavernous Score
-- A musical score composed by Lewenhart.
-- Its notes symbolize the damp and musty air that stagnates within an underground cave.
-- Adventurers note that reading it increases one's string instrument skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.STRING) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.STRING_INSTRUMENT)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.STRING_INSTRUMENT)

    if target:getCharMod(xi.mod.STRING) < 20 then
        target:addCharMod(xi.mod.STRING,1)
        if target:getCharMod(xi.mod.STRING) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Cavernous Score is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
