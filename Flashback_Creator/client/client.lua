-- show = false;

-- RegisterCommand("set-visible", function()
--     show = not show;

--     SetNuiFocus(show, show);
--     SendNUIMessage({
--         action = 'setVisible',
--         data = {
--             visible = show,
--         },
--     });
-- end, false)

local cam, cameraOffset = nil
local hidePlayers = false
local lastSkin = nil
local lastCoords = nil
local gender = nil
tempSkinTable = {}
playerHasAlreadySkin = false

local tempVAR = nil

if Config.Core == "QB-Core" then
    QBCore = Config.CoreExport()
else
    ESX = Config.CoreExport()
end

local function openCharacterCreator(sex, isAlreadyHaveSkin)
    if Config.Core == "ESX" and Config.SkinManager == "esx_skin" then
        refreshValues()
    end

    local data = {}
    local hasSkin = false
    local components, maxVals = getMaxValues()
    for i = 1, #components, 1 do
        data[components[i].name] = {
            value = components[i].value,
            min = components[i].min,
        }
        for k, v in pairs(maxVals) do
            if k == components[i].name then
                data[k].max = v
                break
            end
        end
    end

    if isAlreadyHaveSkin then
        playerHasAlreadySkin = true
        if Config.SkinManager == "esx_skin" then
            tempSkinTable = Character_ESX
            TriggerEvent('skinchanger:getData', function(comp, max)
                for k, v in pairs(comp) do
                    data[v.name].value = tonumber(v.value)
                    tempSkinTable[v.name] = tonumber(v.value)
                end
                hasSkin = true
            end)
            TriggerEvent('skinchanger:getSkin', function(skin)
                gender = skin.sex == 0 and 'male' or 'female'
                lastSkin = skin
            end)
        elseif Config.SkinManager == "fivem-appearance" or Config.SkinManager == "illenium-appearance" then
            tempSkinTable = exports[Config.SkinManager]:getPedAppearance(PlayerPedId())
            lastSkin = exports[Config.SkinManager]:getPedAppearance(PlayerPedId())
            gender = tempSkinTable.sex == 0 and 'male' or 'female'
            hasSkin = true
        elseif Config.SkinManager == "qb-clothing" then
            QBCore.Functions.TriggerCallback('iCreator:getCurrentSkin', function(skin)
                tempSkinTable = json.decode(skin)
                gender = QBCore.Functions.GetPlayerData().charinfo.gender == 0 and 'male' or 'female'
                hasSkin = true
            end)
        end
    else
        if Config.SkinManager == "esx_skin" then
            tempSkinTable = Character_ESX
            gender = tempSkinTable.sex == 0 and 'male' or 'female'
        elseif Config.SkinManager == "fivem-appearance" or Config.SkinManager == "illenium-appearance" then
            tempSkinTable = Character_AP
            gender = tempSkinTable.sex == 0 and 'male' or 'female'
        elseif Config.SkinManager == "qb-clothing" then
            tempSkinTable = Character_QB
            gender = QBCore.Functions.GetPlayerData().charinfo.gender == 0 and 'male' or 'female'
        end
        hasSkin = true
    end
    if tonumber(sex) then
        if Config.Core == "ESX" then
            if Config.SkinManager == "esx_skin" then
                TriggerEvent('skinchanger:loadSkin', { sex = sex })
                Character_ESX['sex'] = sex
            elseif Config.SkinManager == "fivem-appearance" or Config.SkinManager == "illenium-appearance" then
                appearance_switcher('sex', sex)
            end
        elseif Config.Core == "QB-Core" then
            local model = sex == 0 and GetHashKey('mp_m_freemode_01') or GetHashKey('mp_f_freemode_01')
            RequestModel(model)
            while not HasModelLoaded(model) do
                RequestModel(model)
                Citizen.Wait(0)
            end
            SetPlayerModel(PlayerId(), model)
            SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 2)
            if Config.SkinManager == "fivem-appearance" or Config.SkinManager == "illenium-appearance" then
                appearance_switcher('sex', sex)
            end
        end
        data['sex'].value = sex
    end
    if not isAlreadyHaveSkin then
        local mySex = IsPedModel(PlayerPedId(), GetHashKey('mp_m_freemode_01')) and 'm' or 'f'
        if Config.SkinManager == "esx_skin" then
            if Config.EnableFirstCreationClothes then
                for k, v in pairs(Config.FirstCreationClothes[mySex]) do
                    tempSkinTable[k] = v
                end
                updateValue(tempSkinTable)
            end
        elseif Config.SkinManager == "fivem-appearance" or Config.SkinManager == "illenium-appearance" then
            if Config.EnableFirstCreationClothes then
                for k, v in pairs(Config.FirstCreationClothes[mySex]) do
                    appearance_switcher(k, v)
                end
            end
        elseif Config.SkinManager == "qb-clothing" then
            if Config.EnableFirstCreationClothes then
                for k, v in pairs(Config.FirstCreationClothes[mySex]) do
                    qbcore_switcher(k, v)
                end
            end
        end
    end
    while not hasSkin do
        Citizen.Wait(125)
    end
    tempVAR = data
    CreateSkinCam(data)
