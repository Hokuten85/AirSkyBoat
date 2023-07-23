-----------------------------------------
-- ID: 6179
-- Item: The Bell Tolls
-- An essay penned by Hrohj Wagrehsa concerning the transmission of Sih Renaye's handbell and the voice of the land.
-- Adventurers note that reading it increases one's handbell skill.
-----------------------------------------
require("scripts/globals/item_utils")
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getCharMod(xi.mod.HANDBELL_SKILL) < 20 then
		return 0
	end
    return xi.item_utils.skillBookCheck(target, xi.skill.HANDBELL)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.HANDBELL)

    if target:getCharMod(xi.mod.HANDBELL_SKILL) < 20 then
        target:addCharMod(xi.mod.HANDBELL_SKILL,1)
        if target:getCharMod(xi.mod.HANDBELL_SKILL) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of The Bell Tolls is allowed")
            target:PrintToPlayer("but only the skillup will be applied.")
        end
    end
end

return itemObject
