-----------------------------------
-- func: addweaponskill
-- desc: Adds a learned weaponskills to the given target. If no target then to the current player.
-----------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addweaponskill (player) <wsid>")
end

function onTrigger(player, target, wsid)
    -- validate target
    local targ
    if target then
        targ = GetPlayerByName(target)
        if not targ then
            error(player, string.format("Player named '%s' not found!", target))
            return
        end
    else
        targ = player
    end
	
	wsid = tonumber(wsid)

    -- add all learned weaponskills
    if wsid > 0 and wsid < 50 then
        targ:addLearnedWeaponskill(wsid)
    end

    player:PrintToPlayer(string.format("%s now has learned weaponskill.", targ:getName()))
end
