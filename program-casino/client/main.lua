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

local LastZone                = nil
local Blips                   = {}

local isBarman                = false
local isInMarker              = false
local isInPublicMarker        = false
local hintIsShowed            = false
local hintToDisplay           = "no hint to display"


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


--Show markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if PlayerData.job and PlayerData.job.name == 'casino' then
			local coords, letSleep = GetEntityCoords(PlayerPedId()), true

			for k,v in pairs(Config.CasinoSites) do
				if v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, nil, nil, false)
					letSleep = false
				end
			end

			if letSleep then
				Citizen.Wait(2000)
			end
		else
			Citizen.Wait(2000)
		end
	end
end)



	--TP
positions = {
    {{923.48, 47.28, 80.10, 0}, {1090.00, 207.00, -49.9, 0}},} --
	local player = GetPlayerPed(-1)
Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(5)
		local player = GetPlayerPed(-1)
		local playerLoc = GetEntityCoords(player)
		for i,location in ipairs(positions) do
			teleport_text = location[3]
			loc1 = {
				x=location[1][1],
				y=location[1][2],
				z=location[1][3],
				heading=location[1][4]
			}
			loc2 = {
				x=location[2][1],
				y=location[2][2],
				z=location[2][3],
				heading=location[2][4]
			}

			DrawMarker(1, loc1.x, loc1.y, loc1.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 36,237,157, 200, 0, 0, 0, 0)
			DrawMarker(1, loc2.x, loc2.y, loc2.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 36,237,157, 200, 0, 0, 0, 0)

			if CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc1.x, loc1.y, loc1.z, 2) then
				alert("Betreten Sie das Casino")

				if IsControlJustReleased(1, 38) then
					if IsPedInAnyVehicle(player, true) then
						PlayerData = ESX.GetPlayerData()
						local elements = {
							{label = "ClassicTicket",           value = 'classicTicket'},
							{label = "GoldTicket",              value = 'goldTicket'},
							{label = "PlatiniumTicket",         value = "platiniumTicket"},
							{label = "Eingang für Mitarbeiter", value = "worker"}
						}

						ESX.UI.Menu.CloseAll()

						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'CasinoCloak', {
							title    = "Casino Bramka",
							align    = 'center',
							elements = elements
						}, function(data, menu)
							if data.current.value == 'classicTicket' then
								menu.close()
								SetEntityCoords(GetVehiclePedIsUsing(player), loc2.x, loc2.y, loc2.z)
								SetEntityHeading(GetVehiclePedIsUsing(player), loc2.heading)
								classicTicket = true
							elseif data.current.value == 'goldTicket' then
								menu.close()
								SetEntityCoords(GetVehiclePedIsUsing(player), loc2.x, loc2.y, loc2.z)
								SetEntityHeading(GetVehiclePedIsUsing(player), loc2.heading)
								goldTicket = true
							elseif data.current.value == 'platiniumTicket' then
								menu.close()
								SetEntityCoords(GetVehiclePedIsUsing(player), loc2.x, loc2.y, loc2.z)
								SetEntityHeading(GetVehiclePedIsUsing(player), loc2.heading)
								platiniumTicket = true
							elseif data.current.value == 'worker' then
								if PlayerData.job.name=='casino' then
									menu.close()
									SetEntityCoords(player, loc2.x, loc2.y, loc2.z)
									SetEntityHeading(player, loc2.heading)
								else
									menu.close()
									ESX.ShowNotification('~r~Sie sind kein Mitarbeiter des Casinos')
								end
							end

						end, function(data, menu)
							menu.close()

							CurrentAction     = ''
							CurrentActionMsg  = ""
							CurrentActionData = {}
						end)
					else
						PlayerData = ESX.GetPlayerData()
						local elements = {
							{label = "Classic Ticket ["..Config.classicPrice.."$]",     value = 'classicTicket'},
							{label = "Gold Ticket ["..Config.goldenPrice.."$]",         value = 'goldTicket'},
							{label = "Platinium Ticket ["..Config.platiniumPrice.."$]", value = "platiniumTicket"},
							{label = "Eingang für Mitarbeiter",                         value = "worker"}
						}

						ESX.UI.Menu.CloseAll()

						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'CasinoCloak', {
							title    = "Casino Gateway",
							align    = 'center',
							elements = elements
						}, function(data, menu)
							if data.current.value == 'classicTicket' then
								ESX.TriggerServerCallback('program-casino:checkMoney', function(result)
									if result>=Config.classicPrice then
										SetEntityCoords(player, loc2.x, loc2.y, loc2.z)
										SetEntityHeading(player, loc2.heading)
										classicTicket = true
										TriggerServerEvent('program-casino:removeMoney',Config.classicPrice)
									else
										ESX.ShowNotification('~r~Du hast nicht genug Geld')
									end
								end)
								menu.close()
								wyzeruj()
							elseif data.current.value == 'goldTicket' then
								menu.close()
								ESX.TriggerServerCallback('program-casino:checkMoney', function(result)
									if result>=Config.goldenPrice then
										SetEntityCoords(player, loc2.x, loc2.y, loc2.z)
										SetEntityHeading(player, loc2.heading)
										goldTicket = true
										TriggerServerEvent('program-casino:removeMoney',Config.goldenPrice)
									else
										ESX.ShowNotification('~r~Du hast nicht genug Geld')
									end
								end)
								wyzeruj()
							elseif data.current.value == 'platiniumTicket' then
								menu.close()
								ESX.TriggerServerCallback('program-casino:checkMoney', function(result)
									if result>=Config.platiniumPrice then
										SetEntityCoords(player, loc2.x, loc2.y, loc2.z)
										SetEntityHeading(player, loc2.heading)
										platiniumTicket = true
										TriggerServerEvent('program-casino:removeMoney',Config.platiniumPrice)
										TriggerServerEvent('program-casino:sendPlatinium')
									else
										ESX.ShowNotification('~r~Du hast nicht genug Geld')
									end
								end)
								wyzeruj()
							elseif data.current.value == 'worker' then
								if PlayerData.job.name=='casino' then
									menu.close()
									SetEntityCoords(player, loc2.x, loc2.y, loc2.z)
									SetEntityHeading(player, loc2.heading)
								else
									menu.close()
									ESX.ShowNotification('~r~Sie sind kein Mitarbeiter des Casinos')
								end
								wyzeruj()
							end

						end, function(data, menu)
							menu.close()

							CurrentAction     = ''
							CurrentActionMsg  = ""
							CurrentActionData = {}
						end)
					end
				end

			elseif CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc2.x, loc2.y, loc2.z, 2) then
				alert("Verlasse das Casino-Center")

				if IsControlJustReleased(1, 38) then
					if IsPedInAnyVehicle(player, true) then
						SetEntityCoords(GetVehiclePedIsUsing(player), loc1.x, loc1.y, loc1.z)
						SetEntityHeading(GetVehiclePedIsUsing(player), loc1.heading)
						platiniumTicket = false
						TriggerServerEvent('program-casino:sendOffPlatinium')
						goldTicket = false
						classicTicket = false
						wyzeruj()
					else
						SetEntityCoords(player, loc1.x, loc1.y, loc1.z)
						SetEntityHeading(player, loc1.heading)
						platiniumTicket = false
						TriggerServerEvent('program-casino:sendOffPlatinium')
						goldTicket = false
						classicTicket = false
						wyzeruj()
					end
				end
			end
		end
	end
end)

function wyzeruj()
	CurrentAction     = ''
	CurrentActionMsg  = ""
	CurrentActionData = {}
end

