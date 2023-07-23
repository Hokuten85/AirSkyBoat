-----------------------------------------
-- ID: 6155
-- Item: Kagetora's Diary
-- A diary written by Kagetora.
-- In it he details each and every one of his ninety-eight victories and ninety-nine losses against Yomi.
-- Adventurers note that reading it increases one's katana skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.KATANA) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.KATANA)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.KATANA)

    if target:getCharMod(xi.mod.KATANA) < 20 then
        target:addCharMod(xi.mod.KATANA,1)
        if target:getCharMod(xi.mod.KATANA) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Kagetora's Diary is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
