Config = {}

Config.Core = "ESX" -- "ESX" / "QB-Core"

Config.CoreExport = function()
    return exports['es_extended']:getSharedObject() -- ESX
    -- return exports['qb-core']:GetCoreObject() -- QB-CORE
end

-- @Config.SkinManager for ESX: "esx_skin" / "fivem-appearance" / "illenium-appearance"
-- @Config.SkinManager for QB-Core: "qb-clothing" / "fivem-appearance" / "illenium-appearance"
Config.SkinManager = "esx_skin"

Config.TestCommand = true -- /character -- command to test the character creator **(We do not recommend using this on the main server)**
if Config.TestCommand then
    RegisterCommand('character', function()
        TriggerEvent('iCreator:openCreator')
    end, false)
end

Config.AdminCommand = {
    Enabled = true,
    Group = {"admin", "owner", "dev"}, -- sets roles that can use this command !
    Name = "skin",
    Help = "Give the character creator to the player",
    ArgHelp = "Player ID",
}

Config.Hud = {
    Enable = function()

    end,
    Disable = function()

    end
}

Config.defaultCamDistance = 0.95 -- camera distance from player location (during character creation)
Config.CameraHeight = {
    ['Identity'] = {z_height = 0.65, fov = 30.0},
    ['Face'] = {z_height = 0.65, fov = 30.0},
    ['Appareance'] = {z_height = 0.65, fov = 30.0},
    ['Clothes'] = {z_height = -0.1, fov = 100.0},
    ['Heritage'] = {z_height = 0.65, fov = 30.0},
    ['Disease'] = {z_height = 0.65, fov = 30.0},
    ['torso_1'] = {z_height = 0.15, fov = 75.0},
    ['tshirt_1'] = {z_height = 0.15, fov = 75.0},
    ['pants_1'] = {z_height = -0.825, fov = 75.0},
    ['shoes_1'] = {z_height = -0.6, fov = 75.0},
    ['arms'] = {z_height = 0.15, fov = 75.0}
}

Config.TeleportPlayerByCommand = false -- when the player is given the character creation menu by the admin whether to be teleported to Config.creatingCharacterCoords
Config.EnableCancelButtonUI = true -- this is only displayed when the player is in the character creator via the admin command

Config.EnableHandsUpButtonUI = true -- Is there to be a button to raise hands on the UI
Config.HandsUpKey = 'x' -- Key JS (key.code) - https://www.toptal.com/developers/keycode
Config.HandsUpAnimation = {'missminuteman_1ig_2', 'handsup_enter', 50}

Config.creatingCharacterCoords = vector4(916.7, 46.18, 110.66, 57.78) -- this is where the player player will stand during character creation
Config.afterCreateCharSpawn = vector4(-255.93, -983.88, 30.22, 250.85) -- this is where the player will spawn after completing character creation

Config.CharacterCreationPedAnimation = {"anim@heists@heist_corona@team_idles@male_a", "idle"} -- animation of the player during character creation

Config.soundsEffects = true -- if you want to sound effects by clicks set true
Config.blurBehindPlayer = true -- to see it you need to have PostFX upper Very High or Ultra

Config.CameraNearDof = 0.2 -- Creates a variable called CameraNearDof and sets it to the near dof of the camera
Config.CameraFarDof = 5.0 -- Creates a variable called CameraFarDof and sets it to the far dof of the camera
Config.CameraDofStrength = 1.0 -- Creates a variable called CameraDofStrength and sets it to the dof strength of the camera

Config.EnableFirstCreationClothes = true -- You can set a default for the character the first outfit the player will be reborn with in the character creator - the default was laid out for both genders in just underwear so the player can see all the details of the character
Config.FirstCreationClothes = {
    ['m'] = {
        tshirt_1 = 15, tshirt_2 = 0, 
        torso_1 = 15, torso_2 = 0,
        arms = 15, arms_2 = 0,
        pants_1 = 14, pants_2 = 1,
        shoes_1 = 34, shoes_2 = 0,
        helmet_1 = -1, helmet_2 = 0, 
        chain_1 = 0, chain_2 = 0, 
    },
    ['f'] = {
        tshirt_1 = 15, tshirt_2 = 0, 
        torso_1 = 15, torso_2 = 0,
        arms = 15, arms_2 = 0,
        pants_1 = 15, pants_2 = 0,
        shoes_1 = 35, shoes_2 = 0,
        helmet_1 = -1, helmet_2 = 0, 
        chain_1 = 0, chain_2 = 0, 
        glasses_1 = 5, glasses_2 = 0,
    }
}

-- @BlockedClothes:
--  For the clothing blockage to work correctly in the table, there must be at least two values. Only one value, for example {10}, cannot exist.
--  To block only one value, you need to set the second value as a number that does not exist, for example {10, 100000}.
Config.BlockedClothes = {
    ['male'] = {
        -- ['hair_1'] = {},
        -- ['beard_1'] = {},
        -- ['eyebrows_1'] = {},
        -- ['chest_1'] = {},
        -- ['makeup_1'] = {},
        -- ['blush_1'] = {},
        -- ['lipstick_1'] = {},
        -- ['helmet_1'] = {46, 100000},
        -- ['mask_1'] = {},
        -- ['tshirt_1'] = {10, 15, 16, 17, 18, 19, 20},
        -- ['torso_1'] = {},
        -- ['arms'] = {},
        -- ['decals_1'] = {},
        -- ['bproof_1'] = {},
        -- ['pants_1'] = {},
        -- ['shoes_1'] = {},
        -- ['chain_1'] = {},
        -- ['glasses_1'] = {},
        -- ['watches_1'] = {},
        -- ['bracelets_1'] = {},
        -- ['ears_1'] = {},
        -- ['bags_1'] = {},
    },
    ['female'] = {
        -- ['hair_1'] = {},
        -- ['beard_1'] = {},
        -- ['eyebrows_1'] = {},
        -- ['chest_1'] = {},
        -- ['makeup_1'] = {},
        -- ['blush_1'] = {},
        -- ['lipstick_1'] = {},
        -- ['helmet_1'] = {46, 100000},
        -- ['mask_1'] = {},
        -- ['tshirt_1'] = {10, 15, 16, 17, 18, 19, 20},
        -- ['torso_1'] = {},
        -- ['arms'] = {},
        -- ['decals_1'] = {},
        -- ['bproof_1'] = {},
        -- ['pants_1'] = {},
        -- ['shoes_1'] = {},
        -- ['chain_1'] = {},
        -- ['glasses_1'] = {},
        -- ['watches_1'] = {},
        -- ['bracelets_1'] = {},
        -- ['ears_1'] = {},
        -- ['bags_1'] = {},
    },
}

Config.EnablesCategories = { -- these are the available categories that the player should have when creating a character, if you don't want any, set it to false
    ['Identity'] = true,
    ['Heritage'] = true,
    ['Appareance'] = true,
    ['Clothes'] = true,
    ['Face'] = true,
    ['Disease'] = true,
}

