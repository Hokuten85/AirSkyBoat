-----------------------------------
-- xi.effect.IMPETUS
-----------------------------------
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    -- IMPETUS will accumulate with hits
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.IMPETUS, target:getMod(xi.mod.IMPETUS))
end

return effectObject
