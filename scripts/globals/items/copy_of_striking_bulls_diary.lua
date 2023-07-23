-----------------------------------------
-- ID: 6151
-- Item: Bull's Diary
-- An account penned by Striking Bull during the Second Battle of Konschtat.
-- It details the Republic's victory over King Raigegue the Lupine's San d'Orian army.
-- Adventurers note that reading it increases one's axe skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.AXE) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.AXE)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.AXE)

    if target:getCharMod(xi.mod.AXE) < 20 then
        target:addCharMod(xi.mod.AXE,1)
        if target:getCharMod(xi.mod.AXE) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Bull's Diary is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
