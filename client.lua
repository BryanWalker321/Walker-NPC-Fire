-- DO NOT CHANGE ANY VALUES HERE. USE CONFIG.LUA INSTEAD!!

local QBCore = exports['qb-core']:GetCoreObject()

-- Enable AI dispatch services
CreateThread(function()
    for service, enabled in pairs(Config.AIResponse.dispatchServices) do
        EnableDispatchService(service, enabled)
        print("[Fire Event] Dispatch service " .. service .. " set to " .. tostring(enabled))
    end
end)

-- Notify players of a fire and play dispatch audio
RegisterNetEvent('fireEvent:notifyPlayers')
AddEventHandler('fireEvent:notifyPlayers', function(area)
    QBCore.Functions.Notify("🔥 Explosion reported on: " .. area, "error", Config.NotificationDuration)
    TriggerEvent('InteractSound_CL:PlayOnOne', Config.DispatchAudioFile, Config.DispatchAudioVolume)
end)

-- Create a parked car, wait, then trigger car fire
RegisterNetEvent('fireEvent:createFire')
AddEventHandler('fireEvent:createFire', function(coords, area)
    -- Spawn a car 
    local carModel = GetHashKey(Config.FireCarModel)
    RequestModel(carModel)
    while not HasModelLoaded(carModel) do
        Wait(1)
    end

    local car = CreateVehicle(carModel, coords.x, coords.y, coords.z, coords.w, true, false)
    SetEntityAsMissionEntity(car, true, true)
    SetVehicleOnGroundProperly(car)
    print("[Fire Event] Car (Dominator) spawned at coordinates: " .. coords.x .. ", " .. coords.y .. ", " .. coords.z)

    -- Wait 30 seconds before triggering the explosion
    Wait(30000)
    AddExplosion(coords.x, coords.y, coords.z, 2, 10.0, true, false, 1.0)
    print("[Fire Event] Explosion triggered at coordinates: " .. coords.x .. ", " .. coords.y .. ", " .. coords.z)

    -- Notify players and dispatch AI firefighters
    TriggerEvent('fireEvent:notifyPlayers', area)
end)

-- Despawn the fire wrecked car
RegisterNetEvent('fireEvent:despawnCar')
AddEventHandler('fireEvent:despawnCar', function(coords)
    local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 70)
    if DoesEntityExist(vehicle) then
        DeleteEntity(vehicle)
        print("[Fire Event] Fire wrecked car despawned at coordinates: " .. coords.x .. ", " .. coords.y .. ", " .. coords.z)
    else
        print("[Fire Event] No vehicle found to despawn at coordinates: " .. coords.x .. ", " .. coords.y .. ", " .. coords.z)
    end
end)

