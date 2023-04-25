-----------------------------------
--  ID: 4263
--  Item: Blue Drop
--  Mind 5
-----------------------------------
require("scripts/globals/status")
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
    target:addStatusEffect(xi.effect.MND_BOOST, 5, 0, 900)
    target:addStatusEffect(xi.effect.MEDICINE, 0, 0, 3600)

    if target:getCharMod(xi.mod.MND) < 20 then
        target:addCharMod(xi.mod.MND,1)
    end
end

return itemObject
