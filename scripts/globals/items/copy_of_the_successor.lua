-----------------------------------------
-- ID: 6164
-- Item: The Successor
-- An essay authored by Cerane I Virgaut,
-- mainly concerning the night Perseus bequeathed unto her an exemplary shield.
-- Adventurers note that reading it increases one's shield skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.SHIELD) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.SHIELD)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.SHIELD)

    if target:getCharMod(xi.mod.SHIELD) < 20 then
        target:addCharMod(xi.mod.SHIELD,1)
        if target:getCharMod(xi.mod.SHIELD) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of The Successor is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