AddEventHandler('program-casino:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

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
    --TP
	
	AddEventHandler('esx:onPlayerDeath', function(data)
		isDead = true
	end)

	AddEventHandler('playerSpawned', function(spawn)
		isDead = false
	end)

RegisterNetEvent('program-casino:openTicketMenuClient')
AddEventHandler('program-casino:openTicketMenuClient', function(worker)
	print(worker)
	local elements = {
		{label = "Nicht zeigen",  value = 'notShow'}
	}
	if goldTicket then
		table.insert(elements, {label = "Zeigen Sie das goldene Ticket", value = 'showGolden'})
	end
	if platiniumTicket then
		table.insert(elements, {label = "Platin Ticket anzeigen", value = 'showPlatinium'})
	end
	if classicTicket then
		table.insert(elements, {label = "Zeigen Sie das Ticket", value = 'showClassic'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pokazTicket', {
		title    = "Casino",
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'notShow' then

		elseif data.current.value == 'showGolden' then
			TriggerServerEvent('program-casino:sendTicket', "Der Kunde hat ein goldenes Ticket", worker)
		elseif data.current.value == 'showPlatinium' then
			TriggerServerEvent('program-casino:sendTicket', "Der Kunde hat ein Platinticket", worker)
		elseif data.current.value == 'showClassic' then
			TriggerServerEvent('program-casino:sendTicket', "Der Kunde hat ein klassisches Ticket", worker)
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = ''
		CurrentActionMsg  = ""
		CurrentActionData = {}
	end)
end)


function OpenCasinoActionsMenu()
	PlayerData = ESX.GetPlayerData()
	local elements = {
		{label = "Fragen Sie nach einem Ticket",  value = 'ticket'}
	}
	if closeStock == true then
		table.insert(elements, {label = "Verstärkungsschrank", value = 'weaponArmory'})
	end
	if PlayerData.job.grade_name == 'boss' then
	 	table.insert(elements, {label = "Handlungen des Chefs", value = 'boss_actions'})
	end


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'casino_mgmt', {
		title    = "Casino",
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'ticket' then
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			print(GetPlayerServerId(closestPlayer))
			if closestPlayer ~= -1 and closestDistance <= 3.0 then
				TriggerServerEvent('program-casino:openTicketMenu', GetPlayerServerId(closestPlayer), GetPlayerServerId(playerPed))
			else
				ESX.ShowNotification('~r~Nie ma nikogo w pobliżu')
			end
		elseif data.current.value == 'boss_actions' then
			TriggerEvent('esx_society:openBossMenu', 'casino', function (data, menu)
				menu.close()
			end, {wash = true})
		elseif data.current.value == 'weaponArmory' then
			OpenVaultMenu()
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = ''
		CurrentActionMsg  = ""
		CurrentActionData = {}
	end)

end

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job

	Citizen.Wait(5000)
end)

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

function IsJobTrue()
    if PlayerData ~= nil then
        local IsJobTrue = false
        if PlayerData.job ~= nil and PlayerData.job.name == 'casino' then
            IsJobTrue = true
        end
        return IsJobTrue
    end
end

function IsGradeBoss()
    if PlayerData ~= nil then
        local IsGradeBoss = false
        if PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'viceboss' then
            IsGradeBoss = true
        end
        return IsGradeBoss
    end
end

function SetVehicleMaxMods(vehicle)

  local props = {
    modEngine       = 1,
    modBrakes       = 1,
    modTransmission = 1,
    modSuspension   = 2,
    modTurbo        = true,
  }

  ESX.Game.SetVehicleProperties(vehicle, props)

end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)


function cleanPlayer(playerPed)
  ClearPedBloodDamage(playerPed)
  ResetPedVisibleDamage(playerPed)
  ClearPedLastWeaponDamage(playerPed)
  ResetPedMovementClipset(playerPed, 0)
end

function setClipset(playerPed, clip)
  RequestAnimSet(clip)
  while not HasAnimSetLoaded(clip) do
    Citizen.Wait(0)
  end
  SetPedMovementClipset(playerPed, clip, true)
end

function setUniform(job, playerPed)
  TriggerEvent('skinchanger:getSkin', function(skin)

    if skin.sex == 0 then
      if Config.Uniforms[job].male ~= nil then
        TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
      else
        ESX.ShowNotification(_U('no_outfit'))
      end
      if job ~= 'citizen_wear' and job ~= 'barman_outfit' then
        setClipset(playerPed, "MOVE_M@POSH@")
      end
    else
      if Config.Uniforms[job].female ~= nil then
        TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
      else
        ESX.ShowNotification(_U('no_outfit'))
      end
      if job ~= 'citizen_wear' and job ~= 'barman_outfit' then
        setClipset(playerPed, "MOVE_F@POSH@")
      end
    end

  end)
end

--Cloakroom
function OpenCloakroomMenu()
	PlayerData = ESX.GetPlayerData(-1)
	local elements = {
		{label = "Arbeitskleidung",  value = 'cloakroom'},
		{label = "Zivilkleidung",    value = "cloakroom2"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = _U('cloakroom'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'cloakroom' then

			menu.close()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
				end
			end)

		elseif data.current.value == 'cloakroom2' then

			menu.close()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	end)

end

function OpenVaultMenu()

  if Config.EnableVaultManagement then

    local elements = {
      {label = _U('get_weapon'), value = 'get_weapon'},
      {label = _U('put_weapon'), value = 'put_weapon'},
      {label = _U('get_object'), value = 'get_stock'},
      {label = _U('put_object'), value = 'put_stock'}
    }
    

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'vault',
      {
        title    = _U('vault'),
        align    = 'bottom-right',
        elements = elements,
      },
      function(data, menu)

        if data.current.value == 'get_weapon' then
          OpenGetWeaponMenu()
        end

        if data.current.value == 'put_weapon' then
          OpenPutWeaponMenu()
        end

        if data.current.value == 'put_stock' then
           OpenPutStocksMenu()
        end

        if data.current.value == 'get_stock' then
           OpenGetStocksMenu()
        end

      end,
      
      function(data, menu)

        menu.close()

        CurrentAction     = 'menu_vault'
        CurrentActionMsg  = _U('open_vault')
        CurrentActionData = {}
      end
    )

  end

end

function OpenFridgeMenu()

    local elements = {
      {label = _U('get_object'), value = 'get_stock'},
      {label = _U('put_object'), value = 'put_stock'}
    }
    

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'fridge',
      {
        title    = _U('fridge'),
        align    = 'bottom-right',
        elements = elements,
      },
      function(data, menu)

        if data.current.value == 'put_stock' then
           OpenPutFridgeStocksMenu()
        end

        if data.current.value == 'get_stock' then
           OpenGetFridgeStocksMenu()
        end

      end,
      
      function(data, menu)

        menu.close()

        CurrentAction     = 'menu_fridge'
        CurrentActionMsg  = _U('open_fridge')
        CurrentActionData = {}
      end
    )

end

function OpenVehicleSpawnerMenu()

  local vehicles = Config.Zones.Vehicles

  ESX.UI.Menu.CloseAll()

  if Config.EnableSocietyOwnedVehicles then

    local elements = {}

    ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(garageVehicles)

      for i=1, #garageVehicles, 1 do
        table.insert(elements, {label = GetDisplayNameFromVehicleModel(garageVehicles[i].model) .. ' [' .. garageVehicles[i].plate .. ']', value = garageVehicles[i]})
      end

      ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'vehicle_spawner',
        {
          title    = _U('vehicle_menu'),
          align    = 'bottom-right',
          elements = elements,
        },
        function(data, menu)

          menu.close()

          local vehicleProps = data.current.value
          ESX.Game.SpawnVehicle(vehicleProps.model, vehicles.SpawnPoint, vehicles.Heading, function(vehicle)
              ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
              local playerPed = GetPlayerPed(-1)
              --TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)  -- teleport into vehicle
          end)            

          TriggerServerEvent('esx_society:removeVehicleFromGarage', 'casino', vehicleProps)

        end,
        function(data, menu)

          menu.close()

          CurrentAction     = 'menu_vehicle_spawner'
          CurrentActionMsg  = _U('vehicle_spawner')
          CurrentActionData = {}

        end
      )

    end, 'casino')

  else

    local elements = {}

    for i=1, #Config.AuthorizedVehicles, 1 do
      local vehicle = Config.AuthorizedVehicles[i]
      table.insert(elements, {label = vehicle.label, value = vehicle.name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'vehicle_spawner',
      {
        title    = _U('vehicle_menu'),
        align    = 'bottom-right',
        elements = elements,
      },
      function(data, menu)

        menu.close()

        local model = data.current.value

        local vehicle = GetClosestVehicle(vehicles.SpawnPoint.x,  vehicles.SpawnPoint.y,  vehicles.SpawnPoint.z,  3.0,  0,  71)

        if not DoesEntityExist(vehicle) then

          local playerPed = GetPlayerPed(-1)

          if Config.MaxInService == -1 then

            ESX.Game.SpawnVehicle(model, {
              x = vehicles.SpawnPoint.x,
              y = vehicles.SpawnPoint.y,
              z = vehicles.SpawnPoint.z
            }, vehicles.Heading, function(vehicle)
              --TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1) -- teleport into vehicle
              SetVehicleMaxMods(vehicle)
              SetVehicleDirtLevel(vehicle, 0)
            end)

          else

            ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)

              if canTakeService then

                ESX.Game.SpawnVehicle(model, {
                  x = vehicles[partNum].SpawnPoint.x,
                  y = vehicles[partNum].SpawnPoint.y,
                  z = vehicles[partNum].SpawnPoint.z
                }, vehicles[partNum].Heading, function(vehicle)
                  --TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)  -- teleport into vehicle
                  SetVehicleMaxMods(vehicle)
                  SetVehicleDirtLevel(vehicle, 0)
                end)

              else
                ESX.ShowNotification(_U('service_max') .. inServiceCount .. '/' .. maxInService)
              end

            end, 'etat')

          end

        else
          ESX.ShowNotification(_U('vehicle_out'))
        end

      end,
      function(data, menu)

        menu.close()

        CurrentAction     = 'menu_vehicle_spawner'
        CurrentActionMsg  = _U('vehicle_spawner')
        CurrentActionData = {}

      end
    )

  end

