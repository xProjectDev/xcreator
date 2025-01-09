if (Config.SkinManager ~= 'fivem-appearance' and Config.SkinManager ~= 'illenium-appearance') then
    return
end

Character_AP = {
    ["model"] = "mp_m_freemode_01",
    ["eyeColor"] = 1,
    ["components"] = {
        {
            component_id = 0,
            texture = 0,
            drawable = 0
        },
        {
            component_id = 1,
            texture = 0,
            drawable = 0
        },
        {
            component_id = 2,
            texture = 0,
            drawable = 0
        },
        {
            component_id = 3,
            texture = 0,
            drawable = 0
        },
        {
            component_id = 4,
            texture = 0,
            drawable = 0
        },
        {
            component_id = 5,
            texture = 0,
            drawable = 0
        },
        {
            component_id = 6,
            texture = 0,
            drawable = 0
        },
        {
            component_id = 7,
            texture = 0,
            drawable = 0
        },
        {
            component_id = 8,
            texture = 0,
            drawable = 0
        },
        {
            component_id = 9,
            texture = 0,
            drawable = 0
        },
        {
            component_id = 10,
            texture = 0,
            drawable = 0
        },
        {
            component_id = 11,
            texture = 0,
            drawable = 0
        },
    },
    ["headBlend"] = {
        skinFirst = 0,
        skinSecond = 0,
        skinMix = 1,
        shapeMix = 1,
        shapeFirst = 0,
        shapeSecond = 0,
    },
    ["hair"] = {
        style = 0,
        color = 0,
        highlight = 0
    },
    ["props"] = {
        {
            prop_id = 0,
            texture = -1,
            drawable = -1
        },
        {
            prop_id = 1,
            texture = -1,
            drawable = -1
        },
        {
            prop_id = 2,
            texture = -1,
            drawable = -1
        },
        {
            prop_id = 6,
            texture = -1,
            drawable = -1
        },
        {
            prop_id = 7,
            texture = -1,
            drawable = -1
        },
    },
    ["headOverlays"] = {
        blush = {color = 0, style = 0, opacity = 0},
        bodyBlemishes = {color = 0, style = 0, opacity = 0},
        beard = {color = 0, style = 0, opacity = 0},
        blemishes = {color = 0, style = 0, opacity = 0},
        complexion = {color = 0,style = 0, opacity = 0},
        lipstick = {color = 0, style = 0, opacity = 0},
        makeUp = {color = 0, style = 0, opacity = 0},
        chestHair = {color = 0, style = 0, opacity = 0},
        eyebrows = {color = 0, style = 0, opacity = 0},
        sunDamage = {color = 0, style = 0, opacity = 0},
        ageing = {color = 0, style = 0, opacity = 0},
        moleAndFreckles = {color = 0,style = 0, opacity = 0},
    },
    ["faceFeatures"] = {
        noseWidth = 0,
        nosePeakHigh = 0,
        nosePeakLowering = 0,
        nosePeakSize = 0,
        noseBoneHigh = 0,
        noseBoneTwist = 0,
        cheeksBoneHigh = 0,
        cheeksBoneWidth = 0,
        cheeksWidth = 0,
        lipsThickness = 0,
        jawBoneWidth = 0,
        jawBoneBackSize = 0,
        chinBoneLenght = 0,
        chinBoneLowering = 0,
        chinBoneSize = 0,
        chinHole = 0,
        neckThickness = 0,
        eyeBrownForward = 0,
        eyesOpening = 0,
        eyeBrownHigh = 0,
    },
}

if Config.SkinManager == "illenium-appearance" then
    Character_AP["headBlend"].shapeThird = 0
    Character_AP["headBlend"].skinThird = 0
    Character_AP["headBlend"].thirdMix = 0
end

