-----------------------------------
-- Area: Ru'Lud Gardens
--  NPC: World_Shifter
-----------------------------------
require("scripts/globals/utils")
local ID = require("scripts/zones/RuLude_Gardens/IDs")
-----------------------------------
local upgradeCost = {
	[1]  = {gil = 25000, item = 4064 },
	[2]  = {gil = 50000, item = 4065 },
	[3]  = {gil = 100000, item = 4066 },
	[4]  = {gil = 200000, item = 4067 },
	[5]  = {gil = 400000, item = 4068 },
	[6]  = {gil = 800000, item = 4069 },
	[7]  = {gil = 1500000, item = 4070 },
	[8]  = {gil = 2500000, item = 4071 },
	[9]  = {gil = 5000000, item = 4072 },
	[10] = {gil = 10000000, item = 4073 },
}

chapterMap = {
	[4064] = "Rem's Tale Ch.1",
    [4065] = "Rem's Tale Ch.2",
    [4066] = "Rem's Tale Ch.3",
    [4067] = "Rem's Tale Ch.4",
    [4068] = "Rem's Tale Ch.5",
    [4069] = "Rem's Tale Ch.6",
    [4070] = "Rem's Tale Ch.7",
    [4071] = "Rem's Tale Ch.8",
    [4072] = "Rem's Tale Ch.9",
    [4073] = "Rem's Tale Ch.10"
}

local equipmentList = {
	[13281] = { -- Sniper's Ring +1
		[1]  = { [1] = {33,  2}, }, -- DEF
		[2]  = { [1] = {33,  4}, },
		[3]  = { [1] = {33,  6}, },
		[4]  = { [1] = {33,  8}, },
		[5]  = { [1] = {33, 10}, },
		[6]  = { [1] = {33, 12}, },
	},
	[15270] = { -- Walahra Turban
		[1]   = { [1] = {33,  2}, }, -- DEF
		[2]   = { [1] = {33,  4}, },
		[3]   = { [1] = {33,  6}, },
		[4]   = { [1] = {33,  8}, },
		[5]   = { [1] = {33, 10}, },
		[6]   = { [1] = {33, 13}, },
		[7]   = { [1] = {33, 16}, },
		[8]   = { [1] = {33, 19}, },
		[9]   = { [1] = {33, 22}, },
		[10]  = { [1] = {33, 25}, },
	},
	[14674] = { -- toreadors-ring
		[1]   = { [1] = {1, 1}, }, -- HP
		[2]   = { [1] = {1, 2}, },
		[3]   = { [1] = {1, 3}, },
		[4]   = { [1] = {1, 4}, },
		[5]   = { [1] = {1, 5}, },
		[6]   = { [1] = {1, 5}, {33, 1}, }, -- DEF
		[7]   = { [1] = {1, 5}, {33, 2}, },
		[8]   = { [1] = {1, 5}, {33, 3}, },
		[9]   = { [1] = {1, 5}, {33, 4}, },
		[10]  = { [1] = {1, 5}, {33, 4}, {143, 2}}, -- DA
	},
	[11582] = { -- Ire Torque +1
		[1]   = { [129] = {23, 1}, }, -- Accuracy+1
		[2]   = { [129] = {23, 2}, },
		[3]   = { [129] = {23, 3}, },
		[4]   = { [129] = {23, 3}, {27, 1}, }, -- Rng.Acc.+1
		[5]   = { [129] = {23, 3}, {27, 2}, },
		[6]   = { [129] = {23, 3}, {27, 3}, },
		[7]   = { [129] = {23, 3}, {27, 1}, {332, 1}, }, -- Sklchn.dmg.+1%
		[8]   = { [129] = {23, 3}, {27, 1}, {332, 2}, },
		[9]   = { [129] = {23, 3}, {27, 1}, {332, 3}, },
	},
	[13056] = { -- Peacock Charm
		[1]   = { [1] = {24,   1}, }, -- Acc -1
		[2]   = { [1] = {24,   2}, },
		[3]   = { [1] = {24,   3}, },
		[4]   = { [1] = {24,   4}, },
		[5]   = { [1] = {24,   5}, },
		[6]   = { [1] = {24,   6}, },
		[7]   = { [1] = {24,   7}, },
		[8]   = { [1] = {24,   8}, },
		[9]   = { [1] = {775, 10}, }, -- Dark Resist +1
		[10]  = { [1] = {68,   5}, {69, 5}, {775, 10}, }, -- Accuracy +1 Attack +1 Dark Resist +1
	},
}

