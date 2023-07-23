-----------------------------------------
-- ID: 6167
-- Item: Coveffe Musings
-- A collection of thoughts scribbled out by Ferreous Coffin on his visit to Coveffe Barrows.
-- Adventurers note that reading it increases one's healing magic skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.HEALING) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.HEALING_MAGIC)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.HEALING_MAGIC)

    if target:getCharMod(xi.mod.HEALING) < 20 then
        target:addCharMod(xi.mod.HEALING,1)
        if target:getCharMod(xi.mod.HEALING) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Coveffe Musings is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
