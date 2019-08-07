local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local cards = {
	{'As Herz',11,'http://167.99.90.247/testowy/img/ace_of_hearts.png'},       	{'As Kreuz',11,'http://167.99.90.247/testowy/img/ace_of_clubs.png'},
	{'As Karo',11,'http://167.99.90.247/testowy/img/ace_of_diamonds.png'},     	{'As Pik',11,'http://167.99.90.247/testowy/img/ace_of_spades.png'},
	{'Bube Pik',10,'http://167.99.90.247/testowy/img/jack_of_spades.png'},      {'10 Pik',10,'http://167.99.90.247/testowy/img/10_of_spades.png'},  
	{'Pik 9',9,'http://167.99.90.247/testowy/img/9_of_spades.png'},   	        {'8 Pik',8,'http://167.99.90.247/testowy/img/8_of_spades.png'},        
	{'Pik 7',7,'http://167.99.90.247/testowy/img/7_of_spades.png'},             {'6 Pik',6,'http://167.99.90.247/testowy/img/6_of_spades.png'},
	{'Pik 5',5,'http://167.99.90.247/testowy/img/5_of_spades.png'},      	    {'4 Pik',4,'http://167.99.90.247/testowy/img/4_of_spades.png'},     
	{'Pik 3',3,'http://167.99.90.247/testowy/img/3_of_spades.png'},      	    {'2 Pik',2,'http://167.99.90.247/testowy/img/2_of_hearts.png'},      
	{'Herz Dame',10,'http://167.99.90.247/testowy/img/queen_of_hearts.png'},    {'Herz Bube',10,'http://167.99.90.247/testowy/img/jack_of_hearts.png'},  
	{'Herz 9',9,'http://167.99.90.247/testowy/img/9_of_hearts.png'},  	        {'Herz 8',8,'http://167.99.90.247/testowy/img/8_of_hearts.png'},    
	{'Herz 7',7,'http://167.99.90.247/testowy/img/7_of_hearts.png'},    	    {'Herz 6',6,'http://167.99.90.247/testowy/img/6_of_hearts.png'},       
	{'Herz 5',5,'http://167.99.90.247/testowy/img/5_of_hearts.png'},     	    {'Herz 4',4,'http://167.99.90.247/testowy/img/4_of_hearts.png'},        
	{'Herz 3',3,'http://167.99.90.247/testowy/img/3_of_hearts.png'},     	    {'Herz 2',2,'http://167.99.90.247/testowy/img/2_of_hearts.png'},    
	{'Karo König',10,'http://167.99.90.247/testowy/img/king_of_diamonds.png'},  {'Dame Karo',10,'http://167.99.90.247/testowy/img/queen_of_diamonds.png'},       
	{'Karo Bube',10,'http://167.99.90.247/testowy/img/jack_of_diamonds.png'},   {'Karo 10',10,'http://167.99.90.247/testowy/img/10_of_diamonds.png'}, 
	{'Karo 9',9,'http://167.99.90.247/testowy/img/9_of_diamonds.png'},          {'Karo 8',8,'http://167.99.90.247/testowy/img/8_of_diamonds.png'},     
	{'Karo 7',7,'http://167.99.90.247/testowy/img/7_of_diamonds.png'},          {'Karo 6',6,'http://167.99.90.247/testowy/img/6_of_diamonds.png'},      
	{'Karo 4',4,'http://167.99.90.247/testowy/img/4_of_diamonds.png'},          {'Karo 3',3,'http://167.99.90.247/testowy/img/3_of_diamonds.png'},     
	{'Karo 2',2,'http://167.99.90.247/testowy/img/2_of_diamonds.png'},          {'Dame Pik',10,'http://167.99.90.247/testowy/img/queen_of_spades.png'}, 
	{'Kreuz König',10,'http://167.99.90.247/testowy/img/king_of_clubs.png'},    {'Dame Kreuz',10,'http://167.99.90.247/testowy/img/queen_of_clubs.png'},      
	{'Kreuz Bube',10,'http://167.99.90.247/testowy/img/jack_of_clubs.png'},     {'Kreuz 10',10,'http://167.99.90.247/testowy/img/10_of_clubs.png'},  
	{'Kreuz 8',8,'http://167.99.90.247/testowy/img/8_of_clubs.png'},            {'Kreuz 7',7,'http://167.99.90.247/testowy/img/7_of_clubs.png'},   
	{'Kreuz 6',6,'http://167.99.90.247/testowy/img/6_of_clubs.png'},    	    {'Kreuz 5',5,'http://167.99.90.247/testowy/img/5_of_clubs.png'},      
	{'Kreuz 4',4,'http://167.99.90.247/testowy/img/4_of_clubs.png'},    	    {'Kreuz 3',3,'http://167.99.90.247/testowy/img/3_of_clubs.png'},       
	{'Kreuz 2',2,'http://167.99.90.247/testowy/img/2_of_clubs.png'},            {'Herz 10',10,'http://167.99.90.247/testowy/img/10_of_hearts.png'},    
	{'Pik König',10,'http://167.99.90.247/testowy/img/king_of_spades.png'},     {'Karo 5',5,'http://167.99.90.247/testowy/img/5_of_diamonds.png'},         
	{'Kreuz 9',9,'http://167.99.90.247/testowy/img/9_of_clubs.png'}, 	        {'König Herz',10,'http://167.99.90.247/testowy/img/king_of_hearts.png'}
}
local PlayerData = {}
local playerPed = PlayerPedId()
local HasAlreadyEnteredMarker = false
local isDead = false
local hasAlreadyJoined = false
local CurrentAction = nil
local CurrentActionMsg  = ''
local CurrentActionData = {}
local society = 'casino'
local LastStation, LastPart, LastPartNum, LastEntity
local isInShopMenu = {}, false
local isBlackStarted = false
local game = false
local gameInProgress = false
local aces=0
local isPlatinium = false
local isP2playing = false
local isP1playing = false


