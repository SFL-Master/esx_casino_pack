Config                            = {}

Config.DrawDistance               = 55.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.classicPrice				  = 500
Config.goldenPrice				  = 5000
Config.platiniumPrice			  = 20000
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = true
Config.EnableMoneyWash            = true
Config.MaxInService               = -1
Config.Locale                     = 'de'
Config.MissCraft                  = 10 -- %


Config.CasinoSites = {
}

Config.AuthorizedVehicles = {
	{ name = 'issi7',      label = 'Weeny Issi Sport' },
	{ name = 'paragon',    label = 'Enus Paragon R' },
	{ name = 's80',        label = 'Annis S80 RR' },
}

Config.Blips = {
    
    Blip = {
      Pos     = { x = 924.19, y = 46.85, z = 81.20 },
      Sprite  = 617, --680 early
      Display = 4,
      Scale   = 1.8,
      Colour  = 47,
    },

}

Config.Zones = {

    Cloakroom1 = {
        Pos   = { x = 984.80, y = 60.24, z = 115.16 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 255, g = 187, b = 255 },
        Type  = 27,
    },
	
	Cloakroom2 = {
        Pos   = { x = 976.07, y = 64.48, z = 115.16 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 255, g = 187, b = 255 },
        Type  = 27,
    },

    Vaults = {
        Pos   = { x = 1114.53, y = 243.96, z = -46.84 },
        Size  = { x = 1.3, y = 1.3, z = 1.0 },
        Color = { r = 30, g = 144, b = 255 },
        Type  = 23,
    },

    Fridge = {
        Pos   = { x = 1112.38, y = 209.56, z = -50.42 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 248, g = 248, b = 255 },
        Type  = 23,
    },

    Vehicles = {
        Pos          = { x = 920.65, y = 41.71, z = 80.10 },
        SpawnPoint   = { x = 911.95, y = 40.66, z = 80.0 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 23,
        Heading      = 149.0,
    },

    VehicleDeleters = {
        Pos   = { x = 926.91, y = 56.85, z = 79.90 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
    },

    Helicopters = {
        Pos          = { x = 947.86, y = -4.84, z = 110.36 },
        SpawnPoint   = { x = 957.67, y = -6.24, z = 111.0 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 23,
        Heading      = 180.55,
    },

    HelicopterDeleters = {
        Pos   = { x = 971.64, y = 20.79, z = 110.32 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
    },

    BossActions = {
        Pos   = { x = 1112.16, y = 242.26, z = -46.82 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 0, g = 100, b = 0 },
        Type  = 1,
    },

-------- SHOPS --------

    Bar1 = {
        Pos   = { x = 1113.52, y = 208.65, z = -50.42 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 0, b = 0 },
        Type  = 23,
        Items = {
            { name = 'jager',      label = _U('jager'),   price = 3 },
            { name = 'vodka',      label = _U('vodka'),   price = 4 },
            { name = 'rhum',       label = _U('rhum'),    price = 2 },
            { name = 'whisky',     label = _U('whisky'),  price = 7 },
            { name = 'tequila',    label = _U('tequila'), price = 2 },
            { name = 'martini',    label = _U('martini'), price = 5 }
        },
    },
	
	Bar2 = {
        Pos   = { x = 1110.40, y = 208.34, z = -50.42 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 0, b = 0 },
        Type  = 23,
        Items = {
            { name = 'jager',      label = _U('jager'),   price = 3 },
            { name = 'vodka',      label = _U('vodka'),   price = 4 },
            { name = 'rhum',       label = _U('rhum'),    price = 2 },
            { name = 'whisky',     label = _U('whisky'),  price = 7 },
            { name = 'tequila',    label = _U('tequila'), price = 2 },
            { name = 'martini',    label = _U('martini'), price = 5 }
        },
    },
	
	Bar3 = {
        Pos   = { x = 947.91, y = 17.15, z = 115.18 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 0, b = 0 },
        Type  = 23,
        Items = {
            { name = 'jager',      label = _U('jager'),   price = 3 },
            { name = 'vodka',      label = _U('vodka'),   price = 4 },
            { name = 'rhum',       label = _U('rhum'),    price = 2 },
            { name = 'whisky',     label = _U('whisky'),  price = 7 },
            { name = 'tequila',    label = _U('tequila'), price = 2 },
            { name = 'martini',    label = _U('martini'), price = 5 }
        },
    },

    Random1 = {
        Pos   = { x = 1112.00, y = 206.36, z = -50.42 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 110, b = 0 },
        Type  = 23,
        Items = {
            { name = 'soda',        label = _U('soda'),     price = 4 },
            { name = 'jusfruit',    label = _U('jusfruit'), price = 3 },
            { name = 'icetea',      label = _U('icetea'),   price = 4 },
            { name = 'energy',      label = _U('energy'),   price = 7 },
            { name = 'drpepper',    label = _U('drpepper'), price = 2 },
            { name = 'limonade',    label = _U('limonade'), price = 1 },
			{ name = 'ice',         label = _U('ice'),      price = 1 },
            { name = 'menthe',      label = _U('menthe'),   price = 2 }
        },
    },
	
	Random2 = {
        Pos   = { x = 946.71, y = 15.34, z = 115.18 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 110, b = 0 },
        Type  = 23,
        Items = {
            { name = 'soda',        label = _U('soda'),     price = 4 },
            { name = 'jusfruit',    label = _U('jusfruit'), price = 3 },
            { name = 'icetea',      label = _U('icetea'),   price = 4 },
            { name = 'energy',      label = _U('energy'),   price = 7 },
            { name = 'drpepper',    label = _U('drpepper'), price = 2 },
            { name = 'limonade',    label = _U('limonade'), price = 1 },
			{ name = 'ice',         label = _U('ice'),      price = 1 },
            { name = 'menthe',      label = _U('menthe'),   price = 2 }
        },
    },

    Eat1 = {
        Pos   = { x = 1110.89, y = 209.50, z = -50.42 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 142, g = 125, b = 76 },
        Type  = 23,
        Items = {
            { name = 'bolcacahuetes',   label = _U('bolcacahuetes'),    price = 7 },
            { name = 'bolnoixcajou',    label = _U('bolnoixcajou'),     price = 10 },
            { name = 'bolpistache',     label = _U('bolpistache'),      price = 15 },
            { name = 'bolchips',        label = _U('bolchips'),         price = 5 },
            { name = 'saucisson',       label = _U('saucisson'),        price = 25 },
            { name = 'grapperaisin',    label = _U('grapperaisin'),     price = 15 }
        },
    },
	
	Eat2 = {
        Pos   = { x = 945.51, y = 13.30, z = 115.18 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 142, g = 125, b = 76 },
        Type  = 23,
        Items = {
            { name = 'bolcacahuetes',   label = _U('bolcacahuetes'),    price = 7 },
            { name = 'bolnoixcajou',    label = _U('bolnoixcajou'),     price = 10 },
            { name = 'bolpistache',     label = _U('bolpistache'),      price = 15 },
            { name = 'bolchips',        label = _U('bolchips'),         price = 5 },
            { name = 'saucisson',       label = _U('saucisson'),        price = 25 },
            { name = 'grapperaisin',    label = _U('grapperaisin'),     price = 15 }
        },
    },

    CasinoChips = {
        Pos   = { x = 1115.69, y = 219.94, z = -50.43 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 255, g = 255, b = 255 },
        Type  = 23,
        Items = {
            { name = 'cchip',  label = _U('cchip'),   price = 2 }
        },
    },

}

-----------------------
----- TELEPORTERS -----

Config.TeleportZones = { --Penthouse
  EnterPenthouse = {
    Pos       = { x = 1085.47, y = 214.64, z = -50.20 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_enter_1'),
    Teleport  = { x = 978.32, y = 58.01, z = 116.0 }
  },

  ExitPenthouse = {
    Pos       = { x = 980.52, y = 56.63, z = 115.15 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_exit_1'),
    Teleport  = { x = 1086.84, y = 216.81, z = -49.85 },
  },

  EnterRoof = {
    Pos       = { x = 969.56, y = 63.28, z = 111.56 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_enter_2'),
    Teleport  = { x = 965.88, y = 64.64, z = 111.60 }
  },

  ExitRoof = {
    Pos       = { x = 967.69, y = 63.61, z = 111.55 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_exit_2'),
    Teleport  = { x = 971.33, y = 62.67, z = 112.40 },
  },
}