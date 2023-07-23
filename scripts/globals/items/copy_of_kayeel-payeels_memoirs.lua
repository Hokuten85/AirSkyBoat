-----------------------------------------
-- ID: 6158
-- Item: K-P's Memoirs
-- Memoirs penned by Kayeel-Payeel.
-- They describe in particular detail the time he received Claustrum from the Warlock Warlord Robel-Akbel.
-- Adventurers note that reading them increases one's staff skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.STAFF) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.STAFF)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.STAFF)

    if target:getCharMod(xi.mod.STAFF) < 20 then
        target:addCharMod(xi.mod.STAFF,1)
        if target:getCharMod(xi.mod.STAFF) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of K-P's Memoirs is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