ESX = nil


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()

end)



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)
			if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil  then
				if CurrentAction == 'Croupier' then
					Croupier()
				elseif CurrentAction == 'Player1' and isP1playing == false then
					Player1()
				elseif CurrentAction == 'Player2' and isP2playing == false then
					Player2()
				end
			end
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if PlayerData.job then

			local coords      = GetEntityCoords(PlayerPedId())
			local isInMarker  = false
			local currentZone = nil

			for k,v in pairs(Config.BlackjackSites) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('program-casino:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('program-casino:hasExitedMarker', LastZone)
			end

		end
	end
end)


--Show markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if PlayerData.job then
			local coords, letSleep = GetEntityCoords(PlayerPedId()), true

			for k,v in pairs(Config.BlackjackSites) do
				if v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, nil, nil, false)
					letSleep = false
				end
			end

			if letSleep then
				Citizen.Wait(1500)
			end
		else
			Citizen.Wait(1500)
		end
	end
end)



AddEventHandler('program-casino:hasEnteredMarker', function(zone)
	if zone =='Croupier' then
		CurrentAction     = 'Croupier'
		CurrentActionMsg  = "~r~[E] ~b~um den Blackjacktisch zu eröffnen"
		CurrentActionData = {}
	elseif zone == "Player1" then
		CurrentAction     = 'Player1'
		CurrentActionMsg  = "~r~[E] ~b~Um als erster Spieler beizutreten"
		CurrentActionData = {}
	elseif zone == "Player2" then
		CurrentAction     = 'Player2'
		CurrentActionMsg  = "~r~[E] ~b~Um als zweiter Spieler beizutreten"
		CurrentActionData = {}
	end
end)

AddEventHandler('program-casino:hasExitedMarker', function(zone)
	if CurrentAction == 'Player1' then
		TriggerServerEvent('program-blackjack:p1left')
		isP1playing = false
	elseif CurrentAction == 'Player2' then
		TriggerServerEvent('program-blackjack:p2left')
		isP2playing = false
	end
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)


	-------------------------------------------------------Koniec TP
AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job

	Citizen.Wait(5000)
end)

RegisterNetEvent('program-casino:notifyPlayers')
AddEventHandler('program-casino:notifyPlayers', function(quantity)
	local coords, letSleep = GetEntityCoords(PlayerPedId()), true
	if GetDistanceBetweenCoords(coords, Config.BlackjackSites.Croupier.Pos.x, Config.BlackjackSites.Croupier.Pos.y, Config.BlackjackSites.Croupier.Pos.z, true) < 29 then
		ESX.ShowAdvancedNotification("~p~BlackJack", "~p~Einsatz: ~g~"..quantity.."$", "~p~Der Tisch beginnt, denken Sie daran, dass das Golden / Platinium Ticket Vorrang hat! ", "CHAR_BANK_BOL", 9)
	end
	Citizen.Wait(5000)
end)

RegisterNetEvent('program-blackjack:setPlatinium')
AddEventHandler('program-blackjack:setPlatinium', function()
	print("elo")
	isPlatinium=true
end)

RegisterNetEvent('program-blackjack:isPlatiniumSetFalse')
AddEventHandler('program-blackjack:isPlatiniumSetFalse', function()
	print("el2o")
	isPlatinium=false
end)



