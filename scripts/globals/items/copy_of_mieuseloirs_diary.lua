-----------------------------------------
-- ID: 6150
-- Item: Mieuseloir's Diary
-- An account penned by Mieuseloir B Enchelles of his encounters with the Gigas in Beaucedine Glacier.
-- Adventurers note that reading it increases one's great sword skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.GSWORD) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.GREAT_SWORD)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.GREAT_SWORD)

    if target:getCharMod(xi.mod.GSWORD) < 20 then
        target:addCharMod(xi.mod.GSWORD,1)
        if target:getCharMod(xi.mod.GSWORD) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Mieuseloir's Diary is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