local entity = {}

entity.onTrade = function(player, npc, trade)
	local delay = 2000
	npc:facePlayer(player, true)
	local npcName = npc:getName():gsub("_"," ")
	if (trade:getSlotCount() == 1) then
        local item = trade:getItem()
        if equipmentList[item:getID()] then
			local itemAugString = getItemAugString(item)
			if string.len(itemAugString) > 0 then -- item is augmented, check for tier
				local augList = equipmentList[item:getID()]
				local matchingTier = findMatchingAugmentTier(augList, itemAugString)
				if matchingTier > 0 then
					if augList[matchingTier+1] == nil then
						player:PrintToPlayer("I cannot enhance this further.", xi.msg.channel.SAY, npcName);
					else
						player:PrintToPlayer(string.format("I can enhance this equipment further. Bring me %s Gil and a %s, and I'll get right to work.", upgradeCost[matchingTier+1].gil, chapterMap[upgradeCost[matchingTier+1].item]), xi.msg.channel.SAY, npcName)
					end
				end
			else
				player:PrintToPlayer(string.format("I can enhance this equipment. Bring me %s Gil and a %s, and I'll get right to work.", upgradeCost[1].gil, chapterMap[upgradeCost[1].item]), xi.msg.channel.SAY, npcName)
            end
		else
			player:PrintToPlayer("I cannot enhance this.", xi.msg.channel.SAY, npcName);
		end
	elseif trade:getSlotCount() == 3 then
		local tradeGil = trade:getGil()
		local tradeGear, tradeChapter
		for i = 1, 8 do
            local itemId = trade:getItemId(i);
            if (itemId > 0) then
				if equipmentList[itemId] then
					tradeGear = trade:getItem(i)
				elseif chapterMap[itemId] then
					tradeChapter = trade:getItem(i)
				end
            end
        end
		
		if tradeGear == nil then
			player:PrintToPlayer("You did not give me any equipment that I can enhance.", xi.msg.channel.SAY, npcName);
		else
			if tradeGil == 0 then
				player:PrintToPlayer("I'm not doing this for free. Give me the Gil I asked for.", xi.msg.channel.SAY, npcName);
			else
				if tradeChapter == nil then
					player:PrintToPlayer("I will enhance this equipment in exchange for the Rem's Tale Chapter I requested.", xi.msg.channel.SAY, npcName);
				else
					-- We have an augmentable item, gil, and a chapter. Verify that they gave us the right stuff
					local itemAugString = getItemAugString(tradeGear)
					if string.len(itemAugString) > 0 then
						local augList = equipmentList[tradeGear:getID()]
						local matchingTier = findMatchingAugmentTier(augList, itemAugString)
						
						if augList[matchingTier+1] == nil then
							player:PrintToPlayer("I cannot enhance this further.", xi.msg.channel.SAY, npcName);
						else
							if tradeGil < upgradeCost[matchingTier+1].gil then
								player:PrintToPlayer(string.format("I'm not doing this for free. Give me the %s Gil I asked for.", upgradeCost[matchingTier+1].gil), xi.msg.channel.SAY, npcName);
							else
								if tradeGil > upgradeCost[matchingTier+1].gil then
									player:PrintToPlayer("You gave me too much Gil. I will return the extra.", xi.msg.channel.SAY, npcName);
								end
								
								if tradeChapter:getID() ~= upgradeCost[matchingTier+1].item then
									player:PrintToPlayer(string.format("I asked for a %s.", chapterMap[upgradeCost[matchingTier+1].item]), xi.msg.channel.SAY, npcName);
								else
									trade:confirmItem(tradeGear:getID(),1) -- CONFIRM EQUIPMENT
									trade:confirmSlot(0,upgradeCost[matchingTier+1].gil) -- CONFIRM GIL
									trade:confirmItem(tradeChapter:getID(),1) -- CONFIRM CHAPTER
									
									augmentItem(player, npc, tradeGear, matchingTier+1) -- AUGMENT THAT SHIT!!!
									delay = delay + 3000
								end
							end
						end
					else -- no augments on item
						if tradeGil < upgradeCost[1].gil then
							player:PrintToPlayer(string.format("I'm not doing this for free. Give me the %s Gil I asked for.", upgradeCost[1].gil), xi.msg.channel.SAY, npcName);
						else
							
							if tradeGil > upgradeCost[1].gil then
								player:PrintToPlayer("You gave me too much Gil. I will return the extra.", xi.msg.channel.SAY, npcName);
							end
						
							if tradeChapter:getID() ~= upgradeCost[1].item then
								player:PrintToPlayer(string.format("I asked for a %s.", chapterMap[upgradeCost[1].item]), xi.msg.channel.SAY, npcName);
							else
								trade:confirmItem(tradeGear:getID(),1) -- CONFIRM EQUIPMENT
								trade:confirmSlot(0,upgradeCost[1].gil) -- CONFIRM GIL
								trade:confirmItem(tradeChapter:getID(),1) -- CONFIRM CHAPTER
								
								augmentItem(player, npc, tradeGear, 1) -- AUGMENT THAT SHIT!!!
								delay = delay + 3000
							end
						end
					end
				end
			end
		end
	end
	
	npc:timer(delay, function() npc:setRotation(npc:getRotPos()) end)
