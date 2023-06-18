-----------------------------------
-- func: capskill
-- desc: Caps a specific skill.
-----------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = "ss",

}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!capskill <target> <skillID>")
end

function onTrigger(player, target, skillId)
	if target == nil or skillId == nil then
        player:PrintToPlayer("You must enter a valid player name and skillId.")
        return
    end

    local targ = GetPlayerByName(target)
    if targ == nil then
        player:PrintToPlayer(string.format("Player named '%s' not found!", target))
        return
    end

    skillId = tonumber(skillId) or xi.skill[string.upper(skillId)]
    if skillId == nil or skillId == 0 then
        error(player, "Invalid skillID.")
        return
    end

    -- cap skill
    targ:capSkill(skillId)
    player:PrintToPlayer(string.format("Capped skillID %i.", skillId))
end
