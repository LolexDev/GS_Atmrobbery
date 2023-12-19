Config = {}

Config.Locale = 'en' -- Jezik // Language
Config.Dobitak = math.random(1000,3500) -- Koliko ce ljudi dobiti para kada opljackaju // How much players will get after they rob the atm
Config.HackingDevice = 'phone' -- Ime stvari koju ce koristiti za hakiranje atm // Item name of hacking device that will they use
Config.UseDealer = true -- Da li zelite da kupujete tablet kod dilera // Do you want to buy tablet at dealer
Config.KoristiBlipove = true -- Da li zelite da se na mapi pojavi blip dilera ostavite na true,a ako ne onda stavite na false // If u want to have blip on map of dealer don't change it from true but if u don't want to have blip set it to false
Config.CenaTableta = 450 -- Cena tableta // Price of tablet
Config.HackTime = 15 -- U sekundama // In seconds
Config.Policija = 'police' -- Posao policije // Job of police
Config.Cooldown = 30 -- U sekundama // In seconds

-- # Webhook Config
Config.LogHeader = "GS ATMROBBERY » Logs"
Config.Webhook = "https://discord.com/api/webhooks/1181965370609913897/dValWtx6_IqY1SzCMR_9hiNMQBIOfxxBElVqIJ-J2FvVrDVO7-iRxUHHQUAP5TBBufEG" -- Discord webhook
-------------------------------------------------------

Config.Diler = { -- Dealer
    {
        coords = vector4(1330.8220, -608.2700, 74.5080, 142.1377),
        model = "a_m_m_og_boss_01",
    }
}

Config.Blipovi = {
    {
        Ime = "Diler", -- Ime blipa // Name of blip
        Velicina = 1, -- Velicina blipa // Size of blip
        Boja = 6, -- Boja blipa // Color of blip
        Ikonica = 480, -- Blip sprite // Blip sprite
        Kordinate = vector3(1330.8220, -608.2700, 74.5080), -- Kordinate blipa // Coords of blip
        Pokazuj = 6, -- Display
    }
}

Config.Propovi = {
    'prop_atm_02',
    'prop_fleeca_atm',
    'prop_atm_03',
    'prop_atm_01',
}