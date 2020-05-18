Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0) -- prevent crashing

		-- These natives have to be called every frame.
		SetPedDensityMultiplierThisFrame(1.0) -- set npc/ai peds density to 0
		SetRandomVehicleDensityMultiplierThisFrame(0.01) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.) to 0
		SetScenarioPedDensityMultiplierThisFrame(1.0, 1.0) -- set random npc/ai peds or scenario peds to 0
		SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
		SetRandomBoats(false) -- Stop random boats from spawning in the water.
		SetCreateRandomCops(false) -- disable random cops walking/driving around.
		SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
		SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.
		
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
        RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z);

        if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then

            if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1),false),-1) == GetPlayerPed(-1) then
                SetVehicleDensityMultiplierThisFrame(0.1)
                SetParkedVehicleDensityMultiplierThisFrame(0.0)
            else
                SetVehicleDensityMultiplierThisFrame(0.0)
                SetParkedVehicleDensityMultiplierThisFrame(0.1)
            end
        else
          SetParkedVehicleDensityMultiplierThisFrame(0.0)
          SetVehicleDensityMultiplierThisFrame(0.1)
        end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)

		DisablePlayerVehicleRewards(PlayerId())
		SetWeaponDrops()
	end
end)

local pedindex = {}

function SetWeaponDrops() 
    local handle, ped = FindFirstPed()
    local finished = false 
    repeat 

    if not IsEntityDead(ped) then
        pedindex[ped] = {}
    end

    finished, ped = FindNextPed(handle)
    until not finished
    
    EndFindPed(handle)

    for peds,_ in pairs(pedindex) do
        if peds ~= nil then
            SetPedDropsWeaponsWhenDead(peds, false) 
        end
    end
end