-----------------------------------
--  ID: 4264
--  Item: White Drop
--  Charisma 5
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:hasStatusEffect(xi.effect.MEDICINE) then
        return xi.msg.basic.ITEM_NO_USE_MEDICATED
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.CHR_BOOST, 5, 0, 900)
    target:addStatusEffect(xi.effect.MEDICINE, 0, 0, 3600)

    if target:getCharMod(xi.mod.CHR) < 20 then
        target:addCharMod(xi.mod.CHR,1)
        if target:getCharMod(xi.mod.CHR) == 20 then
            target:PrintToPlayer("You have reached the max enhancement for this stat. Additional usage of White Drops is allowed")
            target:PrintToPlayer("but only the medicine effect will be applied.")
        end
    end
end

return itemObject