function appearance_switcher(type, number)
    if type == "sex" then
        tempSkinTable['model'] = tonumber(number) == 0 and 'mp_m_freemode_01' or 'mp_f_freemode_01'
        TriggerEvent("skinchanger:loadSkin", {model = tempSkinTable['model']})
    elseif type == "mom" then
        tempSkinTable['headBlend'].skinFirst = tonumber(number)
        tempSkinTable['headBlend'].shapeFirst = tonumber(number)
    elseif type == "dad" then
        tempSkinTable['headBlend'].skinSecond = tonumber(number)
        tempSkinTable['headBlend'].shapeSecond = tonumber(number)
    elseif type == "face_md_weight" then
        local face_weight =	(tonumber(number) / 100) + 0.0
        tempSkinTable['headBlend'].shapeMix = face_weight
    elseif type == "skin_md_weight" then
        local skin_weight =	(tonumber(number) / 100) + 0.0
        tempSkinTable['headBlend'].skinMix = skin_weight
    elseif type == "eye_color" then
        tempSkinTable['eyeColor'] = tonumber(number)
    elseif type == "neck_thickness" then tempSkinTable['faceFeatures'].neckThickness = ((tonumber(number) / 10) + 0.0)
    elseif type == "eyebrows_5" then tempSkinTable['faceFeatures'].eyeBrownHigh = ((tonumber(number) / 10) + 0.0)
    elseif type == "eyebrows_6" then tempSkinTable['faceFeatures'].eyeBrownForward = ((tonumber(number) / 10) + 0.0)
    elseif type == "nose_1" then tempSkinTable['faceFeatures'].noseWidth = ((tonumber(number) / 10) + 0.0)
    elseif type == "nose_2" then tempSkinTable['faceFeatures'].nosePeakHigh = ((tonumber(number) / 10) + 0.0)
    elseif type == "nose_3" then tempSkinTable['faceFeatures'].nosePeakLowering = ((tonumber(number) / 10) + 0.0)
    elseif type == "nose_4" then tempSkinTable['faceFeatures'].nosePeakSize = ((tonumber(number) / 10) + 0.0)
    elseif type == "nose_5" then tempSkinTable['faceFeatures'].noseBoneHigh = ((tonumber(number) / 10) + 0.0)
    elseif type == "nose_6" then tempSkinTable['faceFeatures'].noseBoneTwist = ((tonumber(number) / 10) + 0.0)
    elseif type == "cheeks_1" then tempSkinTable['faceFeatures'].cheeksBoneHigh = ((tonumber(number) / 10) + 0.0)
    elseif type == "cheeks_2" then tempSkinTable['faceFeatures'].cheeksBoneWidth = ((tonumber(number) / 10) + 0.0)
    elseif type == "cheeks_3" then tempSkinTable['faceFeatures'].cheeksWidth = ((tonumber(number) / 10) + 0.0)
    elseif type == "lip_thickness" then tempSkinTable['faceFeatures'].lipsThickness = ((tonumber(number) / 10) + 0.0)
    elseif type == "jaw_1" then tempSkinTable['faceFeatures'].jawBoneWidth = ((tonumber(number) / 10) + 0.0)
    elseif type == "jaw_2" then tempSkinTable['faceFeatures'].jawBoneBackSize = ((tonumber(number) / 10) + 0.0)
    elseif type == "chin_1" then tempSkinTable['faceFeatures'].chinBoneLenght = ((tonumber(number) / 10) + 0.0)
    elseif type == "chin_2" then tempSkinTable['faceFeatures'].chinBoneLowering = ((tonumber(number) / 10) + 0.0)
    elseif type == "chin_3" then tempSkinTable['faceFeatures'].chinBoneSize = ((tonumber(number) / 10) + 0.0)
    elseif type == "chin_4" then tempSkinTable['faceFeatures'].chinHole = ((tonumber(number) / 10) + 0.0)
    elseif type == "age_1" then tempSkinTable['headOverlays'].ageing.style = tonumber(number)
    elseif type == "age_2" then tempSkinTable['headOverlays'].ageing.opacity = ((tonumber(number) / 10) + 0.0)
    elseif type == "hair_1" then tempSkinTable['hair'].style = tonumber(number)
    elseif type == "hair_2" then tempSkinTable['hair'].highlight = tonumber(number)
    elseif type == "hair_color_1" then tempSkinTable['hair'].color = tonumber(number)
    elseif type == "beard_1" then tempSkinTable['headOverlays'].beard.style = tonumber(number)
    elseif type == "beard_2" then tempSkinTable['headOverlays'].beard.opacity = (tonumber(number) / 10) + 0.0
    elseif type == "beard_3" then tempSkinTable['headOverlays'].beard.color = tonumber(number)
    elseif type == "eyebrows_1" then tempSkinTable['headOverlays'].eyebrows.style = tonumber(number)
    elseif type == "eyebrows_2" then tempSkinTable['headOverlays'].eyebrows.opacity = (tonumber(number) / 10) + 0.0
    elseif type == "eyebrows_3" then tempSkinTable['headOverlays'].eyebrows.color = tonumber(number)
    elseif type == "makeup_1" then tempSkinTable['headOverlays'].makeUp.style = tonumber(number)
    elseif type == "makeup_2" then tempSkinTable['headOverlays'].makeUp.opacity = (tonumber(number) / 10) + 0.0
    elseif type == "makeup_3" then tempSkinTable['headOverlays'].makeUp.color = tonumber(number)
    elseif type == "blush_1" then tempSkinTable['headOverlays'].blush.style = tonumber(number)
    elseif type == "blush_2" then tempSkinTable['headOverlays'].blush.opacity = (tonumber(number) / 10) + 0.0
    elseif type == "lipstick_1" then tempSkinTable['headOverlays'].lipstick.style = tonumber(number)
    elseif type == "lipstick_2" then tempSkinTable['headOverlays'].lipstick.opacity = (tonumber(number) / 10) + 0.0
    elseif type == "lipstick_3" then tempSkinTable['headOverlays'].lipstick.color = tonumber(number)
    elseif type == "chest_1" then tempSkinTable['headOverlays'].chestHair.style = tonumber(number)
    elseif type == "chest_2" then tempSkinTable['headOverlays'].chestHair.opacity = (tonumber(number) / 10) + 0.0
    elseif type == "chest_3" then tempSkinTable['headOverlays'].chestHair.color = tonumber(number)
    elseif type == "blemishes_1" then tempSkinTable['headOverlays'].blemishes.style = tonumber(number)
    elseif type == "blemishes_2" then tempSkinTable['headOverlays'].blemishes.opacity = tonumber(number)
    elseif type == "complexion_1" then tempSkinTable['headOverlays'].complexion.style = tonumber(number)
    elseif type == "complexion_2" then tempSkinTable['headOverlays'].complexion.opacity = tonumber(number)
    elseif type == "sun_1" then tempSkinTable['headOverlays'].sunDamage.style = tonumber(number)
    elseif type == "sun_2" then tempSkinTable['headOverlays'].sunDamage.opacity = tonumber(number)
    elseif type == "moles_1" then tempSkinTable['headOverlays'].moleAndFreckles.style = tonumber(number)
    elseif type == "moles_2" then tempSkinTable['headOverlays'].moleAndFreckles.opacity = tonumber(number)
    elseif type == "tshirt_1" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 8 then
                v.drawable = tonumber(number)
            end
        end
    elseif type == "tshirt_2" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 8 then
                v.texture = tonumber(number)
            end
        end
    elseif type == "torso_1" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 11 then
                v.drawable = tonumber(number)
            end
        end
    elseif type == "torso_2" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 11 then
                v.texture = tonumber(number)
            end
        end
    elseif type == "arms" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 3 then
                v.drawable = tonumber(number)
            end
        end
    elseif type == "arms_2" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 3 then
                v.texture = tonumber(number)
            end
        end
    elseif type == "pants_1" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 4 then
                v.drawable = tonumber(number)
            end
        end
    elseif type == "pants_2" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 4 then
                v.texture = tonumber(number)
            end
        end
    elseif type == "shoes_1" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 6 then
                v.drawable = tonumber(number)
            end
        end
    elseif type == "shoes_2" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 6 then
                v.texture = tonumber(number)
            end
        end
    elseif type == "mask_1" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 1 then
                v.drawable = tonumber(number)
            end
        end
    elseif type == "mask_2" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 1 then
                v.texture = tonumber(number)
            end
        end
    elseif type == "bproof_1" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 9 then
                v.drawable = tonumber(number)
            end
        end
    elseif type == "bproof_2" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 9 then
                v.texture = tonumber(number)
            end
        end
    elseif type == "chain_1" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 7 then
                v.drawable = tonumber(number)
            end
        end
    elseif type == "chain_2" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 7 then
                v.texture = tonumber(number)
            end
        end
    elseif type == "bags_1" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 5 then
                v.drawable = tonumber(number)
            end
        end
    elseif type == "bags_2" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 5 then
                v.texture = tonumber(number)
            end
        end
    elseif type == "helmet_1" then 
        for k, v in pairs(tempSkinTable['props']) do
            if v.prop_id == 0 then
                v.drawable = tonumber(number)
            end
        end
    elseif type == "helmet_2" then 
        for k, v in pairs(tempSkinTable['props']) do
            if v.prop_id == 0 then
                v.texture = tonumber(number)
            end
        end
    elseif type == "glasses_1" then 
        for k, v in pairs(tempSkinTable['props']) do
            if v.prop_id == 1 then
                v.drawable = tonumber(number)
            end
        end
    elseif type == "glasses_2" then 
        for k, v in pairs(tempSkinTable['props']) do
            if v.prop_id == 1 then
                v.texture = tonumber(number)
            end
        end
    elseif type == "ears_1" then 
        for k, v in pairs(tempSkinTable['props']) do
            if v.prop_id == 2 then
                v.drawable = tonumber(number)
            end
        end
    elseif type == "ears_2" then 
        for k, v in pairs(tempSkinTable['props']) do
            if v.prop_id == 2 then
                v.texture = tonumber(number)
            end
        end
    elseif type == "watches_1" then 
        for k, v in pairs(tempSkinTable['props']) do
            if v.prop_id == 6 then
                v.drawable = tonumber(number)
            end
        end
    elseif type == "watches_2" then
        for k, v in pairs(tempSkinTable['props']) do
            if v.prop_id == 6 then
                v.texture = tonumber(number)
            end
        end
    elseif type == "bracelets_1" then 
        for k, v in pairs(tempSkinTable['props']) do
            if v.prop_id == 7 then
                v.drawable = tonumber(number)
            end
        end
    elseif type == "bracelets_2" then 
        for k, v in pairs(tempSkinTable['props']) do
            if v.prop_id == 7 then
                v.texture = tonumber(number)
            end
        end
    elseif type == "decals_1" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 10 then
                v.drawable = tonumber(number)
            end
        end
    elseif type == "decals_2" then 
        for k, v in pairs(tempSkinTable['components']) do
            if v.component_id == 10 then
                v.texture = tonumber(number)
            end
        end
    end
    Character_ESX[type] = tonumber(number)
    updateValue()
