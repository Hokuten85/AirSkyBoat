-----------------------------------------
-- ID: 6174
-- Item: Beaming Score
-- A musical score composed by Lewenhart.
-- Its notes symbolize the gently glowing beams of light that filter through the leaves of a deciduous tree in the late afternoon.
-- Adventurers note that reading it increases one's wind instrument skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.WIND) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.WIND_INSTRUMENT)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.WIND_INSTRUMENT)

    if target:getCharMod(xi.mod.WIND) < 20 then
        target:addCharMod(xi.mod.WIND,1)
        if target:getCharMod(xi.mod.WIND) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Beaming Score is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