RegisterNetEvent('program-blackjack:givecards')
AddEventHandler('program-blackjack:givecards', function()
	local lista = #cards
	local card = math.random(0,lista)
	if card == 0 or card == 1 or card == 2 or card == 3 then
		aces = aces + 1
	end
	local wynik = cards[card][2]
	local finish = false
	ESX.ShowNotification("~p~Sie haben sich an den Tisch gesetzt, Ihre erste Karte ist ~b~" ..cards[card][1].. " ~p~über den Wert ~b~"..cards[card][2].."~n~~b~" ..wynik.." ~p~Punkt")
	ESX.ShowNotification("~o~Um eine Karte auszuwählen, klicken Sie auf ~r~ [F]~o~ drückem Sie zum Stoppen und Anzeigen von Karten auf ~r~[X]")
	TriggerEvent("pNotify:SendNotification", {
		text = "<font style='font-size: 14px'><div style='height: 150px; width: 100px; min-width: 100px; min-height: 150px; border-radius:10px; background-image: url("..cards[card][3].."); background-color:white; background-size: contain; background-position: center;  background-repeat: no-repeat;'></div>",
		type = "cards",
		queue = "global",
		timeout = 0,
		layout = "bottomRight"
	})
	while not finish do
		Citizen.Wait(0)
		if IsControlJustReleased(0, Keys["F"]) then
			card = math.random(0,lista)
			if card == 0 or card == 1 or card == 2 or card == 3 then
				aces = aces + 1
			end
			wynik = wynik+cards[card][2]
			TriggerEvent("pNotify:SendNotification", {
				text = "<font style='font-size: 14px'><div style='height: 150px; width: 100px; min-width: 100px; min-height: 150px; border-radius:10px; background-image: url("..cards[card][3].."); background-color:white; background-size: contain; background-position: center;  background-repeat: no-repeat;'></div>",
				type = "cards",
				queue = "global",
				timeout = 0,
				layout = "bottomRight"
			})
			ESX.ShowNotification("~p~Die gewählte Karte ist ~b~" ..cards[card][1].. " ~p~über den Wert ~b~"..cards[card][2].."~n~~p~Sie haben  ~b~" ..wynik.." ~p~Punkt")
			if wynik>21 then
				if aces > 0 then
					aces = aces-1
					wynik = wynik - 10
					ESX.ShowNotification("~p~Sie hatten ein Ass, haben also nicht verloren, sondern nur 1 Punkt vom Ass statt 11 gezählt")
				else
					finish=true
					ESX.ShowNotification("~p~Sie haben insgesamt über 21 Punkte, d. H. ~b~" ..wynik.. "~p~, Sie verlieren, wenn Ihr Gegner nicht auch 21 überschritten hat")
					aces = 0
				end
			end
		elseif IsControlJustReleased(0, Keys["X"]) then
			finish = true
			aces = 0
		end
		
		if finish then
			if CurrentAction == 'Player1' then 
				print("e")
				TriggerServerEvent('program-blackjack:sendResult1', wynik)
				Citizen.Wait(5000)
				isP1playing = false
			elseif CurrentAction == 'Player2' then 
				print("e")
				TriggerServerEvent('program-blackjack:sendResult2', wynik)
				Citizen.Wait(5000)
				isP2playing = false
			end
		end
	end
end)




function Croupier()
	if gameInProgress == false and PlayerData.job.name == 'casino' then
		ESX.UI.Menu.Open(
			'dialog', GetCurrentResourceName(), 'get_item_count',
			{
			title = "Stawka stołu",
			},
			function(data2, menu)

				local quantity = tonumber(data2.value)

				if quantity == nil or quantity < 1 then
					ESX.ShowNotification("Ungültiger Wert")
				else
					menu.close()
					TriggerServerEvent('program-blackjack:startTable', quantity)
					
					RequestAnimDict("rcmnigel1c")
					while not HasAnimDictLoaded("rcmnigel1c") do
						Citizen.Wait(100)
					end
					TaskPlayAnim(GetPlayerPed(-1), "rcmnigel1c", "hailing_whistle_waive_a", 2.7, 2.7, 3000, 48, 0, 0, 0, 0)	
					
					GameInProgress()
					ESX.SetTimeout(500, function()
					ESX.UI.Menu.CloseAll()
					end)
				end
			end,
			function(data2,menu)
			menu.close()
			end
		)
	elseif PlayerData.job.name ~= 'casino' then
		ESX.ShowNotification("Sie müssen ein Mitarbeiter sein, um den Tisch zu eröffnen")
	elseif gameInProgress == true and PlayerData.job.name == 'casino' then
		ESX.ShowNotification("~b~Derzeit läuft ein Spiel.. um ein neues zu starten beenden sie dieses mit ~r~[X]~b~ oder bis zum Ende warten..")
	end
	
end

