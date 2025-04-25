-- DO NOT CHANGE ANY VALUES HERE. USE CONFIG.LUA INSTEAD!!

local QBCore = exports['qb-core']:GetCoreObject()

-- Function to spawn a fire event
local function spawnFire()
    local fireLocation = Config.FireLocations[math.random(#Config.FireLocations)] -- Select a random location
    print("[Fire Event] Initiating fire event at: " .. fireLocation.area)

    -- Trigger the fire event (Dominator spawn and explosion)
    TriggerClientEvent('fireEvent:createFire', -1, fireLocation.coords, fireLocation.area)

    -- Schedule fire cleanup after the configured duration
    SetTimeout(Config.FireDuration, function()
        print("[Fire Event] Cleaning up fire event at: " .. fireLocation.area)
        TriggerClientEvent('fireEvent:endFire', -1, fireLocation.coords)

        -- Despawn the fire wrecked car
        TriggerClientEvent('fireEvent:despawnCar', -1, fireLocation.coords)
    end)
end


-- Command to manually trigger a fire event
QBCore.Commands.Add('triggerFire', 'Manually trigger a fire event for testing', {}, false, function(source)
    local src = source
    if src > 0 then
        print("[Fire Event] Manual fire trigger by player ID: " .. src)
    else
        print("[Fire Event] Manual fire trigger by console.")
    end
    spawnFire()
end, 'admin')  -- Restrict command to admin group

-- Automatic fire event scheduling
CreateThread(function()
    while true do
        Wait(Config.DispatchInterval)
        spawnFire()
    end
end)
