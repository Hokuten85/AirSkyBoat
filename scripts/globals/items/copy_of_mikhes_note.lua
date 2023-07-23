-----------------------------------------
-- ID: 6162
-- Item: Mikhe's Note
-- A memo scrawled by Mikhe Aryohcha that matter-of-factly states,
-- "Just throw your guard up and it'll all work out."
-- Adventurers note that reading it increases one's guarding skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.GUARD) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.GUARD)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.GUARD)

    if target:getCharMod(xi.mod.GUARD) < 20 then
        target:addCharMod(xi.mod.GUARD,1)
        if target:getCharMod(xi.mod.GUARD) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Mikhe's Note is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
