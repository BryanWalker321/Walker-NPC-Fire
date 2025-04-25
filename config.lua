print("^2Walker-NPC-FireAndRescue ^7by ^1Bryan Walker ^7v^41^7.^40^7.^40")

Config = {}

-- Fire event settings (CAN BE CHANGED TO SUIT YOUR SERVER)
Config.FireDuration = 180000  -- Duration of the fire in milliseconds (3 minutes)
Config.NotificationDuration = 7000  -- Duration of the notification in milliseconds (7 seconds)
Config.DispatchInterval = 600000  -- Interval between automatic fire events in milliseconds (10 minutes)

-- List of fire locations (CAN BE CHANGED TO SUIT YOUR MAP)
Config.FireLocations = {
    {coords = vector4(394.36, -195.75, 59.71, 344.53), area = "Alta Street"},
    {coords = vector4(-158.94, -95.33, 54.05, 250.78), area = "Hawick Avenue"},
    {coords = vector4(-368.94, -402.91, 30.80, 261.74), area = "Dorset Drive"},
    {coords = vector4(-123.50, -317.27, 38.63, 338.94), area = "Las Lagunas Blvd."},
    {coords = vector4(-73.17, 269.58, 101.81, 98.91), area = "Eclipse Blvd."},
    {coords = vector4(-760.67, -36.92, 37.68, 117.38), area = "Boulevard Del Perro"},
    {coords = vector4(-929.49, -464.85, 37.05, 28.83), area = "Movie Star Way"},
    {coords = vector4(-1448.50, -674.73, 26.46, 42.02), area = "Marathon Avenue"},
    {coords = vector4(-1670.07, -489.63, 38.13, 322.29), area = "Cougar Avenue"},
    {coords = vector4(242.21, -860.79, 29.55, 251.23), area = "Legion Square (San Andreas Ave)"},
    {coords = vector4(175.21, -1889.78, 23.67, 64.48), area = "Covenant Avenue"},
    {coords = vector4(1268.93, -720.58, 64.25, 149.49), area = "East Mirror Drive"}    
}

-- AI Response Configuration (DO NOT CHANGE OR EDIT!)
Config.AIResponse = {
    dispatchServices = {
        [3] = true,  -- Fire Department Vehicles
        [5] = true   -- Ambulance Vehicles
    }
}

-- Audio settings (DO NOT CHANGE OR EDIT!)
Config.DispatchAudioFile = 'dispatch_fire'  -- Name of the audio file without extension
Config.DispatchAudioVolume = 0.7  -- Volume level for the audio (0.0 to 1.0)

-- Firetruck, firefighter, and car settings (CHANGE THE CAR MODEL ONLY!)
Config.FiretruckModel = 'firetruk'  -- Firetruck vehicle model
Config.FirefighterModel = 's_m_y_fireman_01'  -- Firefighter ped model
Config.FireCarModel = 'dominator'  -- Car model to spawn
