-----------------------------------
-- func: getindex
-----------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!getindex")
end

function onTrigger(player)
    local targ = player:getCursorTarget()

    if targ == nil then
        error(player, "Invalid target.")
        return
    end
	
	varName = string.format("MobIndex_%s", targ:getID())

    player:PrintToPlayer(string.format("%s's variable '%s' : %i", targ:getName(), varName, targ:getLocalVar(varName)))
end
