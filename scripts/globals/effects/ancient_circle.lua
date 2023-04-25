-----------------------------------
-- xi.effect.ANCIENT_CIRCLE
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.DRAGON_KILLER, effect:getPower())
    target:addMod(xi.mod.ACC, effect:getSubPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.DRAGON_KILLER, effect:getPower())
    target:delMod(xi.mod.ACC, effect:getSubPower())
end

return effectObject
