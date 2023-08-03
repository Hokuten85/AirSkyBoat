-----------------------------------
-- xi.effect.ARCANE_CIRCLE
-----------------------------------
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.ARCANA_KILLER, effect:getPower())
	print('here2'..tostring(effect:getSubPower()))
    target:addMod(xi.mod.ATTP, effect:getSubPower())
	print('here3'..tostring(xi.mod.ATTP))
	target:addMod(xi.mod.LIFESTEAL, effect:getSubPower())
	print('here4'..tostring(xi.mod.LIFESTEAL))
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.ARCANA_KILLER, effect:getPower())
    target:delMod(xi.mod.ATTP, effect:getSubPower())
	target:delMod(xi.mod.LIFESTEAL, effect:getSubPower())
end

return effectObject
