1. Download resource

Download the purchased resource from keymaster (https://keymaster.fivem.net/asset-grants) - the official site of fivem with purchased resources.

2. Adjusting the script to the default core resources

ESX : 

esx_multicharacter

If you using esx_multicharacter you need change only this, do not change esx_identity

1- Open @esx_multicharacter/client/main.lua

2- Search for esx:playerLoaded

3- Replace the trigger with this one below

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData, isNew, skin)
	local spawn = playerData.coords or Config.Spawn
	if isNew or not skin or #skin == 1 then
		skin = Config.Default[playerData.sex]
		skin.sex = playerData.sex == "m" and 0 or 1
		local model = skin.sex == 0 and mp_m_freemode_01 or mp_f_freemode_01
		RequestModel(model)
		while not HasModelLoaded(model) do
			RequestModel(model)
			Wait(0)
		end
		SetPlayerModel(PlayerId(), model)
		ResetEntityAlpha(PlayerPedId())
		SetModelAsNoLongerNeeded(model)
		TriggerEvent('skinchanger:loadSkin', skin, function()
        		ResetEntityAlpha(PlayerPedId())
        		SetPedAoBlobRendering(PlayerPedId(), true)
                	TriggerEvent('iCreator:openCreator')
    		end)
    	end
	if not isNew then
		DoScreenFadeOut(100)
	end
	SetCamActive(cam, false)
	RenderScriptCams(false, false, 0, true, true)
	cam = nil
	SetEntityCoordsNoOffset(PlayerPedId(), spawn.x, spawn.y, spawn.z, false, false, false, true)
	SetEntityHeading(PlayerPedId(), spawn.heading)
	if not isNew then 
		TriggerEvent('skinchanger:loadSkin', skin or Characters[spawned].skin) 
		Wait(400)
		DoScreenFadeIn(400)
		repeat Wait(200) until not IsScreenFadedOut()
	end
	TriggerServerEvent('esx:onPlayerSpawn')
	TriggerEvent('esx:onPlayerSpawn')
	TriggerEvent('playerSpawned')
	TriggerEvent('esx:restoreLoadout')
	Characters, hidePlayers = {}, false
end)

esx_identity

If you not using multicharacter system you need change only this

1- Open @esx_identity/client/main.lua

2- Search for RegisterNUICallback('register')

3- Replace the nui callback with this one below

RegisterNUICallback('register', function(data, cb)
    if not guiEnabled then
        return
    end
    ESX.TriggerServerCallback('esx_identity:registerIdentity', function(callback)
        if not callback then
            return
        end
        ESX.ShowNotification(TranslateCap('thank_you_for_registering'))
        setGuiState(false)
        if not ESX.GetConfig().Multichar then
            TriggerEvent('iCreator:openCreator', data.sex)
        end
    end, data)
end)

---------

QBCORE: 

qb-multicharacter

If you using qb-multicharacter you need change this

1- Open @qb-multicharacter/client/main.lua

2- Search for qb-multicharacter:client:closeNUIdefault

3- Replace the trigger with this one below

RegisterNetEvent('qb-multicharacter:client:closeNUIdefault', function() -- This event is only for no starting apartments
    DeleteEntity(charPed)
    SetNuiFocus(false, false)
    DoScreenFadeOut(500)
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    Wait(500)
    openCharMenu()
    SetEntityVisible(PlayerPedId(), true)
    Wait(500)
    DoScreenFadeIn(250)
    TriggerEvent('qb-weathersync:client:EnableSync')
    TriggerEvent('iCreator:openCreator')
end)

qb-apartaments
 
1- If you have qb-apartaments, open config of this script and set this:

Apartments.Starting = false

----

Usable Informations
Exports/Events for use in other resources
Open Character Creator Menu

client:

-- @param: sex - 0 = male / 1 = female
-- @param: isAlreadyHaveSkin - true = loads current skin / false = loads the default skin
-- @param: isSurgery - true / false
TriggerEvent('iCreator:openCreator', sex, isAlreadyHaveSkin, isSurgery)

server:

-- @param: sex - 0 = male / 1 = female
-- @param: isAlreadyHaveSkin - true = loads current skin / false = loads the default skin
-- @param: isSurgery - true / false
TriggerClientEvent('iCreator:openCreator', source, sex, isAlreadyHaveSkin, isSurgery)

----

IMAGES:

go creator repo in web/images/repo_name wich repo_name is the name of cat like:

- pants_1
- beard_1
- tshirt_1
- torso_1
- and more...

the cats are in the shared/config.lua
once the repo is create u need to create ur image and name them like 0.png for the image with id 1, 1.png, 2.png for id 1, 2 ...

for more help / support go in my discord (https://discord.gg/PzbuxknvqH)