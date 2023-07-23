-----------------------------------------
-- ID: 6159
-- Item: Perih's Primer
-- A guidebook Perih Vashai jotted down for the edification of new recruits.
-- It discusses everything from the various ways of holding a bow to methods of judging distance.
-- Adventurers note that reading it increases one's archery skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.ARCHERY) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.ARCHERY)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.ARCHERY)

    if target:getCharMod(xi.mod.ARCHERY) < 20 then
        target:addCharMod(xi.mod.ARCHERY,1)
        if target:getCharMod(xi.mod.ARCHERY) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Perih's Primer is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
