-----------------------------------------
-- ID: 6170
-- Item: Bounty List
-- A simple list of known criminals who are better off dead.
-- Every single name is crossed out in Azima's handwriting.
-- Adventurers note that reading it increases one's elemental magic skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.ELEM) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.ELEMENTAL_MAGIC)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.ELEMENTAL_MAGIC)

    if target:getCharMod(xi.mod.ELEM) < 20 then
        target:addCharMod(xi.mod.ELEM,1)
        if target:getCharMod(xi.mod.ELEM) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Bounty List is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
