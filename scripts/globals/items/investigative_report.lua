-----------------------------------------
-- ID: 6169
-- Item: Inv. Report
-- A collection of observations made by Rainemard on a particular exploration.
-- It goes into such detail on so much minutiae that many admit to never finishing it.
-- Adventurers note that reading it increases one's enfeebling magic skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.ENFEEBLE) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.ENFEEBLING_MAGIC)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.ENFEEBLING_MAGIC)

    if target:getCharMod(xi.mod.ENFEEBLE) < 20 then
        target:addCharMod(xi.mod.ENFEEBLE,1)
        if target:getCharMod(xi.mod.ENFEEBLE) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Inv. Report is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