end

function CreateSkinCam(data)
    if not DoesCamExist(cam) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
    end
    local myPed = PlayerPedId()
    local myCoords = GetEntityCoords(myPed)
    local myHeading = GetEntityHeading(myPed)
    cameraOffset = GetOffsetFromEntityInWorldCoords(myPed, 0.0, 0.0 + Config.defaultCamDistance, 0.0)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)

    SetCamCoord(cam, cameraOffset.x, cameraOffset.y, cameraOffset.z + 0.65)
    PointCamAtCoord(cam, myCoords.x, myCoords.y, myCoords.z + 0.65)
    SetCamFov(cam, 30.0)

    SetTimecycleModifier('MP_corona_heist_DOF')
    SetTimecycleModifierStrength(1.0)

    RequestAnimDict(Config.CharacterCreationPedAnimation[1])
    while not HasAnimDictLoaded(Config.CharacterCreationPedAnimation[1]) do
        Wait(1)
    end
    TaskPlayAnim(myPed, Config.CharacterCreationPedAnimation[1], Config.CharacterCreationPedAnimation[2], 8.0, 0.0, -1, 1,
        0, 0, 0, 0)
    Config.Hud:Disable()

    SendNUIMessage({
        action = 'setDatas',
        data = {
            skinmanager = Config.SkinManager,
            data = data,
            disabledValues = Config.BlockedClothes[gender],
            handsUpKey = Config.HandsUpKey,
            enableHandsUpButton = Config.EnableHandsUpButtonUI,
            playerHasAlreadySkin = playerHasAlreadySkin,
        },
    })
    Wait(200)
    SendNUIMessage({
        action = "setVisible",
        data = {
            visible = true
        }
    })
    SetNuiFocus(true, true)
    if Config.blurBehindPlayer then cameraDoF(cam) end
end

function cameraDoF(cam)
    SetCamUseShallowDofMode(cam, true)
    SetCamNearDof(cam, Config.CameraNearDof)
    SetCamFarDof(cam, Config.CameraFarDof)
    SetCamDofStrength(cam, Config.CameraDofStrength)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 1, true, true)

    while DoesCamExist(cam) do
        SetUseHiDof()
        DisplayRadar(false)
        DisplayHud(false)
        Citizen.Wait(0)
    end
end

RegisterNetEvent('iCreator:openCreator')
AddEventHandler('iCreator:openCreator', function(sex, isAlreadyHaveSkin)
    lastCoords = {
        x = GetEntityCoords(PlayerPedId()).x,
        y = GetEntityCoords(PlayerPedId()).y,
        z = GetEntityCoords(PlayerPedId()).z,
        w = GetEntityHeading(PlayerPedId())
    }
    if not isAlreadyHaveSkin or isAlreadyHaveSkin and Config.TeleportPlayerByCommand then
        DoScreenFadeOut(500)
        Wait(1000)
        SetEntityCoords(PlayerPedId(), Config.creatingCharacterCoords.x, Config.creatingCharacterCoords.y,
            Config.creatingCharacterCoords.z)
        SetEntityHeading(PlayerPedId(), Config.creatingCharacterCoords.w)
    end
    FreezeEntityPosition(PlayerPedId(), true)
    if not sex and not isAlreadyHaveSkin then
        local myModel = GetEntityModel(PlayerPedId()) == GetHashKey('mp_m_freemode_01') or
        IsModelAPed(GetEntityModel(PlayerPedId())) == GetHashKey('mp_f_freemode_01')
        if not myModel then
            local model = GetHashKey('mp_m_freemode_01')
            RequestModel(model)
            while not HasModelLoaded(model) do
                RequestModel(model)
                Citizen.Wait(0)
            end
            SetPlayerModel(PlayerId(), model)
            SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 2)
        end
    end
    if not isAlreadyHaveSkin or isAlreadyHaveSkin and Config.TeleportPlayerByCommand then
        StartLoop()
        DoScreenFadeIn(250)
    end
    openCharacterCreator(sex, isAlreadyHaveSkin)
end)

