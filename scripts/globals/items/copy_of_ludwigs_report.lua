-----------------------------------------
-- ID: 6153
-- Item: Ludwig's Report
-- A report made by Ludwig Eichberg regarding the Battle of Grauberg.
-- It details the constant changes in the position of the front line and the withdrawal of Republic troops.
-- Adventurers note that reading it increases one's scythe skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.SCYTHE) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.SCYTHE)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.SCYTHE)

    if target:getCharMod(xi.mod.SCYTHE) < 20 then
        target:addCharMod(xi.mod.SCYTHE,1)
        if target:getCharMod(xi.mod.SCYTHE) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Ludwig's Report is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
