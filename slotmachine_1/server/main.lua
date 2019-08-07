ESX = nil
local timer = nil
local maksut = 0
local saannit = 0

TriggerEvent('esx:getSharedObject', function(obj) 
  ESX = obj
end)


RegisterServerEvent('payforplayer2')
AddEventHandler('payforplayer2',function(winnings)
	
	local _source = source
	local item =cchip
	local xPlayer  = ESX.GetPlayerFromId(_source)
	xPlayer.addMoney(winnings)
	--xPlayer.addInventoryItem("cchip", winnings)
	--TriggerClientEvent("klrp_core:Success", source, "Casion ", winnings.. "Chips won", 2500, false, "leftCenter")
	local societyAccount = nil
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_casino', function(account)
		societyAccount = account
	end)
	if societyAccount < winnings then
		
	else
		societyAccount.removeMoney(winnings)
	end

end)

RegisterServerEvent('playerpays2')
AddEventHandler('playerpays2',function(bet)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	
	if xPlayer.getInventoryItem('cchip').count >= bet then
	--if xPlayer.get('money') >= bet then
		local societyAccount = nil
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_casino', function(account)
			societyAccount = account
		end)
		--xPlayer.removeMoney(bet)
		xPlayer.removeInventoryItem('cchip', bet) 
		TriggerClientEvent("klrp_core:Error", source, "Slots", bet.. "CasinoChips verwendet", 3500, false, "leftCenter")
		--societyAccount.addMoney(bet)
		TriggerClientEvent('spinit2',_source)
	else
		TriggerClientEvent('errormessage2',_source)
	end
end)
