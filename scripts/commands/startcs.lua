-----------------------------------
-- func: cs
-- desc: Starts the given event for the player.
-----------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiiiiiiiii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!startcs <csID> <player> (op1) (op2) (op3) (op4) (op5) (op6) (op7) (op8) (texttable)")
end

function onTrigger(player, csid, target, op1, op2, op3, op4, op5, op6, op7, op8, texttable)
    -- validate csid
    if csid == nil then
        error(player, "You must enter a cutscene id.")
        return
    end
	
	if target == nil then
		error(player, "You must enter a target name.")
        return
	else
		target = GetPlayerByName(target)
        if target == nil then
            error(player, string.format("Player named '%s' not found!", arg1))
            return
        end
	end

    -- play cutscene
    if op1 == nil then
        target:startEvent(csid)
    else
        target:startEvent(csid, op1, op2, op3, op4, op5, op6, op7, op8, texttable)
    end
end