StartLoop = function()
    hidePlayers = true
    MumbleSetVolumeOverride(PlayerId(), 0.0)
    CreateThread(function()
        while hidePlayers do
            SetEntityVisible(PlayerPedId(), 0, 0)
            SetLocalPlayerVisibleLocally(1)
            SetPlayerInvincible(PlayerId(), 1)
            ThefeedHideThisFrame()
            HideHudComponentThisFrame(11)
            HideHudComponentThisFrame(12)
            HideHudComponentThisFrame(21)
            HideHudAndRadarThisFrame()
            Wait(0)
            local vehicles = GetGamePool('CVehicle')
            for i = 1, #vehicles do
                SetEntityLocallyInvisible(vehicles[i])
            end
        end
        local playerId, playerPed = PlayerId(), PlayerPedId()
        MumbleSetVolumeOverride(playerId, -1.0)
        SetEntityVisible(playerPed, 1, 0)
        SetPlayerInvincible(playerId, 0)
    end)
    CreateThread(function()
        local playerPool = {}
        while hidePlayers do
            local players = GetActivePlayers()
            for i = 1, #players do
                local player = players[i]
                if player ~= PlayerId() and not playerPool[player] then
                    playerPool[player] = true
                    NetworkConcealPlayer(player, true, true)
                end
            end
            Wait(500)
        end
        for k in pairs(playerPool) do
            NetworkConcealPlayer(k, false, false)
        end
        FreezeEntityPosition(PlayerPedId(), false)
    end)
end

RegisterNUICallback("change_camera", function(data)
    if cam and data.type then
        print(data.type)
        local myPed = PlayerPedId()
        local myCoords = GetEntityCoords(myPed)
        local newCamPos = Config.CameraHeight[data.type]
        SetCamCoord(cam, cameraOffset.x, cameraOffset.y, cameraOffset.z + newCamPos.z_height)
        PointCamAtCoord(cam, myCoords.x, myCoords.y, myCoords.z + newCamPos.z_height)
        SetCamFov(cam, newCamPos.fov)
    end
end)

RegisterNUICallback("change", function(data, cb)
    if Config.Core == "ESX" then
        if Config.SkinManager == "esx_skin" then
            if data.type == 'sex' then
                if tempSkinTable.sex ~= tonumber(data.new) then
                    TriggerEvent('skinchanger:loadSkin', {sex = tonumber(data.new)})
                end
            end
            tempSkinTable[data.type] = tonumber(data.new)
            updateValue(tempSkinTable)
        elseif Config.SkinManager == "fivem-appearance" or Config.SkinManager == "illenium-appearance" then
            appearance_switcher(data.type, data.new)
        end
    elseif (Config.Core == "QB-Core") then
        if data.type == 'sex' then
            local model = data.new == 0 and GetHashKey('mp_m_freemode_01') or GetHashKey('mp_f_freemode_01')
            RequestModel(model)
            while not HasModelLoaded(model) do
                RequestModel(model)
                Citizen.Wait(0)
            end
            SetPlayerModel(PlayerId(), model)
            SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 2)
            if Config.SkinManager == "fivem-appearance" or Config.SkinManager == "illenium-appearance" then
                appearance_switcher(data.type, data.new)
            end
        else
            if Config.SkinManager == "qb-clothing" then
                qbcore_switcher(data.type, data.new)
            elseif Config.SkinManager == "fivem-appearance" or Config.SkinManager == "illenium-appearance" then
                appearance_switcher(data.type, data.new)
            end
        end
    end
    local secondItem, secondValue = GetMaxVal(data.type)
    if secondItem and secondValue then
        if Config.Core == "ESX" then
            if Config.SkinManager == "esx_skin" then
                tempSkinTable[secondItem] = 0
                updateValue(tempSkinTable)
            elseif Config.SkinManager == "fivem-appearance" or Config.SkinManager == "illenium-appearance" then
                appearance_switcher(secondItem, 0)
            end
        elseif Config.Core == "QB-Core" then
            if Config.SkinManager == "qb-clothing" then
                qbcore_switcher(secondItem, 0)
            elseif Config.SkinManager == "fivem-appearance" or Config.SkinManager == "illenium-appearance" then
                appearance_switcher(secondItem, 0)
            end
        end
    end

    if Config.soundsEffects then
        PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    end
end)

RegisterNUICallback("notif", function(data, cb)
    if Config.Core == "ESX" then
        ESX.ShowNotification(data)
    end
end)

RegisterNUICallback("save", function(data, cb)
    SetNuiFocus(false, false)
    ClearPedTasks(PlayerPedId())
    DeleteSkinCam()

    Wait(1000)

    TriggerEvent("iCreator:finished", data.diseaseData, data.identityData)
end)