end

function OpenSocietyActionsMenu()

  local elements = {}

  table.insert(elements, {label = _U('billing'),    value = 'billing'})
  if (isBarman or IsGradeBoss()) then
    table.insert(elements, {label = _U('crafting'),    value = 'menu_crafting'})
  end

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'casino_actions',
    {
      title    = _U('casino'),
      align    = 'bottom-right',
      elements = elements
    },
    function(data, menu)

      if data.current.value == 'billing' then
        OpenBillingMenu()
      end

      if data.current.value == 'menu_crafting' then
        
          ESX.UI.Menu.Open(
              'default', GetCurrentResourceName(), 'menu_crafting',
              {
                  title = _U('crafting'),
                  align = 'bottom-right',
                  elements = {
                      {label = _U('jagerbomb'),     value = 'jagerbomb'},
                      {label = _U('golem'),         value = 'golem'},
                      {label = _U('whiskycoca'),    value = 'whiskycoca'},
                      {label = _U('vodkaenergy'),   value = 'vodkaenergy'},
                      {label = _U('vodkafruit'),    value = 'vodkafruit'},
                      {label = _U('rhumfruit'),     value = 'rhumfruit'},
                      {label = _U('teqpaf'),        value = 'teqpaf'},
                      {label = _U('rhumcoca'),      value = 'rhumcoca'},
                      {label = _U('mojito'),        value = 'mojito'},
                      {label = _U('mixapero'),      value = 'mixapero'},
                      {label = _U('metreshooter'),  value = 'metreshooter'},
                      {label = _U('jagercerbere'),  value = 'jagercerbere'},
                  }
              },
              function(data2, menu2)
            
                TriggerServerEvent('program-casino:craftingCoktails', data2.current.value)
                animsAction({ lib = "mini@drinking", anim = "shots_barman_b" })
      
              end,
              function(data2, menu2)
                  menu2.close()
              end
          )
      end
     
    end,
    function(data, menu)

      menu.close()

    end
  )

end

function OpenBillingMenu()

  ESX.UI.Menu.Open(
    'dialog', GetCurrentResourceName(), 'billing',
    {
      title = _U('billing_amount')
    },
    function(data, menu)
    
      local amount = tonumber(data.value)
      local player, distance = ESX.Game.GetClosestPlayer()

      if player ~= -1 and distance <= 3.0 then

        menu.close()
        if amount == nil or amount < 0 then
            ESX.ShowNotification(_U('amount_invalid'))
        else
            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_casino', _U('billing'), amount)
        end

      else
        ESX.ShowNotification(_U('no_players_nearby'))
      end

    end,
    function(data, menu)
        menu.close()
    end
  )
end

