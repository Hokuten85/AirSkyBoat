-----------------------------------------
-- ID: 6175
-- Item: Yomi's Diagram
-- A meticulously drawn diagram Yomi made for Kagetora explaining how to construct certain ninja tools.
-- Adventurers note that reading it increases one's ninjutsu skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.NINJUTSU) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.NINJUTSU)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.NINJUTSU)

    if target:getCharMod(xi.mod.NINJUTSU) < 20 then
        target:addCharMod(xi.mod.NINJUTSU,1)
        if target:getCharMod(xi.mod.NINJUTSU) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Yomi's Diagram is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