RegisterNUICallback("reset", function(data, cb)
    SetNuiFocus(false, false)
    ClearPedTasks(PlayerPedId())
    DeleteSkinCam(true)

    Wait(1000)
    TriggerEvent("iCreator:openCreator", nil, true)
end)

function DeleteSkinCam(isCanceled)
    if not playerHasAlreadySkin or playerHasAlreadySkin and Config.TeleportPlayerByCommand then
        DoScreenFadeOut(500)
    end
    if not isCanceled then
        if Config.Core == "ESX" then
            if Config.SkinManager == "esx_skin" then
                TriggerEvent('skinchanger:loadSkin', tempSkinTable)
                TriggerServerEvent('esx_skin:save', tempSkinTable)
            elseif Config.SkinManager == "fivem-appearance" then
                TriggerServerEvent('fivem-appearance:save', tempSkinTable)
            elseif Config.SkinManager == "illenium-appearance" then
                TriggerServerEvent('illenium-appearance:server:saveAppearance', tempSkinTable)
            end
        elseif (Config.Core == "QB-Core") then
            if Config.SkinManager == 'qb-clothing' then
                local model = GetEntityModel(PlayerPedId()) == GetHashKey('mp_m_freemode_01') and
                GetHashKey('mp_m_freemode_01') or GetHashKey('mp_f_freemode_01')
                local character_encode = json.encode(tempSkinTable)
                TriggerServerEvent("qb-clothing:saveSkin", model, character_encode)
            elseif Config.SkinManager == "fivem-appearance" or Config.SkinManager == "illenium-appearance" then
                TriggerServerEvent(Config.SkinManager .. ':server:saveAppearance', tempSkinTable)
            end
        end
    else
        if Config.Core == "ESX" then
            if Config.SkinManager == "esx_skin" then
                TriggerEvent('skinchanger:loadSkin', lastSkin)
                TriggerServerEvent('esx_skin:save', lastSkin)
            elseif Config.SkinManager == "fivem-appearance" then
                TriggerEvent('skinchanger:loadSkin', lastSkin)
                TriggerServerEvent('esx_skin:save', lastSkin)
            elseif Config.SkinManager == "illenium-appearance" then
                TriggerEvent('skinchanger:loadSkin', lastSkin)
                TriggerServerEvent('illenium-appearance:server:saveAppearance', lastSkin)
            end
        elseif Config.Core == "QB-Core" then
            if Config.SkinManager == "fivem-appearance" or Config.SkinManager == "illenium-appearance" then
                TriggerEvent(Config.SkinManager .. ':client:reloadSkin')
            elseif Config.SkinManager == "qb-clothing" then
                TriggerServerEvent("qb-clothes:loadPlayerSkin")
                TriggerServerEvent("qb-clothing:loadPlayerSkin")
            end
        end
    end
    if not playerHasAlreadySkin or playerHasAlreadySkin and Config.TeleportPlayerByCommand then
        Wait(250)
    end
    if Config.soundsEffects then
        PlaySoundFrontend(-1, 'CHECKPOINT_UNDER_THE_BRIDGE', 'HUD_MINI_GAME_SOUNDSET', 0)
    end
    FreezeEntityPosition(PlayerPedId(), false)
    ClearPedTasks(PlayerPedId())
    ClearPedTasksImmediately(PlayerPedId())
    if not playerHasAlreadySkin or playerHasAlreadySkin and Config.TeleportPlayerByCommand then
        Wait(250)
    end
    SetCamActive(cam, false)
    cam = nil
    RenderScriptCams(false, true, 500, true, true)
    ClearTimecycleModifier()
    if playerHasAlreadySkin then
        if Config.TeleportPlayerByCommand then
            SetEntityCoords(PlayerPedId(), lastCoords.x, lastCoords.y, lastCoords.z)
            SetEntityHeading(PlayerPedId(), lastCoords.w)
        end
    else
        SetEntityCoords(PlayerPedId(), Config.afterCreateCharSpawn.x, Config.afterCreateCharSpawn.y, Config.afterCreateCharSpawn.z)
        SetEntityHeading(PlayerPedId(), Config.afterCreateCharSpawn.w)
    end
    if not playerHasAlreadySkin or playerHasAlreadySkin and Config.TeleportPlayerByCommand then
        Wait(100)
        DoScreenFadeIn(250)
    end
    hidePlayers = false
    tempSkinTable = {}
    lastSkin = nil
    lastCoords = nil
    playerHasAlreadySkin = false
    Config.Hud:Enable()
    DisplayHud(true)
    DisplayRadar(true)

    SendNUIMessage({
        action = "setVisible",
        data = {
            visible = false
        }
    })
end
