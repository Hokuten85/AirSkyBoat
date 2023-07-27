-----------------------------------
-- xi.effect.HOLY_CIRCLE
-----------------------------------
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.UNDEAD_KILLER, effect:getPower())
    target:addMod(xi.mod.ENMITY, -effect:getSubPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.UNDEAD_KILLER, effect:getPower())
    target:delMod(xi.mod.ENMITY, -effect:getSubPower())
end

return effectObject
