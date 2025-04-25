# Walker-NPC-FireAndRescue for FiveM
AI NPC Fire Dept - Immersive and dynamic AI-driven emergency event system for FiveM servers - QB-Core/QBox FiveM

---

## Overview
**Walker-NPC-FireAndRescue** is an immersive and dynamic AI-driven emergency event system for FiveM servers. It triggers random explosions in various city locations, and AI fire and ambulance services respond automatically to the scene, enhancing roleplay depth and realism.

This script is lightweight, fully configurable, and ideal for public RP servers, emergency services communities, or casual FiveM setups looking to add life and unpredictability to the game world.

---

## Features
- **Automated random fire events** across configurable city locations.
- **NPC Fire and Ambulance response** via AI dispatch.
- **Optional Admin command** (`/triggerFire`) for manually spawning a fire.
- **Explosion, vehicle fires, notifications, and dispatch audio** for immersive effects.
- **Fully customisable timings, vehicle models, and fire locations** through `Config.lua`.
- **Automatic cleanup** of burnt vehicles after fires end.
- **Real-time server console logging** for monitoring events.
- **Built for both QB-Core and QBox frameworks** (easily switchable).

---

## Prerequisites
Before installing Walker-NPC-FireAndRescue, ensure your server has the following resources:

- [**QB-Core or QBox Framework**](https://github.com/qbcore-framework)
- [**qb-smallresources**](https://github.com/qbcore-framework/qb-smallresources) *(provides basic notifications and functionality)*
- [**InteractSound**](https://github.com/plunkettscott/interact-sound) *(or your own sound system; you may need to adjust config)*

> **Important:**
> If you are using **QBox**, change the `QBCore` object call in `client.lua` and `server.lua` to match the QBox export method. Adjust this line:
> ```lua
> local QBCore = exports['qb-core']:GetCoreObject()
> ```
> accordingly if your framework uses a different naming convention.

---

## Installation

1. **Download** or **clone** this repository.
2. Place the folder `walker-npc-fireandrescue` into your server's `resources` directory.
3. Add the following line to your `server.cfg`:
    ```
    ensure walker-npc-fireandrescue
    ```
4. Ensure your `InteractSound` is installed and working (or adapt the sound triggers if using an alternative system).
5. Restart your server.

---

## Configuration

All user-configurable settings are inside `**config.lua**`.

### Editable Options:
- **Fire Event Duration**
  ```lua
  Config.FireDuration = 180000  -- 3 minutes in milliseconds
  ```
- **Notification Duration**
  ```lua
  Config.NotificationDuration = 7000  -- 7 seconds
  ```
- **Automatic Dispatch Interval**
  ```lua
  Config.DispatchInterval = 600000  -- 10 minutes
  ```
- **Fire Locations:**
  ```lua
  Config.FireLocations = {
      {coords = vector4(394.36, -195.75, 59.71, 344.53), area = "Alta Street"},
      {coords = vector4(-158.94, -95.33, 54.05, 250.78), area = "Hawick Avenue"},
      -- Add or remove locations as needed
  }
  ```
  > **Tip:** Add as many locations as you like! Use `vector4(x, y, z, heading)` format.

- **Vehicle Models:**
  ```lua
  Config.FiretruckModel = 'firetruk'
  Config.FirefighterModel = 's_m_y_fireman_01'
  Config.FireCarModel = 'dominator'
  ```
  > **You can change the car model that explodes by editing `Config.FireCarModel`.**

### Non-Editable (System Settings):
- AI Dispatch Services
- Dispatch Audio Settings

These have been locked to ensure the script runs reliably.

---

## Commands

- `/triggerFire` — Admin-only command to manually trigger a random fire event.
  - Useful for testing or for creating spontaneous RP scenarios.

---

## File Structure
```
walker-npc-fireandrescue/
├── client.lua        # Handles car spawning, explosion, sound, and notifications
├── server.lua        # Controls random event timing and admin command handling
├── config.lua        # All user-customizable settings
├── fxmanifest.lua    # Resource definition and dependencies
└── audio/dispatch_fire.ogg  # Dispatch audio file
```

---

## Server Console Output

When the resource is loaded, you'll see this stylish console print:
```lua
print("^2Walker-NPC-FireAndRescue ^7by ^1Bryan Walker ^7v^41^7.^40^7.^40")
```
Providing clear confirmation that the resource is running correctly.


---

## Known Issues / Tips
- Ensure `qb-core`, `qb-smallresources`, and `InteractSound` are loaded before this resource.
- If using a custom sound system (like `xsound`), adjust `TriggerEvent('InteractSound_CL:PlayOnOne', ...)` to match your system.
- Timers are based on real-world server time, not game time.
- Fire events occur globally and are visible to all players.

---

## Credits
- Developed by Bryan Walker (@superspiderman4697 on Discord)
- Inspired by the need for lightweight, dynamic server immersion.

---

## License
Walker-NPC-FireAndRescue is released under the **GPU License**. Feel free to modify and redistribute with credit.

---

## Support
For questions, suggestions, or support, please open an issue on GitHub or contact @superspiderman4697 on Discord.

*"Keeping your city alive... one fire at a time."* 🚒🔥

