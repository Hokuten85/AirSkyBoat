-----------------------------------------
-- ID: 6148
-- Item: Dagger enchiridion
-- A guide to the finer points of wielding a dagger,
-- written by an anonymous individual.
-- Adventurers note that reading it increases one's dagger skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.DAGGER) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.DAGGER)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.DAGGER)

    if target:getCharMod(xi.mod.DAGGER) < 20 then
        target:addCharMod(xi.mod.DAGGER,1)
        if target:getCharMod(xi.mod.DAGGER) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Dagger enchiridion is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
