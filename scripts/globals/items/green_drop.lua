-----------------------------------
--  ID: 4260
--  Item: Green Drop
--  Agility 5
-----------------------------------
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:hasStatusEffect(xi.effect.MEDICINE) then
        return xi.msg.basic.ITEM_NO_USE_MEDICATED
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.AGI_BOOST, 5, 0, 900)
    target:addStatusEffect(xi.effect.MEDICINE, 0, 0, 3600)

    if target:getCharMod(xi.mod.AGI) < 20 then
        target:addCharMod(xi.mod.AGI,1)
        if target:getCharMod(xi.mod.AGI) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Yellow Drops is allowed")
            target:PrintToPlayer("but only the medicine effect will be applied.")
        end
    end
end

return itemObject