function OpenGetStocksMenu()

  ESX.TriggerServerCallback('program-casino:getStockItems', function(items)

    print(json.encode(items))

    local elements = {}

    for i=1, #items, 1 do
      table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = _U('casino_stock'),
		align    = 'bottom-right',
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('invalid_quantity'))
            else
              menu2.close()
              menu.close()
              OpenGetStocksMenu()

              TriggerServerEvent('program-casino:getStockItem', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPutStocksMenu()

ESX.TriggerServerCallback('program-casino:getPlayerInventory', function(inventory)

    local elements = {}

    for i=1, #inventory.items, 1 do

      local item = inventory.items[i]

      if item.count > 0 then
        table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
      end

    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = _U('inventory'),
		align    = 'bottom-right',
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('invalid_quantity'))
            else
              menu2.close()
              menu.close()
              OpenPutStocksMenu()

              TriggerServerEvent('program-casino:putStockItems', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenGetFridgeStocksMenu()

  ESX.TriggerServerCallback('program-casino:getFridgeStockItems', function(items)

    print(json.encode(items))

    local elements = {}

    for i=1, #items, 1 do
      table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'fridge_menu',
      {
        title    = _U('casino_fridge_stock'),
		align    = 'bottom-right',
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'fridge_menu_get_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('invalid_quantity'))
            else
              menu2.close()
              menu.close()
              OpenGetStocksMenu()

              TriggerServerEvent('program-casino:getFridgeStockItem', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPutFridgeStocksMenu()

ESX.TriggerServerCallback('program-casino:getPlayerInventory', function(inventory)

    local elements = {}

    for i=1, #inventory.items, 1 do

      local item = inventory.items[i]

      if item.count > 0 then
        table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
      end

    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'fridge_menu',
      {
        title    = _U('fridge_inventory'),
		align    = 'bottom-right',
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'fridge_menu_put_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('invalid_quantity'))
            else
              menu2.close()
              menu.close()
              OpenPutFridgeStocksMenu()

              TriggerServerEvent('program-casino:putFridgeStockItems', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenGetWeaponMenu()

  ESX.TriggerServerCallback('program-casino:getVaultWeapons', function(weapons)

    local elements = {}

    for i=1, #weapons, 1 do
      if weapons[i].count > 0 then
        table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
      end
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'vault_get_weapon',
      {
        title    = _U('get_weapon_menu'),
        align    = 'bottom-right',
        elements = elements,
      },
      function(data, menu)

        menu.close()

        ESX.TriggerServerCallback('program-casino:removeVaultWeapon', function()
          OpenGetWeaponMenu()
        end, data.current.value)

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPutWeaponMenu()

  local elements   = {}
  local playerPed  = GetPlayerPed(-1)
  local weaponList = ESX.GetWeaponList()

  for i=1, #weaponList, 1 do

    local weaponHash = GetHashKey(weaponList[i].name)

    if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
      local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
      table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
    end

  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'vault_put_weapon',
    {
      title    = _U('put_weapon_menu'),
      align    = 'bottom-right',
      elements = elements,
    },
    function(data, menu)

      menu.close()

      ESX.TriggerServerCallback('program-casino:addVaultWeapon', function()
        OpenPutWeaponMenu()
      end, data.current.value)

    end,
    function(data, menu)
      menu.close()
    end
  )

end

function OpenShopMenu(zone)

    local elements = {}
    for i=1, #Config.Zones[zone].Items, 1 do

        local item = Config.Zones[zone].Items[i]

        table.insert(elements, {
            label     = item.label .. ' - <span style="color:green;">$' .. item.price .. ' </span>',
            realLabel = item.label,
            value     = item.name,
            price     = item.price
        })

    end

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'casino_shop',
        {
            title    = _U('shop'),
			align    = 'bottom-right',
            elements = elements
        },
        function(data, menu)
            TriggerServerEvent('program-casino:buyItem', data.current.value, data.current.price, data.current.realLabel)
        end,
        function(data, menu)
            menu.close()
        end
    )

end

function animsAction(animObj)
    Citizen.CreateThread(function()
        if not playAnim then
            local playerPed = GetPlayerPed(-1);
            if DoesEntityExist(playerPed) then -- Check if ped exist
                dataAnim = animObj

                -- Play Animation
                RequestAnimDict(dataAnim.lib)
                while not HasAnimDictLoaded(dataAnim.lib) do
                    Citizen.Wait(0)
                end
                if HasAnimDictLoaded(dataAnim.lib) then
                    local flag = 0
                    if dataAnim.loop ~= nil and dataAnim.loop then
                        flag = 1
                    elseif dataAnim.move ~= nil and dataAnim.move then
                        flag = 49
                    end

                    TaskPlayAnim(playerPed, dataAnim.lib, dataAnim.anim, 8.0, -8.0, -1, flag, 0, 0, 0, 0)
                    playAnimation = true
                end

                -- Wait end animation
                while true do
                    Citizen.Wait(0)
                    if not IsEntityPlayingAnim(playerPed, dataAnim.lib, dataAnim.anim, 3) then
                        playAnim = false
                        TriggerEvent('ft_animation:ClFinish')
                        break
                    end
                end
            end -- end ped exist
        end
    end)
end


AddEventHandler('program-casino:hasEnteredMarker', function(zone)
 
    if zone == 'BossActions' and IsGradeBoss() then
      CurrentAction     = 'menu_boss_actions'
      CurrentActionMsg  = _U('open_bossmenu')
      CurrentActionData = {}
    end

    if zone == 'Cloakroom1' then
      CurrentAction     = 'menu_cloakroom'
      CurrentActionMsg  = _U('open_cloackroom')
      CurrentActionData = {}
    end
	
	if zone == 'Cloakroom2' then
      CurrentAction     = 'menu_cloakroom'
      CurrentActionMsg  = _U('open_cloackroom')
      CurrentActionData = {}
    end

    if Config.EnableVaultManagement then
      if zone == 'Vaults' then
        CurrentAction     = 'menu_vault'
        CurrentActionMsg  = _U('open_vault')
        CurrentActionData = {}
      end
    end

    if zone == 'Fridge' then
      CurrentAction     = 'menu_fridge'
      CurrentActionMsg  = _U('open_fridge')
      CurrentActionData = {}
    end

    if zone == 'Bar1' or zone == 'Bar2' or zone == 'Bar3' or zone == 'Random1' or zone == 'Random2' or zone == 'Eat1' or zone == 'Eat2' or zone == 'CasinoChips' then
      CurrentAction     = 'menu_shop'
      CurrentActionMsg  = _U('shop_menu')
      CurrentActionData = {zone = zone}
    end
    
    if zone == 'Vehicles' then
        CurrentAction     = 'menu_vehicle_spawner'
        CurrentActionMsg  = _U('vehicle_spawner')
        CurrentActionData = {}
    end

    if zone == 'VehicleDeleters' then

      local playerPed = GetPlayerPed(-1)

      if IsPedInAnyVehicle(playerPed,  false) then

        local vehicle = GetVehiclePedIsIn(playerPed,  false)

        CurrentAction     = 'delete_vehicle'
        CurrentActionMsg  = _U('store_vehicle')
        CurrentActionData = {vehicle = vehicle}
      end

    end

    if Config.EnableHelicopters then
        if zone == 'Helicopters' then

          local helicopters = Config.Zones.Helicopters

          if not IsAnyVehicleNearPoint(helicopters.SpawnPoint.x, helicopters.SpawnPoint.y, helicopters.SpawnPoint.z,  3.0) then

            ESX.Game.SpawnVehicle('swift2', {
              x = helicopters.SpawnPoint.x,
              y = helicopters.SpawnPoint.y,
              z = helicopters.SpawnPoint.z
            }, helicopters.Heading, function(vehicle)
              SetVehicleModKit(vehicle, 0)
              SetVehicleLivery(vehicle, 0)
            end)

          end

        end

        if zone == 'HelicopterDeleters' then

          local playerPed = GetPlayerPed(-1)

          if IsPedInAnyVehicle(playerPed,  false) then

            local vehicle = GetVehiclePedIsIn(playerPed,  false)

            CurrentAction     = 'delete_vehicle'
            CurrentActionMsg  = _U('store_vehicle')
            CurrentActionData = {vehicle = vehicle}
          end

        end
    end


end)

AddEventHandler('program-casino:hasExitedMarker', function(zone)

    CurrentAction = nil
    ESX.UI.Menu.CloseAll()

end)

-- Create blips
Citizen.CreateThread(function()

    local blipMarker = Config.Blips.Blip
    local blipCoord = AddBlipForCoord(blipMarker.Pos.x, blipMarker.Pos.y, blipMarker.Pos.z)

    SetBlipSprite (blipCoord, blipMarker.Sprite)
    SetBlipDisplay(blipCoord, blipMarker.Display)
    SetBlipScale  (blipCoord, blipMarker.Scale)
    SetBlipColour (blipCoord, blipMarker.Colour)
    SetBlipAsShortRange(blipCoord, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(_U('map_blip'))
    EndTextCommandSetBlipName(blipCoord)


end)

-- Display markers
Citizen.CreateThread(function()
    while true do

        Citizen.Wait(10)
        if IsJobTrue() then

            local coords = GetEntityCoords(GetPlayerPed(-1))

            for k,v in pairs(Config.Zones) do
                if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
                    DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, false, false, false, false)
                end
            end

        end

    end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
    while true do

        Citizen.Wait(10)
        if IsJobTrue() then

            local coords      = GetEntityCoords(GetPlayerPed(-1))
            local isInMarker  = false
            local currentZone = nil

            for k,v in pairs(Config.Zones) do
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

-- Key Controls
Citizen.CreateThread(function()
  while true do

    Citizen.Wait(10)

    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlJustReleased(0,  Keys['E']) and IsJobTrue() then

        if CurrentAction == 'menu_cloakroom' then
            OpenCloakroomMenu()
        end

        if CurrentAction == 'menu_vault' then
            OpenVaultMenu()
        end

        if CurrentAction == 'menu_fridge' then
            OpenFridgeMenu()
        end

        if CurrentAction == 'menu_shop' then
            OpenShopMenu(CurrentActionData.zone)
        end
        
        if CurrentAction == 'menu_vehicle_spawner' then
            OpenVehicleSpawnerMenu()
        end

        if CurrentAction == 'delete_vehicle' then

          if Config.EnableSocietyOwnedVehicles then

            local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
            TriggerServerEvent('esx_society:putVehicleInGarage', 'casino', vehicleProps)

          else

            if
              GetEntityModel(vehicle) == GetHashKey('rentalbus')
            then
              TriggerServerEvent('esx_service:disableService', 'casino')
            end

          end

          ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
        end


        if CurrentAction == 'menu_boss_actions' and IsGradeBoss() then

          local options = {
            wash      = Config.EnableMoneyWash,
          }

          ESX.UI.Menu.CloseAll()

          TriggerEvent('esx_society:openBossMenu', 'casino', function(data, menu)

            menu.close()
            CurrentAction     = 'menu_boss_actions'
            CurrentActionMsg  = _U('open_bossmenu')
            CurrentActionData = {}

          end,options)

        end

        
        CurrentAction = nil

      end

    end


    if IsControlJustReleased(0,  Keys['F6']) and IsJobTrue() and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'casino_actions') then
        OpenSocietyActionsMenu()
    end


  end
end)


-----------------------
----- TELEPORTERS -----

AddEventHandler('program-casino:teleportMarkers', function(position)
  SetEntityCoords(GetPlayerPed(-1), position.x, position.y, position.z)
end)

-- Show top left hint
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(10)
    if hintIsShowed == true then
      SetTextComponentFormat("STRING")
      AddTextComponentString(hintToDisplay)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)
    end
  end
end)

-- Display teleport markers
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(10)

    if IsJobTrue() then

        local coords = GetEntityCoords(GetPlayerPed(-1))
        for k,v in pairs(Config.TeleportZones) do
          if(v.Marker ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
            DrawMarker(v.Marker, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
          end
        end

    end

  end
end)

-- Activate teleport marker
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(10)
    local coords      = GetEntityCoords(GetPlayerPed(-1))
    local position    = nil
    local zone        = nil

    if IsJobTrue() then

        for k,v in pairs(Config.TeleportZones) do
          if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
            isInPublicMarker = true
            position = v.Teleport
            zone = v
            break
          else
            isInPublicMarker  = false
          end
        end

        if IsControlJustReleased(0, Keys["E"]) and isInPublicMarker then
          TriggerEvent('program-casino:teleportMarkers', position)
        end

        -- hide or show top left zone hints
        if isInPublicMarker then
          hintToDisplay = zone.Hint
          hintIsShowed = true
        else
          if not isInMarker then
            hintToDisplay = "no hint to display"
            hintIsShowed = false
          end
        end

    end

  end
end)

--Phone
RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = _U('phone_casino'),
		number     = 'casino',
        base64Icon = 'data:image/png;base64, aVZCT1J3MEtHZ29BQUFBTlNVaEVVZ0FBQVJnQUFBQzBDQU1BQUFCNCtjT2ZBQUFBbVZCTVZFVUFBQURLQUlZQUFRQUFBd0RTQVkzT0FZclBBWXZVQVkvTEFJYktBWWpTQVl6V0FaRFBBb3pKQVlpOEFuL0ZBb1dKQWwya0FtK1dBbWFDQWxoREFpNnpBbmw1QWxKeUFrNnFBbk82QW42U0FtTm1Ba2JCQW9LeEFYaGZBa0dWQW1WTUFqUXdBaUpYQWp3M0FpWWRBaFVuQVJ0MUFsQTVBU2dNQXdrVEF3NUhBekZzQWtyZkFwWWhBUmRqQWtReEFTSVpBaE1oQWhjbkF4cTZnQ2U5QUFBZHpVbEVRVlI0bk8wOUNYdmlPTStnMkRGT0Fra0lSNEJBT1VxQk10TjI1Ly8vdU0rNUxjY08wRWxuM3YyMjJtZDNac2xseTdKdXliM2VOM3pETjN6RE4zekROM3pETjN6RE4zekROL3dKQUV2OEMzOTdGUDk3QUxNSWV0Yjdmd3N6OTh4Mng5eW9GMjcrVzRpeGZwNmZqUmRoOTM0K24rWkp2Mis3by84U1hnQ3NjTFY5TTF6c1BRM0pqN2ZRSlgwQlpQWGZRUXpBN0MwWVFielJYNzBrQWlOVHkrbnpGREg4MzRTWFlxendPWUVCbHlramlmWDZZNnQ5M3BwU3NZTm1KNWJoaFk3L1BHSTB3NElTZEhjTHNMSXJ6NnZyZGY0eWU3bSs3U2NmajM5Mndpbm41MS9jRG9KZm1pSHNXVVlvb3d3dmZiSjkrQU8vRFhqNmtOSUJYSGFiMlRnY1QrcGZlNzFzN3ZCcjh2WVNoRlBmOHp4R0NQRm5tOG12eTgvSlNqTzM5cTlPUE5xbjRkenVjL3ZIcm5uZGltbGZBdC82eE14K0V5Q01qN3RaOFdITGVsOHQ0OFJ6aytYZTJ1MDMrODFzR1U1SGNSZ0V5LzBwbWc0Wkk1NU5LUzhHUEFyRDhkTnlHVjMzdTRjd1kvM2lZdUtjMmdQeEV0WlVVV0RIWkx6UWNUZHpWYi95REJmdHJqaWNMcjM5MktFZUs5WnNOL1lKb2VsYXhVRThKQ2w0ZERDZ3krdHN1UjR5RzYxaUJnTkt4VTB1VzYvWFB4OFowaUovVllaZzl0b2MzZEtXdjBMMm41dDU2eERnWXpkOVgwS3VXTXNYVmtQaXZ2bE1qSkNHK1ozd3hNckI5dW1nejlPL1pmK2hqZ1luT2RpQ2FKYkJScytSaklPS2lQUUt0bTNjWUNHOGNQcFoxcHNQU3NNeUFmWWozNzc0VDNCK1dWN2xTM0IxK3p6ZWtXcko0UDFwNUJsbWJ3WTZuandMWnZ3Z0MvaEFHNFc4cWZPR0ZkNUo0ZU1zSnBzckNQVXdpb0pvdVlqSFVTVHRkbmlkdW4xNkNzazY5QWgxbjZRckYxdVFBcDFtaE9DbmVObTZsUFArWTBDSnZ3NkQyZm5SUVk4UlFkanpCbUttaUVDZHEwNXl0cVBsc0JkQ1lpUjRvaC90RDgvcDNUTEpnRStGeEp2YS9ZeGRrcGNhOFFVeFo1aXdnL1N4MFlOSVNmRXlQbGlmSWZJTHBrdzdVbDRDVzRKdWNHdk13M21YYWdzQTY2TVJKNzNOY3NFSnNXM0JIdnYyMitSMXU5MEtPYkxkblV2VXdNcEozenNvM3M4djB1UEQrcnRza2dwcFBKYjdFQk90OXVsWEwvb2htZ0JtRGlMTmh2YW1FQXlkU2t1OWNjY2h4SXZBMVNGR0lPenlzaGJ5STU5dmpuYVNnME5jbDhZdjUyeUxJU3B3QXVuOWUya1RaenZwK0RoaXVQaW9HN3hzSmc5dUpVZ1UvTWJLOVEzaU1JaWlZRTBwWFR2YzF2QmpvWG51WStiUXZzb1JPT2VVMm5TMTMyL21xV29BTCtnRFhIN0h1bDZUYk1GZ2NqZGljbUZGczVYZzhXejNxRVdBRmlXREJML0JTdkRNMks2UUxSODlPQWdUSVIwQWIxamJBaTJ6aEdtRkovRVhRaE9yT2RrejJzcE01bUJiYVd3a3MrSW0rbmMyUUNndUFpVjBOSTdlTmtLcmcwY0ZVcXBScXNLUDRFbk9HRVpNamdNWWNlcnRsOFd6emUwSHM2RmhiZjEva0tnR01RRDVBd3VKVDFvTENRdjhuQ2s1dS9pV1RCSzZIT09MK0NuYVRENStRMFUvMitxTDJWRWV0NldNd3d1eUllOVpxbG1WZ3BNb2dncmVmQU5heEliMzErTkk0b05iUkxIdVFYckxSbG9UR2hjWWc3Q0Zaamh4dmNYVGFsZUl2ZCt3ZFdIV21BR1RGVnU0S3RkSlpqRmtvNnYwQ2M1a3ZnYldjYzFNeThyOE1GaE5qdExOaVBQYVQ5S0wwQ1l1WFVEV3NudzNGN1JoTzBRbWVKNnNEajNyTWZYV2hKaWtNUVVIS1RJelphZXRzNHYvSUhUeE5jTEwzTWdIQm91dG92UXF5cU10T1FiZ0tsM2lKVSsyVXB2WkVlS2YrbE9oNU04M0s0bms3WEZYWG5yQmVodUlzUU9FR0x6VldPN2h3K1FzTy9RRXp6Q1NTNzgvblc5UHgxK1hHamN3a20rbS9rbDZrUytwdUhSY0d0YmkyZWZEWkxLN0ZKYkZXQm9LMDd2WlBnSFd0RGtKR3NvcnVzYXI3MmM3L1JWTE1pcXQweTVwTUMwWkhNYm9OQXlpMStMMU1sWDA3Yldzb2I3SVZPbStHbWF3aysraW5mbER0cXFzVHQrK2tGVHlBNzdCaTlJZkxhenkyY3ZxZG5pMUIzMFRwS0pkS0RCdjB1eGwzWTVUWDc1aXlTWlJVeDhvd0pJSkpqZS91d0JZYTZiQmZXbDRZOHhpU0NwTzRBMWppNVM4VkJqSnJtRWJwVnFGWjN0SkdGM24rK3I5TUpIZnhFN3k3T2N5S1pDR0FWZkFVWDZCTzlIZjlEaGVYalVFSTFhdWtqSEN1TVhUQ3pNNWlBMjVRVnk1bXpmYTkvV3A0eTJpeWVIbk9XZThrcUlpZXdhRkxTQ3pLbG1INlhNOVV3VnNBQys2Y2tWRHJCTWZRMXJGbG9RZGhTNjVCNnRKTVBhc0dJKzFieW92Z2xMWU1Kd2Z0Uk9EaVV4Z3c0b2hwM3J6U21iaG5tcllsbmVla1NlcHN5amd1MVlMNDNhbFppam1BTTFrTlY3TGRBY1VkeDhhRGlUSzR0bmJ4Q1JDaFZFdTR6ZXlVbWZ1ZWJKZnphT25VS2FFZ2EzemVhWnZDT1JQSmwyeFhzVVJVNjlQcFgwcXdweGszT0hnNHR0TEFyYUdmUVhJK3RDMmhvQll2M09ZWEovV1E4SXlEeTdDdmJjMDRBV0dFbzlrWFVVQjRjT2d0cE9TaHlsYlRZaUdsRU1zTWNFVVNneW9ncjFQeWJ6VlB3U0tQNE9rcG5qNUtmUW14K0R0UVdvNVQ3cFM3cXpBb0hGVVlhT2RJbjB5aThqeTBhaExEM0REdGhES1dydmZUTFhyalI1THBGaWhOeXprMFhWR01HRFN4Q3AzT0E0T0ZNcWQ0aEVwREd2WUVUeXZnWDhydUtVUWpCbVlTUXFqb1hSSE1JckVxY0VwRkd2TFExb09tV1cvcWpaQ3JwVTBOcEozRXk4NjVWSUxVd05UeGRaQXc0Zi9XUURmUkxwa2xkOHd4N1NSNnhLcWlMZXo4VmlLQ0RldmN2MTlGWlVHNEs0cGpIV1dIRG1EemhKVFlHNGltRUxORkVZY0dsK2hTMWg0UGpUWDdpQlJSUGo4NXZjbmluQXpnVzNLSUVBellQdXVPSXlWR0lmaVpCb2JEc09WcENHc0ovUnpnVVNGdUdoY0RUTlZkZ3REK09jdlNSM1JLNWNhR0JyVm9LbDhWMmZtNDBiWkp6SUtNc1FjbGFoS1VId2E4eGoybkVzcVBCbjdaM3B6S3R2UCsyVVlIZUYwSFM5R3dVejhyWnptVVVNd1BETTA4Vy9reFVRS1A2WGQyMkZpaWlJUzVQL0xJMXZLaXBMQ0c0azlib05wTmxIVnFzeU5CSmhFYStJdXI4dTFsOGJnUnpFWGY1WitsU2RQNC9BUTlnTlRmcmVmVFZPTzZwWGo3R1M0NlZGUVJjSXdwUFY0YktGb1lsdWwzdW1LM1psSktrRDZSS1pxcFJnTXZDenZnTnFsY0J1a2Y1SThNdDlUekljVVozNGNYTGNYSE03aFU5Tkdza2ExektSZlpUNE9GaXRwWndtNnRCVDlucE04QXdNN3pNUTBmNlUvbmpDV1dacFVVRVVRRkNoU0ZyQ3VRTmtvMkQ5bjdtdEFucWZhUW0zQXUvUlJabkpqUFl5WGQwUVBuQzdsTUN3TlErc0Z5NnhTK1lSbnBOdmtURlkxRW9Ua2hLVkw5ZHBBbmx5RHlZS05EN1VuR0RtWnVmZVBhUXBSeGVzNE0yTHZZY1FvNWlQYnloNERUaDAxUEVsS0h4SUtHdkI4cGJCR3hGTzNNQmpRa2hyUjZSUElRZUZzcEhBWUxPUW5CN0ZKdVlOUnRScGllYnBDekVYeFZ5ZHdSUlJDRkJaVWhXM3hGaXdJQnJPZHpBRjRNa1ZTZVpaMWhGNkRkRlpBdGp0SG9SeUVHT2tMOW9QUmVqT281cU1UQ2NLVVVlVW9tNE50U3llZGJPY1hzZ0E3UlhLWnRqR0dtR242eUQ5bzQ2TGx4clJzelBZRGFRcHJ3ejJQQXd3eHdYaG53VlBSVHdyckhaVlJRT1NqTGJWZXBBdG4ySUs5WjFEZmN1ZG96WG81cDJjVXNFVWNoaGlaaCtRdEkwdkRQWS9qUmVHc3FYaHUxVU9kVXNsQ3ZnWHU1bTRvd0VqTVhPbGdoUktpNjNmelRIV1grRU9mcldTaVVGUm8yNGlYOThxWWw3VHMzMFlNZGxoeUl0WnNaSTU2eUdIK1NDTDBNbGlocEhSbU93UGUyTEJNaUhGNVhMMDhVM0hndmVZanlyUXc2L1VDSTJKcW10UGtESDRXTm9yRE1xWFh0Z3l1S2dyWUExbmRJVVVXSGVZbmVSelR1azZKUS91VUpFK3JuMVpRRVVqR2FHWCtvRGpuSm1ob25zSFZLKzhrT3VyTVNsTENaVFJ6V0U1YjRtUzFDMEdLQTNDN3lQWlZOcWJ6VXZ6OHo4dDZ1SGhOMzMydUprdEgyVnRxWGFER2VmNSt4SHB0ZzZ0WFFKMVl4VFFaZ1o4RE5aaVVlM2hidHBLc2IwTWQwcldMSUF0Z0VWZWxCQlFoSlBGUEhXdk5uUU9IaWl4VUcrY2lpNEFCL1REdnBQS2JIZW93aWpXUXA3eTFKVVBLMlE5MXNxQlRobm9BNi83TjNNYWExZWJoRjZ0bVZQa1A5YTJJOWRwTFkzNUxuUXJnR1czTWgyR0g3SDFhSkphWnZUTjlXdTkwaWRxcThGZ1A2endOejNWdHIvTE1OU2dITXNrSzd5UTV6c1NKMlRsYU9ybTRZd3JkUGc2S0ZlaE84cUdaRVNQUHRNNW1Jdk9LSVdQRThFUkZUSzF4Wk1pVUV5ODl2QTkrSVMycHhjVlMrUUpZWjNqcFhaQU1LWE5IUWZFMFNVQzI5Y2MvcW15bU92Q3ZJa2J4OWtvNW1UbW5sVmlPcDh4ZFZnYjZ6SlE2TEY1UmJsNXFja284RGhiNk9LMld0eEZGTE9mSkUybEFGWjkxNmlBT0tEbFhXRE94M3Vxd1NtNzRTSXF5aStzNUVLTnJTOHl2RkFTM0swK3ZhZ2xYUnZPRm1xU1NJMm5sdFpORzNpK3FYY1NxcklVMDMwbFNUUEtkOUZHdkRONTEyRDN1dGtSM3k4VmxobGovWi9DQ1V0N3FtUENIeVNMSTFPSVNxdEFoS2lkUTRwVzhUK0pENFhOYXlpYVRtL3ZOaFk1WU1vZ1hQRFk1dnRlbTZKZHMwdXZPR0ZDVU8xN0ptNSttcUNRU01oWGZUdVRnYXpPL2tiSWtISS9qaE1rbU84blp2T0RmbzRLaEthWXppa3pxcXFhcUczT2xTL0NCN2lydHNIVzhyRjVzcEJnNVNhbmNTWnlncFZhenJ2SjMyNnA5WGJndXdQZHliczFWSTBkMmFTZ0tqZ0k4dXpFdHV1Z01ubVRLSUZLNnJZbjVTdmw0dlNwZmFvaDV3MzJ4VmpkRERPeFlNaDVrMkYwcUJDTm5qYlhGeitCWHRoREdRTnduQUpBamhzdHVRNE1lZzNKT2lwM0VIY3p6UU0wazBnRzM5M21FOTgwZFp6dUpxa0Y0a09WbFc4QVZjbTVQakJibTQ0RFhGbVZtNlcwbE9VK3hkbUJ6Wld2RC9uYTAxU2xKSUdDNXpHZUsxSkdUZ0xpdVZxeStNMGd6UTUzdUpKSjQ1WlBFRFZCcG95RmdLbnZRQU1yQ2dabUttRHZDcmVXV3RNSWtJendTcVdPVDNlejJ1UTB4NElkVDJsMU1ObjJsbkp1RFZlNVE1OWJuUTFUN2xCUS9OZ2Q5dVZXK1NjcVViVmdFcVJwSEYycFNrUnlKSHNSdEtVZEMzd0ZlbXlRZGdJVTBLQ1FRVlo5dnNYQ1lYQmU1TU5ob2h2UktUT0dTSEpsVjNpRDRyNTVZSHRJb0RQOUh3bTJSaDJJQUdNK2ZYZFVpK3kxQURnTEYyTk9tbmRtNFdDN1Q1YmxXa01LK0RUT2NWVVl3Yk4vY2tOdE5uK1hLcmNQNUdwcVU0ZEtidVoyNXA3SkJ5ZVlBd2RRdzB5REdWaXJ5TTA3Q3R0b2h3ZFkyeHRqa0pIeGhKUEF4cGMzeXhDQ0Nrc25jekhXQnFkOHBYaWJTcW5JYmQ5QlJ5NUt5QVI3d0N6S2Z3OVN3L2VIWFZGRm5xRWNXdVk1TFRsS2tjZmlTMk12bWJnU2h4K1FzMEppTFdOLzZvOVArTlpaa2kzQ2xIZ0dpWmxaR3c2WlBkeUl4Rjc3QWpCS2FnMjNiekE5bnAyZmlwQXhGM2pqdjRZbXdkOTNqZSthZGZENWMyTSszK09xK3MrU0dES3lFMTFKSnpRL1lOaW1HWEpVWEJHS3pKQzN5QXM2emNMME9sMEV3SHIvc3hJMFF1WnVRTXNTVnpoQVFyUmNGeHU0ZWZMYmZCN2NtQXJQdS9Ka3BIQWhmbElrc3FpMmlGcDJuWUtzTDkwUzVNMnYxUFVPdkxFWE1pL0c5T1NUZUJqRVVvU2U3MnB6L001dkJXYWdubStQTldYZmNiRzVPdk1xblpLczl1aHBSZUc2UFZUMU9XTC9lSTBYZHNBOTdGcnNxTlBiczZUTnlYMlBvN1g1c2VtYkgzUmVCRlZLL2pIemh1R2dLemNJUk5TRTFyYXh5aktGQkhZQ2dqTk5DUmUvckQ3M1FTYkYxNkZMUHZ4Y2dzU00vTjBlYVhpQjRhaWoxS29PRG84dTloOGQ5VWpVNXVENloyZFJmYWNqNDdKRWliTU41STZFRVlqV1R2NWt0K2U1MkVmV0R0MGU3bFh3MWJOMXBRUmFhZ2lkUWJTWGVMQkg2K0JGMlVjLzhPMVhpWHdKemQrYVhDbFFUTVVxbWtDYXFBOUFlM01weW5NOGZIeDlwZ2QvSDluaitLL3ZpRXhDd0RjbTdPZWxvK1UxMTlXdjhobTBXcitBbXEyVThvc3gxdlZFY2h2RjRPZXR1N0Y4S1lad0phMzNOZ3BKRSttRGlyTFVOcGpRdG5uZW4wZjU0eVhydGREWHNyNGZwWkoweVdLcXFKd1ZnajhwOVpYUUFsM25zSjhtUVpjWUdUOTZ6VnIvL3NuNi9HOHVqZ3NWU3c1aHg5cGwvYzJacHg4WlZUQnlKTjlINFpSWXN4MklmaWIyMG5PMlBWbnBUZHpNd1IwdktSbW1mU3QrRXZSdkdBNkpYb2VCTVpOdVl6RzkwNDlwdDMyWkxUbFNPTFl4SFdvTEhtTDhJbC9QSGVoVWF2eWdHZE5CcEN5aytKdGZvYVJ5dUYrTmpZWlU4SlBsZzZRcURpT3U5cVFMWnI2bHZNVmNBZVh2UFNJQ0FNZExpZjhsZndvZGlsNDJTZStQdVpyNlVFY05TRUtnaUtUTUVuRGNoVHdkRFI3UHRkaldmejFkdm0vMzI5QUNYZ3lUY0VQcGt2RjlJN0FHSlU0Y3NaMjl0aUlIejRtYWpLRXB0OTFWc0pFdHNwVHVkczhhcHdNUUQ2KzNINmh6Z0ppaVFGZnNRVWl6UU1PMUc1VGdPY2JJV2svSGQxZW5ISWNTVW1FUGxRc2Rqa1RXbVlvTzBoZ0d0MDdBMUpwQzJoa3JXNCtERm1DaW1mYXNWVE5UQVFUa3dFc0tIMTNlZndySGtrb0NOejF6UG1JdlFwNjYvdlc5Sm5uK0JUYWRtQ3JOR1pKejJTdkJmN1Jaa0E3eTB0SWRKSlZPd1B4Wk9CL1ZSWTB3RTRCRFB3dFc2WjhGUHF4RStDTjF0MmdPQzdFZmMzVmEvdG1jbXB5T0p1Y1pScVAzNkcxRjdTY2x3Wm9uWXMwL3U0WU8wNE1VSzIrT3g5aFY2YWl1azdIOCtCT1pOZStXeUpMYi9iSThoOHNsQ2FiZ0ZHK1piYWZXanZ5VzE3eGdnYm0xVDA4L0s1eWQ2LzNUaisyTnFyQzhVTVBtUkpzdU14N0ExNTZuRHliODFIbWZ4Tkp1L3lISVQwa3FrOVFGK01vT3dpR3k3YjU5RzNpaHRoRVlwTnRJT0RvK3pDdkZSd21zakQ1YXRkSnNCTmJtbkc5TktsSVFVRExPMDZVUXZlTzQxaUxrQ2EzNHJmQy8wWDViRVM3bUdGdVkvbnEzQVhRUWJIL1FPNDlSUzRXbTd6WFN1YXF4K1RYbVN4Y1k1bHlJKzE5dDQ2WE55MDBtYXd6TnBEVHBrSHNWV0tXZTFkWi9LUnNMRDYwbU4xVStFVWI1eE9RMERQOVRXaVFTWkg3N2tvZ1R4N0t6L1JPa1JxUTNiTzR2ODdaOTNrVXphS1AzbVRTM3M1VGpTMUhmS2VQSG56VVpyWVBuczhETU5MMHdTaVhmS2QrQW15b3JwS1lkMWFnNnBLOEhWSWVZK2tyays1SmRVaHc5YmU5Qk92dmE4cUNsR2owMmRkZFlBY1JIWTJ2UXhKWENqVkFiQVdycFlkc1lHTUxYclVJRGVGOGpkdDZVUTNBQ0FPM2ExSGM0MnIrKzczZk81VXNxdHFVM0hRV3FIY2FxdEFhNXlLSXE1WTM4d3lKbS9nekp5QzJxWmR3YTgyVTNFWjNmWkk3OWp6MEZnNnNxRlZzZ203TWNQNWcyVGRhWkNDT0h1cGI4V1YzVVJSdHhkaFNyOUxXQ21LUVBxYVNzdUIxellaMGpkNC9iZVdEbllFWUExdnJkekI5OUtiZ2RoVTBtWEhEV0FsOTBpeDlPNUhNdk5yc3JsUzFVQUVKZTYwdFFFb1A0b0hpK25RMlRXT3ZOVmR4bjFlcnpjME9xeVNRbDdtcmlNVGFPcXZ6M090T0t1am1Cd2c4QWw1dDBXcWh3dGEvWnhxMGx2T1h0N1Rkc29acGNtOGlhalMrdExEL1VCQ0Z1TnhsUjNFVEFLbzdmSjd2aStyU3FsY1Nxb05yMGRkWlRrbmhJR1JIVVB0TWlyQnBTbGxEcXdKVkVJYjFJNzYzVHZmaUZpaE1YZmt2c3lvR3l4aGZOMi85RTRoVVJwcU5LbzEwbGhqd2xHdWZwVFRzOG9UMFBBWElrb3B1cEJjcmgxMTBoUkN4QVo5dEhBSVR5Snh4dFRYb2pTSVJuM1JjekJrcVZ4MVZlamVzTlNTcURtWmRJZElySkdtYTJjd0VTZmVsOEpqZGJaK1RpcHM3Z0tVOWo4M0E0N1N4dmxPaWtjSkZuSGJYVWVaeGxyVmJiMnE0eHZYMWtWUzI0YjYzeGxuQUtPMnJ4RFRyTE92QzNQcVoyV2RENVYzTXlacUlrR2VNOFVLb25NZHpoVGo4bTZvQmQyMVhwVEEyQ050RllKYTA4SFVjVk5Pb2xtTkF0UTdWUWoweHYxbDZpMFprdCtSblZrUUNDUjZRMEg3ZThCQkRxQlJKTmJ6ZXdCMUVvQ1RkTXhpR1JxZEpSamJIQkgweUxIRkZDdmhVYnJ1d09SMUY5ejFYWUhjTkl4R0h0OWN5bVVDbExPZElORXlwMnRlcU5CN3NGTUM5cEF6ZnU0a2dRTkI5UUMyRFdmMC9mYkFMcU5aSnRhbDBqUEtlMENXYVI1QkpFRTkzNHBWMUZTY21WWXkzd0h4OWV0QzI3YzhabXphKzRGSzlLMGhMTmIvTWJWZzdpbnVLTjF2cUpFK3lhSFFhL2dKY0hJZktjNjEwZFlJYnRyNk9IRGpvam1aTEd1NEplT3dkd09VcVpOUXhEQmFIUExoTHpUdUJTcXE4K29GSytzYVVXNkF6bGxTdVZ4RThSK0ZoSkZTdEVYSm1kcGF5ZnNPeXg1NVVGOVFqTXFXMjI0YWl6VTU3T1U1UGpGUEZuSFU1KzU2VGxjcXMrQnJyOHVmQTZ2R2o4WmEwM3pMeDlrc2wvQTRKUkd1OEp0T0JkUlE2WlN0ejlpMXBXZUxtUG82ZXAzMW9WSU0vS21ZNVhiNFcydkRsaHJGa2djd3BCa2o5cGlOOUtIWDJRVWxGblhxTmFyRGJqM2hReEdXOUYzVDVXUWtDZUpWRXBuU0xXeDVIUklvb1l2bEdaNDVWZEhabXRXQmtxNjZoZW9uWitHdzl4VkFBNnh1NWZTaGcwTmlKRkxzOUZaQ0RIWnF0ZmM2VDRmdU9mclV2Szdna2JuNHY2OXFzR3pPNVdQVVRDY1d5dlRZL01Vb2pYcUVWWTZITnJPeWFtQmRaRkRhUWJRZEQ0MDk3MlVINXo5bUVoOVlBemRjYkF0cUZDK2NuNUdHUTc3dUNQSzFuZVMvZGVlZTZycGczeGZmU1pNMXhMQmNHMmxpZUxvYjJTUG8wcnV5dUd3dEc4aWhwdGJVSFlGeldOMHVPcjgwTU9IZTZwYkNwa3F5OUZaYkdvVEdEakxCTVBkZ3A0dVhsdURzUnpzbGdML2JrQ3puN1ZlL3VhRDg2bTFxR2ZRUEk0enYwc09tYWs5dWxDVGgvbzhtRUFKaFBMOFNERE55UWxmQ1kzU2ZjN3ZLN2VEeFVRMkRrMzVGVktqV3pYZUJHZmNBTGJZSERneWx4N254NGkvR0NWRCtaZ3IwbVZiQXkwME8zbzNkQTA5SE5aeS8zQ1RUMFErNlU5TjJyRUMzUGZ6bzRpTXlOMHNxUmRIcTIzYWRNUTZiNlVnUm9ldG1Rd1FOUmhkU3pxUkJGYTRsWFNRQVRmMEdaRDFGUElQdmdlNWVtdDZtc2krbHFGOGtxM1VoSzY3anNjbWlGVkdkMjlYN3IwMXJYZWhLZDFBNWlJRFpZc3F2bzd5M0lNUDJTakNUVlJBWW9pZHRnalJqYnloeE56NVJVQ1doR25MeTIweVZNTWFWLzN6d3N1QlVzdFU1NDBVNHU2eVI0Z09kaXFMdWR1empNU1pxU2VrekY0cDFnQ3hTTXI3SXZkdWlUSEp1THhSelA2YmdIcHE1c00zSndqako1RWxZZXFkTHhzOVdDVlRUdUd0UFo0U1lwb1dSRzNXNlpPVE9vTm1abzZqNitpZ0FleGdNdXcvM01zVWVYaVVjRlJsbmNtZGI1cDVObktVN1Q3aCtWbG9XTmJrNSsySFVzRDZqMEgxUVhFVFpIM0RCdS9oc2p3YytUUWJra2Z1NjIwYjBxaTdnV2JyVGYvT0oxRkxYSk1rUTN6RWszdlVuQldIWE5WMlJpSWtOZktLN1M1Nlo2cm01d0M0S3EzdjFROFFxWm42SGVEMERnbDdscExXWFBoL0FIWVN2ckg3SDVTRHZld3ZMYXk3cUdHVFFXdDVRVDNLWjJ6K21SNlNFY05yWW9SSThlbVdpUUN5MDR6TDUzdW1SekRpbzB6YmU4LzhKalFQYUIvYzJja2RPV1h0SitPSlViS3VRbDVLQmp0VG5LbGw0MHFrRzlWNU5tQmQ5a0dpK05QY0wvU0NheG9hM0VjeEFMNjhCWTBxaGRRcnU1LzFrcmNzTWNzUE5kR3ZqTXRpM2NnUjFzRHphWCtOd2lsM2lTbzkyeXRuZmhjMEo5ZFA3M3B1cjRuRDYrNVQrcFk2UEY0dTE0MUpsdkVvZUVjWVcvaHBycDlqVTExTlRuZUhhR3FoaVpoN2ZBNDRKNmFsRHdRMHpuTklhd1hWVDFaZHIwK3FINlk0aWFrSnZMc2o3dlFEYjU3UTBkS091WHJxN1NEdjk3WktsK01kMmJGVjhQbmVQUERVdG5hL2t2V21lbjFqNEhlY3duZ09aTmJSMmxCSmN5NTdFeTlsaG9SeWVsTUxzTlY5M3RmUHc2VkJNVGNiUi9WNis2c1VEOHQ2UGFVOURaNTNwOWY5YWo2YlJVR3dYQVpCbE1ZbGxmN2NPcWpQRzJnWXRHWlVCcDJka0c2QXBvTFhKeCszSG9wQ1JBYUw2Mnk1SG1aSjBZdzR0Z0NQMm5HMFNxc3kxVU5GTlVESzZBSUVkMFdUTWlkVnAwM2d0SWhwZHVPbjQxdlBoRFppaU55Ukc5ZG1mdXUrdjR3eVVRVzlHMXVKMXgxWnNBclFBdmI3SCtnUG9Pa3dtU2FjeU9aZUFiMnlicUI1ZUxFR2FKcHpsajRUT2Eyb1lVL1ZKQ2Z0VFJtTDl6b2RIaTNhQXRxMEFqS1YweFl1azFVVUxoWnhHTXd5dm94UEdES0Q2d1pwdnpPcmxhTVNLYW1pMlF1cEFaeUZXL2ZMSTIwWllyUzlpem56QlJwZVp0RlR1T0I1clQ2bmxCWGV4THNPeE9SSjJiUHN2WVdsRWluTHo5aUN1UVluMmNLdS9RanB6aEFEaHVXbjFQUFNCZzVTRStzOGhLNmVxR0o0M0hPSDQ5eXpZd1g2TGVMUVBwTWFsb0RtT0hvWk9IZG9aQW5wOTRmNmo5eDdnbTZWQzNWUCthWkQ0MmkvSzZRYm9QTThxbHRHdTVqSkhUY2FFVkdldHRZbzFXUnFNeis2L05HZUxQT2I3UnN5R1BqUmUwWXcyenNxQXpkeXd4M1l2cW0rRFo1bGNJeVBhRlA0ZFdDV1p5U1hidWZsTkJrT2s5RTBqQ2JRWWF2NWUrQjhxM1Z4RHBYRFpIbGJiZWZEYVJoVWlmT3dXek9GR0R3MlUzdGtwRWMrT0pSUXdjL1NuaFprR3UyczdNaURyS3ZSMzJqZlk5M1dUYk81bkhwRjJPZU8yeWx4azNkcGwrd1hwQ0lIYnJNazBOcGpsM2k4T1orZTRmazAyZTcrTEhYb1FEbTlXVXNCZlp1NWJuamRiM1U4aVdjV2N6cnZyRnNyWVdTNERpYktHbTlETzIzb0tvaGhFV3pONjU4ZFg1WHQyTDlBSWlxa2ltdzdzSFcwZno4ZTMwOG5rT28zTTI4MlpZeFB3M2c5WFNUSllocU9nOWwxZXdUTnZPQ3lXbzdIMGVibjM5a1hud0g1OEJZdHZZeGtKZ21ubkdGUTZoQlg4SkxYY3paVEMyb3dmUWZhK3liODcwR2o0Z2dEeFFXTWNBcVRKQkhjOWJxOS9MdTZ2VDBPRUxaS0psdnRSMnY5LzBaSERRQ2pWc3lReGV5RWEzdi81bWovSk1BNWFSWENRaWl4NGVLMkIrdi9IOEM1aldhRUNocTlyRloveEtyOVg0TzI1Z1hPM3ZydmJKNEdBTXhJM2xPL3hNZUEybDdhc1lEYzIram8veWNJSmVNWWhiRlExVWFFZVVLQmRZZHg4TExaYmsvSEx3MkYvaHVnY0YrQ3RabEYwZHN4bDBQL0hrWDE2K0V2V2JQZjhBM2Y4QTNmOEEzZjhBM2ZnT0QvQUhqZm9ZZ3QyMDhZQUFBQUFFbEZUa1N1UW1DQw=='
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_phone:removeSpecialContact', 'casino')
	end	
end)