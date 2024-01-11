-----------------------------------
-- xi.effect.FOOTWORK
-----------------------------------
require("scripts/globals/jobpoints")
-----------------------------------
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.ATTP, 10)
	target:addMod(xi.mod.KICK_ATTACK_RATE, 20)
	KICK_ATTACK_RATE
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.ATTP, 10)
	target:delMod(xi.mod.KICK_ATTACK_RATE, 20)
end

return effectObject
