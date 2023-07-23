-----------------------------------------
-- ID: 6157
-- Item: Ferreous's Diary
-- A diary written by Ferreous Coffin that describes his encounters with Orcs in the north.
-- So many were there that his war hammer became coated with a thick layer of blood after all was said and done.
-- Adventurers note that reading it increases one's club skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.CLUB) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.CLUB)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.CLUB)

    if target:getCharMod(xi.mod.CLUB) < 20 then
        target:addCharMod(xi.mod.CLUB,1)
        if target:getCharMod(xi.mod.CLUB) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Ferreous's Diary is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
