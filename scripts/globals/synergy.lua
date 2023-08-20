-----------------------------------
-- Functions for ghetto synergy
-----------------------------------
xi = xi or {}
xi.synergy = xi.synergy or {}

local synergyRecipes = {
	{ ingredients = {17545,17547,17549,17551,17553,17555,17557,17559}, result = 18632 }, -- iridal-staff
	{ ingredients = {17546,17548,17550,17552,17554,17556,17558,17560}, result = 18633 }, -- chatoyant-staff
	{ ingredients = {760,760,784,2877}, result = 11584 }, -- lmg-medallion
	{ ingredients = {745,745,648,2875}, result = 11580 }, -- fylgja-torque
	{ ingredients = {13316,2880}, result = 16053 }, -- incubus-earring
	{ ingredients = {2876,13125}, result = 11582 }, -- ire-torque
	{ ingredients = {717,717,717,719,719,719,719,745}, result = 3584 }, -- panetiere
	{ ingredients = {2878,1828,2274}, result = 15950 }, -- pythia-sash
	{ ingredients = {15495,15500,15496,15499,15498,15497,15501,15502}, result = 27510 }, -- fotia-gorget
	{ ingredients = {11755,11760,11756,11759,11758,11757,11761,11762}, result = 28420 }, -- fotia-belt
	{ ingredients = {15441,15442,15435,15436,15437,15438,15439,15440}, result = 28419 }, -- hachirin-no-obi
	{ ingredients = {2570,2570}, result = 19051 }, -- vivid-strap
}

xi.synergy.onTrade = function(player, npc, trade)
	local tradeItems = {}
	for i = 0, trade:getSlotCount()-1 do
		for j = 0, trade:getSlotQty(i)-1 do
			table.insert(tradeItems, trade:getItemId(i))
		end
	end
	
	table.sort(tradeItems)
	local ingredientString = table.concat(tradeItems, ",")
	
	for k, v in ipairs(synergyRecipes) do
        table.sort(v.ingredients)
		if table.concat(v.ingredients, ",") == ingredientString then
			npcUtil.giveItem(player, v.result)
			player:tradeComplete()
		end
    end
end