end

function updateValue()
    local myPed = PlayerPedId()

    SetPedHeadBlendData(myPed, tempSkinTable['headBlend'].shapeFirst, tempSkinTable['headBlend'].shapeSecond, 0, tempSkinTable['headBlend'].skinFirst, tempSkinTable['headBlend'].skinSecond, 0, tempSkinTable['headBlend'].shapeMix, tempSkinTable['headBlend'].skinMix, 0.0, false)

    SetPedComponentVariation(myPed, 2, tempSkinTable['hair'].style, tempSkinTable['hair'].highlight, 0)
    SetPedHairColor(myPed, tempSkinTable['hair'].color, tempSkinTable['hair'].color)
    
	SetPedEyeColor(myPed, tempSkinTable['eyeColor'])

    SetPedHeadOverlay(myPed, 2, tempSkinTable['headOverlays'].eyebrows.style, tempSkinTable['headOverlays'].eyebrows.opacity + 0.0)
    SetPedHeadOverlayColor(myPed, 2, 1, tempSkinTable['headOverlays'].eyebrows.color, 0)
    
    SetPedHeadOverlay(myPed, 1, tempSkinTable['headOverlays'].beard.style, tempSkinTable['headOverlays'].beard.opacity + 0.0)
    SetPedHeadOverlayColor(myPed, 1, 1, tempSkinTable['headOverlays'].beard.color, 0)
    
    SetPedHeadOverlay(myPed, 5, tempSkinTable['headOverlays'].blush.style, tempSkinTable['headOverlays'].blush.opacity + 0.0)
	SetPedHeadOverlayColor(myPed, 5, 2,	tempSkinTable['headOverlays'].blush.color)
    
    SetPedHeadOverlay(myPed, 8, tempSkinTable['headOverlays'].lipstick.style, tempSkinTable['headOverlays'].lipstick.opacity + 0.0)
    SetPedHeadOverlayColor(myPed, 8, 1, tempSkinTable['headOverlays'].lipstick.color, 0)
    
    SetPedHeadOverlay(myPed, 4, tempSkinTable['headOverlays'].makeUp.style, tempSkinTable['headOverlays'].makeUp.opacity + 0.0)
    SetPedHeadOverlayColor(myPed, 4, 1, tempSkinTable['headOverlays'].makeUp.color, 0)
    
	SetPedHeadOverlay(myPed, 3, tempSkinTable['headOverlays'].ageing.style, tempSkinTable['headOverlays'].ageing.opacity + 0.0)
    
    SetPedHeadOverlay(myPed, 10, tempSkinTable['headOverlays'].chestHair.style, (tempSkinTable['headOverlays'].chestHair.opacity / 10) + 0.0)
	SetPedHeadOverlayColor(myPed, 10, 1, tempSkinTable['headOverlays'].chestHair.color)
    
	SetPedHeadOverlay(myPed, 0, tempSkinTable['headOverlays'].blemishes.style, (tempSkinTable['headOverlays'].blemishes.opacity / 10) + 0.0)
    
	SetPedHeadOverlay(myPed, 6, tempSkinTable['headOverlays'].complexion.style, (tempSkinTable['headOverlays'].complexion.opacity / 10) + 0.0)
    
	SetPedHeadOverlay(myPed, 7, tempSkinTable['headOverlays'].sunDamage.style, (tempSkinTable['headOverlays'].sunDamage.opacity / 10) + 0.0)

	SetPedHeadOverlay(myPed, 9, tempSkinTable['headOverlays'].moleAndFreckles.style, (tempSkinTable['headOverlays'].moleAndFreckles.opacity / 10) + 0.0)

    for i=1, #tempSkinTable.components, 1 do
        if tempSkinTable.components[i].component_id ~= 2 then
            SetPedComponentVariation(myPed, tempSkinTable.components[i].component_id, tempSkinTable.components[i].drawable, 0, 2)
            SetPedComponentVariation(myPed, tempSkinTable.components[i].component_id, tempSkinTable.components[i].drawable, tempSkinTable.components[i].texture, 0)
        end
    end
    
    for i=1, #tempSkinTable.props, 1 do
        if tempSkinTable.props[i].drawable ~= -1 then
            SetPedPropIndex(myPed, tempSkinTable.props[i].prop_id, tempSkinTable.props[i].drawable, 0, true)
            SetPedPropIndex(myPed, tempSkinTable.props[i].prop_id, tempSkinTable.props[i].drawable, tempSkinTable.props[i].texture, true)
        else
            ClearPedProp(myPed, tempSkinTable.props[i].prop_id)
        end
    end

    SetPedFaceFeature(myPed, 0, tempSkinTable['faceFeatures'].noseWidth + 0.0)
    SetPedFaceFeature(myPed, 1, tempSkinTable['faceFeatures'].nosePeakHigh + 0.0)
    SetPedFaceFeature(myPed, 2, tempSkinTable['faceFeatures'].nosePeakLowering + 0.0)
    SetPedFaceFeature(myPed, 3, tempSkinTable['faceFeatures'].nosePeakSize + 0.0)
    SetPedFaceFeature(myPed, 4, tempSkinTable['faceFeatures'].noseBoneHigh + 0.0)
    SetPedFaceFeature(myPed, 5, tempSkinTable['faceFeatures'].noseBoneTwist + 0.0)

    SetPedFaceFeature(myPed, 6, tempSkinTable['faceFeatures'].eyeBrownHigh + 0.0)
    SetPedFaceFeature(myPed, 7, tempSkinTable['faceFeatures'].eyeBrownForward + 0.0)
    SetPedFaceFeature(myPed, 8, tempSkinTable['faceFeatures'].cheeksBoneHigh + 0.0)
    SetPedFaceFeature(myPed, 9, tempSkinTable['faceFeatures'].cheeksBoneWidth + 0.0)
    SetPedFaceFeature(myPed, 10, tempSkinTable['faceFeatures'].cheeksWidth + 0.0)

    SetPedFaceFeature(myPed, 11, tempSkinTable['faceFeatures'].eyesOpening + 0.0)

    SetPedFaceFeature(myPed, 12, tempSkinTable['faceFeatures'].lipsThickness + 0.0)

    SetPedFaceFeature(myPed, 13, tempSkinTable['faceFeatures'].jawBoneWidth + 0.0)
    SetPedFaceFeature(myPed, 14, tempSkinTable['faceFeatures'].jawBoneBackSize + 0.0)
    SetPedFaceFeature(myPed, 15, tempSkinTable['faceFeatures'].chinBoneLenght + 0.0)
    SetPedFaceFeature(myPed, 16, tempSkinTable['faceFeatures'].chinBoneLowering + 0.0)
    SetPedFaceFeature(myPed, 17, tempSkinTable['faceFeatures'].chinBoneSize + 0.0)
    SetPedFaceFeature(myPed, 18, tempSkinTable['faceFeatures'].chinHole + 0.0)
    SetPedFaceFeature(myPed, 19, tempSkinTable['faceFeatures'].neckThickness + 0.0)
end