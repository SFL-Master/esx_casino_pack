# esx_casino_pack

FXServer ESX CASINO JOB (only German at this Time)

[REQUIREMENTS]

    - bob74_ipl             => (https://github.com/Bob74/bob74_ipl)
    - Map_Files & DLC Cars  => (https://www.file-upload.net/download-13683714/Casino.zip.html)

    
- Player management (billing and boss actions)

    - esx_society => (https://github.com/ESX-Org/esx_society)
    - esx_billing => (https://github.com/ESX-Org/esx_billing)

- Items effects (hunger, thirst, drunk)

    - esx_status => (https://github.com/ESX-Org/esx_status)
    - esx_basicneeds => (https://github.com/ESX-Org/esx_basicneeds)
    - esx_optionalsneeds => (https://github.com/ESX-Org/esx_optionalneeds)

[INSTALLATION]

- CD in your resources/[esx] folder

- Import sql-files in your database

- Add this in your server.cfg :

```
start Casino
start program-casino
start program-blackjack
start slotmachine_1
```

If you want player management you have to set Config.EnablePlayerManagement to true in config.lua 
You can config VaultManagement & Helicopters with true/false (don't forget to comment the area in the same file)

[FEATURES]

    - Fully customizable job
    - Boss, Bartender, Guard, Croupier 
    - Cloakroom, Vault, Fridge, Vehicles, BossActions
    - Cloakroom : (Casino Outfits)
    - Shops (harvesting) for Crafting (alcoholic drinks, appetizers, non-alcoholic drinks)
    - Crafting menu for Bosses + Bartender (only with the right clothing) : coktails, mix appetizers
    - Spawning & delete Vehicles
    - working Teleporters
    - Players can miss the crafting part (~10% miss) and lose the components used
    - Billing menu
    - Phone/gcphone Support

[SHOPS (HARVESTING) AREAS]

- Alcoholic drinks => In the Casino & Penthouse 
- Non-alcoholic drinks => In the Casino & Penthouse 
- Appetizers => In the Casino & Penthouse 

[CASINO GAMES]

Blackjack => 
Slotmachine => 
CasinoChip-Shop

