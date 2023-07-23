-----------------------------------------
-- ID: 6149
-- Item: Swing and Stab
-- Ulla wrote this guide on sword wielding
-- from how to grip the hilt to tips on footwork
-- so others could follow in her footsteps.
-- Adventurers note that reading it increases one's sword skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.SWORD) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.SWORD)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.SWORD)

    if target:getCharMod(xi.mod.SWORD) < 20 then
        target:addCharMod(xi.mod.SWORD,1)
        if target:getCharMod(xi.mod.SWORD) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Swing and Stab is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
