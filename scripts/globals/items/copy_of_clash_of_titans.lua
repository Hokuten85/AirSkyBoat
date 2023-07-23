-----------------------------------------
-- ID: 6154
-- Item: Clash of Titans
-- An article detailing the duel between Yrvaulair S Cousseraux
-- and Alphonimile M Aurchiat that became all the rage in San d'Oria after appearing in a popular newspaper.
-- Adventurers note that reading it increases one's polearm skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.POLEARM) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.POLEARM)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.POLEARM)

    if target:getCharMod(xi.mod.POLEARM) < 20 then
        target:addCharMod(xi.mod.POLEARM,1)
        if target:getCharMod(xi.mod.POLEARM) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Clash of Titans is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
