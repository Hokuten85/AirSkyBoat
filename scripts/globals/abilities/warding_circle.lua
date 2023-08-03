-----------------------------------
-- Ability: Warding Circle
-- Grants resistance, defense, and attack against Demons to party members within the area of effect.
-- Obtained: Samurai Level 5
-- Recast Time: 5:00 minutes
-- Duration: 3:00 minutes
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    local duration = 180 + player:getMod(xi.mod.WARDING_CIRCLE_DURATION)
    local power    = 5
    local subPower = 10
    
    if player:getMainJob() == xi.job.SAM then
        power = 15
		
		if (player:getID() ~= target:getID()) then
			if (player:getMainLvl() > 50) then
				subPower = subPower + math.floor((player:getMainLvl() - 50) / 5);
			end
		end
	end

    target:addStatusEffect(xi.effect.WARDING_CIRCLE, power, 0, duration, 0, subPower)
end

return abilityObject
