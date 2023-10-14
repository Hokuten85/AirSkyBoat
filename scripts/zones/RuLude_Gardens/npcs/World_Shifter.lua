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
		[1]  = { {33,  2}, }, -- DEF
		[2]  = { {33,  4}, },
		[3]  = { {33,  6}, },
		[4]  = { {33,  8}, },
		[5]  = { {33, 10}, },
		[6]  = { {33, 12}, },
	},
	[15270] = { -- Walahra Turban
		[1]   = { {33,  2}, }, -- DEF
		[2]   = { {33,  4}, },
		[3]   = { {33,  6}, },
		[4]   = { {33,  8}, },
		[5]   = { {33, 10}, },
		[6]   = { {33, 13}, },
		[7]   = { {33, 16}, },
		[8]   = { {33, 19}, },
		[9]   = { {33, 22}, },
		[10]  = { {33, 25}, },
	},
	[14674] = { -- toreadors-ring
		[1]   = { {1, 1}, }, -- HP
		[2]   = { {1, 2}, },
		[3]   = { {1, 3}, },
		[4]   = { {1, 4}, },
		[5]   = { {1, 5}, },
		[6]   = { {1, 5}, {33, 1}, }, -- DEF
		[7]   = { {1, 5}, {33, 2}, },
		[8]   = { {1, 5}, {33, 3}, },
		[9]   = { {1, 5}, {33, 4}, },
		[10]  = { {1, 5}, {33, 4}, {143, 2}}, -- DA
	},
	[11582] = { -- Ire Torque +1
		[1]   = { {23, 1}, }, -- Accuracy+1
		[2]   = { {23, 2}, },
		[3]   = { {23, 3}, },
		[4]   = { {23, 3}, {27, 1}, }, -- Rng.Acc.+1
		[5]   = { {23, 3}, {27, 2}, },
		[6]   = { {23, 3}, {27, 3}, },
		[7]   = { {23, 3}, {27, 1}, {332, 1}, }, -- Sklchn.dmg.+1%
		[8]   = { {23, 3}, {27, 1}, {332, 2}, },
		[9]   = { {23, 3}, {27, 1}, {332, 3}, },
	},
	[13056] = { -- Peacock Charm
		[1]  = { {2021, 1}, {775, 1}, }, -- Combat Skills +1, Dark Resist +1
		[2]  = { {2021, 2}, {775, 2}, },
		[3]  = { {2021, 3}, {775, 3}, },
		[4]  = { {2021, 4}, {775, 4}, },
		[5]  = { {2021, 5}, {775, 5}, },
		[6]  = { {2021, 6}, {775, 6}, },
		[7]  = { {2021, 7}, {775, 7}, },
		[8]  = { {2021, 8}, {775, 8}, },
		[9]  = { {2021, 9}, {775, 9}, },
		[10] = { 
			UpgradeIdx = 10,
			Augments = { {2021, 10}, {775, 10}, }, -- Combat Skills +1 Dark Resist +1
		},
	},
	[13857] = { -- Choral Roundlet
		[1]   = { {518, 1}, }, -- CHR+1
		[2]   = { {518, 2}, },
		[3]   = { {518, 3}, },
		[4]   = { {518, 4}, {322, 1}, }, -- Song Casting Time-1
		[5]   = { {518, 4}, {322, 2}, },
		[6]   = { {518, 4}, {322, 3}, },
		[7]   = { {518, 4}, {322, 4}, {2014, 1}, }, -- Elegy+1
	},
	[15234] = { -- Choral Roundlet+1
		[1]   = { {518, 1}, }, -- CHR+1
		[2]   = { {518, 2}, },
		[3]   = { {518, 3}, },
		[4]   = { {518, 4}, {322, 1}, }, -- Song Casting Time-1
		[5]   = { {518, 4}, {322, 2}, },
		[6]   = { {518, 4}, {322, 3}, },
		[7]   = { {518, 4}, {322, 4}, {2014, 1}, }, -- Elegy+1
	},
	[12647] = { -- Choral Jstcorps
		[1]   = { {296, 1}, }, -- Singing Skill+1
		[2]   = { {296, 2}, },
		[3]   = { {296, 3}, },
		[4]   = { {296, 4}, {2020, 1}, }, -- Song Duration+1
		[5]   = { {296, 5}, {2020, 2}, },
		[6]   = { {296, 6}, {2020, 3}, },
		[7]   = { {296, 7}, {2020, 4}, {2000, 2}, }, -- Minne+1
	},
	[14482] = { -- Choral Jstcorps+1
		[1]   = { {296, 1}, }, -- Singing Skill+1
		[2]   = { {296, 2}, },
		[3]   = { {296, 3}, },
		[4]   = { {296, 4}, {2020, 1}, }, -- Song Duration+1
		[5]   = { {296, 5}, {2020, 2}, },
		[6]   = { {296, 6}, {2020, 3}, },
		[7]   = { {296, 7}, {2020, 4}, {2000, 2}, }, -- Minne+1
	},
	[13970] = { -- Choral Cuffs
		[1]   = { {298, 1}, }, -- Wind Instrument Skill+1
		[2]   = { {298, 2}, },
		[3]   = { {298, 3}, },
		[4]   = { {298, 4}, {322, 1}, }, -- Song Casting Time-1
		[5]   = { {298, 5}, {322, 2}, },
		[6]   = { {298, 6}, {322, 3}, },
		[7]   = { {298, 7}, {322, 4}, {2005, 1}, }, -- Madrigal+1
	},
	[14899] = { -- Choral Cuffs+1
		[1]   = { {298, 1}, }, -- Wind Instrument Skill+1
		[2]   = { {298, 2}, },
		[3]   = { {298, 3}, },
		[4]   = { {298, 4}, {322, 1}, }, -- Song Casting Time-1
		[5]   = { {298, 5}, {322, 2}, },
		[6]   = { {298, 6}, {322, 3}, },
		[7]   = { {298, 7}, {322, 4}, {2005, 1}, }, -- Madrigal+1
	},
	[14899] = { -- Choral Cannions
		[1]   = { {518, 1}, }, -- Wind Instrument Skill+1
		[2]   = { {518, 2}, },
		[3]   = { {518, 3}, },
		[4]   = { {518, 4}, {2020, 1}, }, -- Song Duration+1
		[5]   = { {518, 5}, {2020, 2}, },
		[6]   = { {518, 6}, {2020, 3}, },
		[7]   = { {518, 7}, {2020, 4}, {2001, 1}, }, -- Minuet+1
	},
	[15570] = { -- Choral Cannions+1
		[1]   = { {518, 1}, }, -- Wind Instrument Skill+1
		[2]   = { {518, 2}, },
		[3]   = { {518, 3}, },
		[4]   = { {518, 4}, {2020, 1}, }, -- Song Duration+1
		[5]   = { {518, 5}, {2020, 2}, },
		[6]   = { {518, 6}, {2020, 3}, },
		[7]   = { {518, 7}, {2020, 4}, {2001, 1}, }, -- Minuet+1
	},
	[14098] = { -- Choral Slippers
		[1]   = { {33, 3}, }, -- Def+1
		[2]   = { {33, 6}, },
		[3]   = { {33, 9}, },
		[4]   = { {33, 12}, {35, 2}, }, -- MAcc+1
		[5]   = { {33, 15}, {35, 4}, },
		[6]   = { {33, 18}, {35, 6}, },
		[7]   = { {33, 21}, {35, 8}, {2013, 1}, }, -- Mazurka+1
	},
	[15361] = { -- Choral Slippers+1
		[1]   = { {33, 3}, }, -- Def+1
		[2]   = { {33, 6}, },
		[3]   = { {33, 9}, },
		[4]   = { {33, 12}, {35, 2}, }, -- MAcc+1
		[5]   = { {33, 15}, {35, 4}, },
		[6]   = { {33, 18}, {35, 6}, },
		[7]   = { {33, 21}, {35, 8}, {2013, 1}, }, -- Mazurka+1
	},
	[15081] = { -- Bard's Roundlet
		[1]   = { {296, 1}, }, -- Wind Instrument Skill+1
		[2]   = { {296, 2}, },
		[3]   = { {296, 3}, },
		[4]   = { {296, 4}, {2020, 1}, }, -- Song Duration+1
		[5]   = { {296, 5}, {2020, 2}, },
		[6]   = { {296, 6}, {2020, 3}, },
		[7]   = { {296, 6}, {2020, 4}, {2009, 1}, }, -- Ballad+1
	},
	[15254] = { -- Bard's Roundlet+1
		[1]   = { {296, 1}, }, -- Wind Instrument Skill+1
		[2]   = { {296, 2}, },
		[3]   = { {296, 3}, },
		[4]   = { {296, 4}, {2020, 1}, }, -- Song Duration+1
		[5]   = { {296, 5}, {2020, 3}, },
		[6]   = { {296, 6}, {2020, 5}, },
		[7]   = { {296, 7}, {2020, 7}, {2009, 2}, }, -- Ballad+1
	},
	[15096] = { -- Bard's Jstcorps
		[1]   = { {258, 4}, }, -- Dagger Skill+1
		[2]   = { {258, 8}, },
		[3]   = { {258, 12}, },
		[4]   = { {258, 16}, {550, 2}, }, -- STR/DEX+1
		[5]   = { {258, 20}, {550, 4}, },
		[6]   = { {258, 24}, {550, 6}, },
		[7]   = { {258, 28}, {550, 8}, {353, 10}, }, -- TP Bonus+1
	},
	[14509] = { -- Bard's Jstcorps+1
		[1]   = { {258, 4}, }, -- Dagger Skill+1
		[2]   = { {258, 8}, },
		[3]   = { {258, 12}, },
		[4]   = { {258, 16}, {550, 2}, }, -- STR/DEX+1
		[5]   = { {258, 20}, {550, 4}, },
		[6]   = { {258, 24}, {550, 6}, },
		[7]   = { {258, 28}, {550, 8}, {353, 10}, }, -- TP Bonus+1
	},
	[15111] = { -- Bard's Cuffs
		[1]   = { {298, 1}, }, -- Wind Instrument Skill+1
		[2]   = { {298, 2}, },
		[3]   = { {298, 3}, },
		[4]   = { {298, 4}, {2020, 1}, }, -- Song Duration+1
		[5]   = { {298, 5}, {2020, 2}, },
		[6]   = { {298, 6}, {2020, 3}, },
		[7]   = { {298, 7}, {2020, 4}, {2007, 1}, }, -- Lullaby+1
	},
	[14918] = { -- Bard's Cuffs+1
		[1]   = { {298, 1}, }, -- Wind Instrument Skill+1
		[2]   = { {298, 2}, },
		[3]   = { {298, 3}, },
		[4]   = { {298, 4}, {2020, 1}, }, -- Song Duration+1
		[5]   = { {298, 5}, {2020, 3}, },
		[6]   = { {298, 6}, {2020, 5}, },
		[7]   = { {298, 7}, {2020, 7}, {2007, 2}, }, -- Lullaby+1
	},
	[15126] = { -- Bard's Cannions
		[1]   = { {298, 1}, }, -- Wind Instrument Skill+1
		[2]   = { {298, 2}, },
		[3]   = { {298, 3}, },
		[4]   = { {298, 4}, {322, 1}, }, -- Song Casting Time-1
		[5]   = { {298, 5}, {322, 2}, },
		[6]   = { {298, 6}, {322, 3}, },
		[7]   = { {298, 7}, {322, 4}, {2012, 2}, }, -- Carol+1
	},
	[15589] = { -- Bard's Cannions+1
		[1]   = { {298, 1}, }, -- Wind Instrument Skill+1
		[2]   = { {298, 2}, },
		[3]   = { {298, 3}, },
		[4]   = { {298, 4}, {322, 1}, }, -- Song Casting Time-1
		[5]   = { {298, 5}, {322, 3}, },
		[6]   = { {298, 6}, {322, 5}, },
		[7]   = { {298, 7}, {322, 7}, {2012, 4}, }, -- Carol+1
	},
	[15141] = { -- Bard's Slippers
		[1]   = { {518, 1}, }, -- CHR+1
		[2]   = { {518, 2}, },
		[3]   = { {518, 3}, },
		[4]   = { {518, 4}, {140, 1}, }, -- Fast Cast+1
		[5]   = { {518, 5}, {140, 2}, },
		[6]   = { {518, 6}, {140, 3}, },
		[7]   = { {518, 7}, {140, 4}, {2010, 1}, }, -- March+1
	},
	[15674] = { -- Bard's Slippers+1
		[1]   = { {518, 1}, }, -- CHR+1
		[2]   = { {518, 2}, },
		[3]   = { {518, 3}, },
		[4]   = { {518, 4}, {140, 1}, }, -- Fast Cast+1
		[5]   = { {518, 5}, {140, 3}, },
		[6]   = { {518, 6}, {140, 5}, },
		[7]   = { {518, 7}, {140, 7}, {2010, 2}, }, -- March+1
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
					if not augList[matchingTier+1] then
						player:PrintToPlayer("I cannot enhance this further.", xi.msg.channel.SAY, npcName);
					else
						local cost, upgradeItem
						local augment = augList[matchingTier+1]
						if not augment.UpgradeIdx then
							cost = upgradeCost[matchingTier+1].gil
							upgradeItem = upgradeCost[matchingTier+1].item
						else
							cost = upgradeCost[augment.UpgradeIdx].gil
							upgradeItem = upgradeCost[augment.UpgradeIdx].item
						end
						
						player:PrintToPlayer(string.format("I can enhance this equipment further. Bring me %s Gil and a %s, and I'll get right to work.", cost, chapterMap[upgradeItem]), xi.msg.channel.SAY, npcName)
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
							local cost, upgradeItem
							local augment = augList[matchingTier+1]
							if not augment.UpgradeIdx then
								cost = upgradeCost[matchingTier+1].gil
								upgradeItem = upgradeCost[matchingTier+1].item
							else
								cost = upgradeCost[augment.UpgradeIdx].gil
								upgradeItem = upgradeCost[augment.UpgradeIdx].item
							end
						
							if tradeGil < cost then
								player:PrintToPlayer(string.format("I'm not doing this for free. Give me the %s Gil I asked for.", cost), xi.msg.channel.SAY, npcName);
							else
								if tradeGil > cost then
									player:PrintToPlayer("You gave me too much Gil. I will return the extra.", xi.msg.channel.SAY, npcName);
								end
								
								if tradeChapter:getID() ~= upgradeItem then
									player:PrintToPlayer(string.format("I asked for a %s.", chapterMap[upgradeItem]), xi.msg.channel.SAY, npcName);
								else
									trade:confirmItem(tradeGear:getID(),1) -- CONFIRM EQUIPMENT
									trade:confirmSlot(0,cost) -- CONFIRM GIL
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
			if not tierVal.UpgradeIdx then
				table.insert(tierAugs, tostring(tierVal[1]))
				table.insert(tierAugs, tostring(tierVal[2]-1))-- Augment value of 1 is saved as 0
			else
				table.insert(tierAugs, tostring(tierVal.Augments[1]))
				table.insert(tierAugs, tostring(tierVal.Augments[2]-1))-- Augment value of 1 is saved as 0
			end
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
	if augment.UpgradeIdx then
		augment = augment.Augments
	end
    
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
