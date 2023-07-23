-----------------------------------------
-- ID: 6152
-- Item: Death for Dimwits
-- A guide to the finer points of hacking everything in one's way to pieces with a two-handed axe,
-- written by an anonymous individual.
-- Adventurers note that reading it increases one's great axe skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.GAXE) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.GREAT_AXE)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.GREAT_AXE)

    if target:getCharMod(xi.mod.GAXE) < 20 then
        target:addCharMod(xi.mod.GAXE,1)
        if target:getCharMod(xi.mod.GAXE) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Death for Dimwits is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
