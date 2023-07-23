-----------------------------------
--  ID: 4265
--  Item: Black Drop
--  Transports the user to their Home Point
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
    target:addStatusEffect(xi.effect.MAX_HP_BOOST, 5, 0, 900)
    target:addStatusEffect(xi.effect.MAX_MP_BOOST, 5, 0, 900)
    target:addStatusEffect(xi.effect.MEDICINE, 0, 0, 3600)

    if target:getCharMod(xi.mod.HP) < 120 then
        target:addCharMod(xi.mod.HP,6)
        if target:getCharMod(xi.mod.HP) == 120 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of Black Drops is allowed")
            target:PrintToPlayer("but only the medicine effect will be applied.")
        end
    end
    if target:getCharMod(xi.mod.MP) < 60 then
        target:addCharMod(xi.mod.MP,3)
    end

end

return itemObject