function Player1()
	ESX.TriggerServerCallback('program-blackjack:checkStarting', function(result)
		if not result then
			ESX.ShowNotification('~r~Der Tisch wurde noch nicht eröffnet, wenden sie sich an einen Mitarbeiter!')
		else
			if isPlatinium then
				local elements = {
					{label = "Spielen Sie unversteuert",  value = 'black'},
					{label = "Spiel versteuert",  value = 'money'}
				}
			
				ESX.UI.Menu.CloseAll()
			
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'wybierz_walute', {
					title    = "Casino",
					align    = 'top-left',
					elements = elements
				}, function(data, menu)
					if data.current.value == 'notShow' then
			
					elseif data.current.value == 'black' then
						ESX.TriggerServerCallback('program-blackjack:checkBlackMoney', function(result2)
							if not result2 then
								ESX.ShowNotification('~r~Sie haben nicht genug Geld, um sich an den Tisch zu setzen!')
							else
								isP1playing = true
								TriggerServerEvent('program-blackjack:p1black')
								Citizen.Wait(1000)
								TriggerServerEvent('program-blackjack:p1')
								menu.close()
							end
						end)
					elseif data.current.value == 'money' then
						ESX.TriggerServerCallback('program-blackjack:checkMoney', function(result2)
							if not result2 then
								ESX.ShowNotification('~r~Sie haben nicht genug Geld, um sich an den Tisch zu setzen!')
							else
								isP1playing = true
								TriggerServerEvent('program-blackjack:p1')
								menu.close()
							end
						end)
					end
					
				end, function(data, menu)
					menu.close()
			
					CurrentAction     = 'Player1'
					CurrentActionMsg  = ""
					CurrentActionData = {}
				end)
			else
				ESX.TriggerServerCallback('program-blackjack:checkMoney', function(result2)
					if not result2 then
						ESX.ShowNotification('~r~Sie haben nicht genug Geld, um sich an den Tisch zu setzen!')
					else
						isP1playing = true
						TriggerServerEvent('program-blackjack:p1')
					end
				end)
			end
		end
	end)
end

function Player2()
	ESX.TriggerServerCallback('program-blackjack:checkStarting', function(result)
		if not result then
			ESX.ShowNotification('~r~Der Tisch wurde noch nicht eröffnet, wenden sie sich an einen Mitarbeiter!')
		else
			if isPlatinium then
				local elements = {
					{label = "Zagraj nieopodatkowaną",  value = 'black'},
					{label = "Zagraj opodatkowaną",  value = 'money'}
				}
			
				ESX.UI.Menu.CloseAll()
			
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'wybierz_walute2', {
					title    = "Casino",
					align    = 'top-left',
					elements = elements
				}, function(data, menu)
					if data.current.value == 'notShow' then
			
					elseif data.current.value == 'black' then
						ESX.TriggerServerCallback('program-blackjack:checkBlackMoney', function(result2)
							if not result2 then
								ESX.ShowNotification('~r~Sie haben nicht genug Geld, um sich an den Tisch zu setzen!')
							else
								isP2playing = true
								TriggerServerEvent('program-blackjack:p2black')
								Citizen.Wait(1000)
								TriggerServerEvent('program-blackjack:p2')
								menu.close()
							end
						end)
					elseif data.current.value == 'money' then
						ESX.TriggerServerCallback('program-blackjack:checkMoney', function(result2)
							if not result2 then
								ESX.ShowNotification('~r~Sie haben nicht genug Geld, um sich an den Tisch zu setzen!')
							else
								isP2playing = true
								TriggerServerEvent('program-blackjack:p2')
								menu.close()
							end
						end)
					end
					
				end, function(data, menu)
					menu.close()
			
					CurrentAction     = 'Player2'
					CurrentActionMsg  = ""
					CurrentActionData = {}
				end)
			else
				ESX.TriggerServerCallback('program-blackjack:checkMoney', function(result2)
					if not result2 then
						ESX.ShowNotification('~r~Sie haben nicht genug Geld, um sich an den Tisch zu setzen!')
					else
						isP2playing = true
						TriggerServerEvent('program-blackjack:p2')
					end
				end)
			end
		end
	end)
end




function GameInProgress()
	FreezeEntityPosition(GetPlayerPed(-1), true)
	gameInProgress = true
	while gameInProgress == true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, Keys['X']) then
			gameInProgress = false
			FreezeEntityPosition(GetPlayerPed(-1), false)
			TriggerServerEvent('program-blackjack:stopTable')
		end
	end
end


function CheckPos(x, y, z, cx, cy, cz, radius)
	local t1 = x - cx
	local t12 = t1^2

	local t2 = y-cy
	local t21 = t2^2

	local t3 = z - cz
	local t31 = t3^2

	return (t12 + t21 + t31) <= radius^2
end

function alert(msg)
	SetTextComponentFormat("STRING")
	AddTextComponentString(msg)
	DisplayHelpTextFromStringLabel(0,0,1,-1)
end

