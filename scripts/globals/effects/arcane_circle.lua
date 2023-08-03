-----------------------------------
-- xi.effect.ARCANE_CIRCLE
-----------------------------------
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.ARCANA_KILLER, effect:getPower())
    target:addMod(xi.mod.ATTP, effect:getSubPower())
	target:addMod(xi.mod.LIFESTEAL, effect:getSubPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.ARCANA_KILLER, effect:getPower())
    target:delMod(xi.mod.ATTP, effect:getSubPower())
	target:delMod(xi.mod.LIFESTEAL, effect:getSubPower())
end

return effectObject