end

entity.onTrigger = function(player, npc)
	local npcName = npc:getName():gsub("_"," ")
	local delay = 0
	
	npc:facePlayer(player, true)
		
	if player:getCharVar("WorldShifterInitial") ~= 1 then 
		player:setCharVar("WorldShifterInitial", 1)
		
		player:PrintToPlayer("Within Vana'diel exists powerful equipment with hidden latent abilities.", xi.msg.channel.SAY, npcName)
		delay = delay + 1000
		npc:timer(delay, function() player:PrintToPlayer("If you can seek out and fetch for me pages of the lost Great Rem's Tale, I can unlock those latent abilities.", xi.msg.channel.SAY, npcName) end)
		delay = delay + 1000
		npc:timer(delay, function() player:PrintToPlayer("Mind you, not all equipiment. Only the most powerful.", xi.msg.channel.SAY, npcName) end)
		delay = delay + 1000
	end
	
	npc:timer(delay, function() player:PrintToPlayer("Trade me a piece of equipment and I can tell you if it can be enhanced.", xi.msg.channel.SAY, npcName) end)
	delay = delay + 1000
	npc:timer(delay, function() npc:setRotation(npc:getRotPos()) end)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

function getItemAugString(item)
	local itemAugs = {}
	for i = 0, 3 do
		local augmentId, augmentValue = item:getAugment(i)
		if augmentId > 0 then
			table.insert(itemAugs, tostring(augmentId))
			table.insert(itemAugs, tostring(augmentValue))
		end
	end
	return table.concat(itemAugs,",")
end

function findMatchingAugmentTier(augList, itemAugString)
	for k, v in ipairs(augList) do
		local tierAugs = {}
		for idx, tierVal in ipairs(v) do
			table.insert(tierAugs, tostring(tierVal[1]))
			table.insert(tierAugs, tostring(tierVal[2]-1))-- Augment value of 1 is saved as 0
		end
		
		if itemAugString == table.concat(tierAugs, ",") then -- We have a tier that matches current augs
			return k
		end
	end
end

function augmentItem(player, npc, gearItem, augmentTier)
    local npcName = npc:getName():gsub("_"," ")
    local gearId = gearItem:getID()
	
    local augment = equipmentList[gearId][augmentTier]
    
	local augTable = {}
    for i = 1, 4 do
		if augment[i] ~= nil then
			augTable[i] = {Id = augment[i][1], Val = augment[i][2]-1}
		else 
			augTable[i] = {Id = 0, Val = 0}
		end
    end
	
	player:confirmTrade()
	player:PrintToPlayer("You brought what I asked for! This will just take one moment.", xi.msg.channel.SAY, npcName)
	npc:timer(2000,
		function() 
			player:PrintToPlayer("Pleasure doing buisiness with you.", xi.msg.channel.SAY, npcName)
			player:addItem(gearId, 1, augTable[1].Id, augTable[1].Val, augTable[2].Id, augTable[2].Val, augTable[3].Id, augTable[3].Val, augTable[4].Id, augTable[4].Val) 
			player:messageSpecial(ID.text.ITEM_OBTAINED, gearId)
		end)
end

return entity
