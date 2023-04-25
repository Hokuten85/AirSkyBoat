-----------------------------------
-- Ninjutsu Elemental Debuff
-- Reduces a targets given elemental resistance
-----------------------------------
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(effect:getSubPower(), -effect:getPower())
    target:addMod(effect:getSubPower()+39, -1000) -- resistMod + 39 = defenseMod
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(effect:getSubPower(), -effect:getPower())
    target:delMod(effect:getSubPower()+39, -1000)
end

return effectObject
