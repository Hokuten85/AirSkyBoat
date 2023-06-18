-----------------------------------
-- func: capallskills
-- desc: Caps all the players skills.
-----------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function onTrigger(player, target)
	if target == nil then
        player:PrintToPlayer("You must enter a valid player name.")
        return
    end

    local targ = GetPlayerByName(target)
    if targ == nil then
        player:PrintToPlayer(string.format("Player named '%s' not found!", target))
        return
    end
	
    targ:capAllSkills()
    player:PrintToPlayer('All skills capped!')
end
