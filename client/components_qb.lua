if (Config.Core ~= 'QB-Core') then
    return
end

if (Config.SkinManager ~= 'qb-clothing') then
    return
end

Character_QB = {
    ["face"] = {item = 21, texture = 21},
    ["face2"] = {item = 0, texture = 0},
    ["facemix"] = {skinMix = 50, shapeMix = 50},
    ["pants"] = {item = 0, texture = 0},
    ["hair"] = {item = 0, texture = 0},
    ["eyebrows"] = {item = -1, texture = 1},
    ["beard"] = {item = -1, texture = 1},
    ["blush"] = {item = -1, texture = 1},
    ["lipstick"] = {item = -1, texture = 1},
    ["makeup"] = {item = -1, texture = 1},
    ["ageing"] = {item = -1, texture = 0},
    ["arms"] = {item = 0, texture = 0},
    ["t-shirt"] = {item = 1, texture = 0},
    ["torso2"] = {item = 0, texture = 0},
    ["vest"] = {item = 0, texture = 0},
    ["bag"] = {item = 0, texture = 0},
    ["shoes"] = {item = 0, texture = 0},
    ["mask"] = {item = 0, texture = 0},
    ["hat"] = {item = -1, texture = 0},
    ["glass"] = {item = 0, texture = 0},
    ["ear"] = {item = -1, texture = 0},
    ["watch"] = {item = -1, texture = 0},
    ["bracelet"] = {item = -1, texture = 0},
    ["accessory"] = {item = 0, texture = 0},
    ["decals"] = {item = 0, texture = 0},
    ["eye_color"] = {item = -1, texture = 0},
    ["moles"] = {item = 0, texture = 0},
    ["nose_0"] = {item = 0, texture = 0},
    ["nose_1"] = {item = 0, texture = 0},
    ["nose_2"] = {item = 0, texture = 0},
    ["nose_3"] = {item = 0, texture = 0},
    ["nose_4"] = {item = 0, texture = 0},
    ["nose_5"] = {item = 0, texture = 0},
    ["cheek_1"] = {item = 0, texture = 0},
    ["cheek_2"] = {item = 0, texture = 0},
    ["cheek_3"] = {item = 0, texture = 0},
    ["eye_opening"] = {item = 0, texture = 0},
    ["lips_thickness"] = {item = 0, texture = 0},
    ["jaw_bone_width"] = {item = 0, texture = 0},
    ["eyebrown_high"] = {item = 0, texture = 0},
    ["eyebrown_forward"] = {item = 0, texture = 0},
    ["jaw_bone_back_lenght"] = {item = 0, texture = 0},
    ["chimp_bone_lowering"] = {item = 0, texture = 0},
    ["chimp_bone_lenght"] = {item = 0, texture = 0},
    ["chimp_bone_width"] = {item = 0, texture = 0},
    ["chimp_hole"] = {item = 0, texture = 0},
    ["neck_thikness"] = {item = 0, texture = 0},
}

function qbcore_switcher(type, number)
    if type == "mom" then
        tempSkinTable['face'].item = tonumber(number)
        tempSkinTable['face'].texture = tonumber(number)
    elseif type == "dad" then
        tempSkinTable['face2'].item = tonumber(number)
        tempSkinTable['face2'].texture = tonumber(number)
    elseif type == "face_md_weight" then
        local face_weight =	(tonumber(number) / 100) + 0.0
        tempSkinTable['facemix'].shapeMix = face_weight
    elseif type == "skin_md_weight" then
        local skin_weight =	(tonumber(number) / 100) + 0.0
        tempSkinTable['facemix'].skinMix = skin_weight
    elseif type == "neck_thickness" then
        tempSkinTable['neck_thikness'].item = tonumber(number)
    elseif type == "age_1" then
        tempSkinTable['ageing'].item = tonumber(number)
    elseif type == "age_2" then
        tempSkinTable['ageing'].texture = tonumber(number)
    elseif type == "eyebrows_5" then
        tempSkinTable['eyebrown_high'].item = tonumber(number)
    elseif type == "eyebrows_6" then
        tempSkinTable['eyebrown_forward'].item = tonumber(number)
    elseif type == "nose_1" then
        tempSkinTable['nose_0'].item = tonumber(number)
    elseif type == "nose_2" then
        tempSkinTable['nose_1'].item = tonumber(number)
    elseif type == "nose_3" then
        tempSkinTable['nose_2'].item = tonumber(number)
    elseif type == "nose_4" then
        tempSkinTable['nose_3'].item = tonumber(number)
    elseif type == "nose_5" then
        tempSkinTable['nose_4'].item = tonumber(number)
    elseif type == "nose_6" then
        tempSkinTable['nose_5'].item = tonumber(number)
    elseif type == "cheeks_1" then
        tempSkinTable['cheek_1'].item = tonumber(number)
    elseif type == "cheeks_2" then
        tempSkinTable['cheek_2'].item = tonumber(number)
    elseif type == "cheeks_3" then
        tempSkinTable['cheek_3'].item = tonumber(number)
    elseif type == "lip_thickness" then
        tempSkinTable['lips_thickness'].item = tonumber(number)
    elseif type == "jaw_1" then
        tempSkinTable['jaw_bone_width'].item = tonumber(number)
    elseif type == "jaw_2" then
        tempSkinTable['jaw_bone_back_lenght'].item = tonumber(number)
    elseif type == "chin_1" then
        tempSkinTable['chimp_bone_lowering'].item = tonumber(number)
    elseif type == "chin_2" then
        tempSkinTable['chimp_bone_lenght'].item = tonumber(number)
    elseif type == "chin_3" then
        tempSkinTable['chimp_bone_width'].item = tonumber(number)
    elseif type == "chin_4" then
        tempSkinTable['chimp_hole'].item = tonumber(number)
    elseif type == "hair_1" then
        tempSkinTable['hair'].item = tonumber(number)
    elseif type == "hair_color_1" then
        tempSkinTable['hair'].texture = tonumber(number)
    elseif type == "beard_1" then
        tempSkinTable['beard'].item = tonumber(number)
    elseif type == "beard_3" then
        tempSkinTable['beard'].texture = tonumber(number)
    elseif type == "eyebrows_1" then
        tempSkinTable['eyebrows'].item = tonumber(number)
    elseif type == "eyebrows_3" then
        tempSkinTable['eyebrows'].texture = tonumber(number)
    elseif type == "makeup_1" then
        tempSkinTable['makeup'].item = tonumber(number)
    elseif type == "makeup_3" then
        tempSkinTable['makeup'].texture = tonumber(number)
    elseif type == "blush_1" then
        tempSkinTable['blush'].item = tonumber(number)
    elseif type == "blush_3" then
        tempSkinTable['blush'].texture = tonumber(number)
    elseif type == "lipstick_1" then
        tempSkinTable['lipstick'].item = tonumber(number)
    elseif type == "lipstick_3" then
        tempSkinTable['lipstick'].texture = tonumber(number)
    elseif type == "tshirt_1" then
        tempSkinTable['t-shirt'].item = number
    elseif type == "tshirt_2" then
        tempSkinTable['t-shirt'].texture = number
    elseif type == "torso_1" then
        tempSkinTable['torso2'].item = number
    elseif type == "torso_2" then
        tempSkinTable['torso2'].texture = number
    elseif type == "arms" then
        tempSkinTable['arms'].item = number
    elseif type == "arms_2" then
        tempSkinTable['arms'].texture = number
    elseif type == "pants_1" then
        tempSkinTable['pants'].item = number
    elseif type == "pants_2" then
        tempSkinTable['pants'].texture = number
    elseif type == "shoes_1" then
        tempSkinTable['shoes'].item = number
    elseif type == "shoes_2" then
        tempSkinTable['shoes'].texture = number
    elseif type == "bags_1" then
        tempSkinTable['bag'].item = number
    elseif type == "bags_2" then
        tempSkinTable['bag'].texture = number
    elseif type == "helmet_1" then
        tempSkinTable['hat'].item = number
    elseif type == "helmet_2" then
        tempSkinTable['hat'].texture = number
    elseif type == "mask_1" then
        tempSkinTable['mask'].item = number
    elseif type == "mask_2" then
        tempSkinTable['mask'].texture = number
    elseif type == "glasses_1" then
        tempSkinTable['glass'].item = number
    elseif type == "glasses_2" then
        tempSkinTable['glass'].texture = number
    elseif type == "watches_1" then
        tempSkinTable['watch'].item = number
    elseif type == "watches_2" then
        tempSkinTable['watch'].texture = number
    elseif type == "bracelets_1" then
        tempSkinTable['bracelet'].item = number
    elseif type == "bracelets_2" then
        tempSkinTable['bracelet'].texture = number
    elseif type == "decals_1" then
        tempSkinTable['decals'].item = number
    elseif type == "decals_2" then
        tempSkinTable['decals'].texture = number
    elseif type == "bproof_1" then
        tempSkinTable['vest'].item = number
    elseif type == "bproof_2" then
        tempSkinTable['vest'].texture = number
    elseif type == "ears_1" then
        tempSkinTable['ear'].item = number
    elseif type == "ears_2" then
        tempSkinTable['ear'].texture = number
    elseif type == "chain_1" then
        tempSkinTable['accessory'].item = number
    elseif type == "chain_2" then
        tempSkinTable['accessory'].texture = number
    elseif type == "eye_color" then
        tempSkinTable['eye_color'].item = tonumber(number)
    end
    updateValue(tempSkinTable)
end

function updateValue(data)
    local myPed = PlayerPedId()

    SetPedHeadBlendData(myPed, tempSkinTable["face"].item, tempSkinTable["face2"].item, 0, tempSkinTable["face"].texture, tempSkinTable["face2"].texture, 0, tempSkinTable["facemix"].shapeMix, tempSkinTable["facemix"].skinMix, 0.0, false)

    SetPedComponentVariation(myPed, 4, tempSkinTable["pants"].item, 0, 0)
    SetPedComponentVariation(myPed, 4, tempSkinTable["pants"].item, tempSkinTable["pants"].texture, 0)

    SetPedComponentVariation(myPed, 2, tempSkinTable["hair"].item, 0, 0)
    SetPedHairColor(myPed, tempSkinTable["hair"].texture, tempSkinTable["hair"].texture)

    SetPedHeadOverlay(myPed, 2, tempSkinTable["eyebrows"].item, 1.0)
    SetPedHeadOverlayColor(myPed, 2, 1, tempSkinTable["eyebrows"].texture, 0)

    SetPedHeadOverlay(myPed, 1, tempSkinTable["beard"].item, 1.0)
    SetPedHeadOverlayColor(myPed, 1, 1, tempSkinTable["beard"].texture, 0)

    SetPedHeadOverlay(myPed, 5, tempSkinTable["blush"].item, 1.0)
    SetPedHeadOverlayColor(myPed, 5, 1, tempSkinTable["blush"].texture, 0)

    SetPedHeadOverlay(myPed, 8, tempSkinTable["lipstick"].item, 1.0)
    SetPedHeadOverlayColor(myPed, 8, 1, tempSkinTable["lipstick"].texture, 0)

    SetPedHeadOverlay(myPed, 4, tempSkinTable["makeup"].item, 1.0)
    SetPedHeadOverlayColor(myPed, 4, 1, tempSkinTable["makeup"].texture, 0)

    SetPedHeadOverlay(myPed, 3, tempSkinTable["ageing"].item, 1.0)

    SetPedComponentVariation(myPed, 3, tempSkinTable["arms"].item, 0, 2)
    SetPedComponentVariation(myPed, 3, tempSkinTable["arms"].item, tempSkinTable["arms"].texture, 0)

    SetPedComponentVariation(myPed, 8, tempSkinTable["t-shirt"].item, 0, 2)
    SetPedComponentVariation(myPed, 8, tempSkinTable["t-shirt"].item, tempSkinTable["t-shirt"].texture, 0)

    SetPedComponentVariation(myPed, 9, tempSkinTable["vest"].item, 0, 2)
    SetPedComponentVariation(myPed, 9, tempSkinTable["vest"].item, tempSkinTable["vest"].texture, 0)

    SetPedComponentVariation(myPed, 11, tempSkinTable["torso2"].item, 0, 2)
    SetPedComponentVariation(myPed, 11, tempSkinTable["torso2"].item, tempSkinTable["torso2"].texture, 0)

    SetPedComponentVariation(myPed, 6, tempSkinTable["shoes"].item, 0, 2)
    SetPedComponentVariation(myPed, 6, tempSkinTable["shoes"].item, tempSkinTable["shoes"].texture, 0)

    SetPedComponentVariation(myPed, 1, tempSkinTable["mask"].item, 0, 2)
    SetPedComponentVariation(myPed, 1, tempSkinTable["mask"].item, tempSkinTable["mask"].texture, 0)

    SetPedComponentVariation(myPed, 10, tempSkinTable["decals"].item, 0, 2)
    SetPedComponentVariation(myPed, 10, tempSkinTable["decals"].item, tempSkinTable["decals"].texture, 0)

    SetPedComponentVariation(myPed, 7, tempSkinTable["accessory"].item, 0, 2)
    SetPedComponentVariation(myPed, 7, tempSkinTable["accessory"].item, tempSkinTable["accessory"].texture, 0)

    SetPedComponentVariation(myPed, 5, tempSkinTable["bag"].item, 0, 2)
    SetPedComponentVariation(myPed, 5, tempSkinTable["bag"].item, tempSkinTable["bag"].texture, 0)

    SetPedEyeColor(myPed, tempSkinTable['eye_color'].item)
    SetPedHeadOverlay(myPed, 9, tempSkinTable['moles'].item, tempSkinTable['moles'].texture)
    SetPedFaceFeature(myPed, 0, (tempSkinTable['nose_0'].item / 10) + 0.0)
    SetPedFaceFeature(myPed, 1, (tempSkinTable['nose_1'].item / 10) + 0.0)
    SetPedFaceFeature(myPed, 2, (tempSkinTable['nose_2'].item / 10) + 0.0)
    SetPedFaceFeature(myPed, 3, (tempSkinTable['nose_3'].item / 10) + 0.0)
    SetPedFaceFeature(myPed, 4, (tempSkinTable['nose_4'].item / 10) + 0.0)
    SetPedFaceFeature(myPed, 5, (tempSkinTable['nose_5'].item / 10) + 0.0)
    SetPedFaceFeature(myPed, 6, (tempSkinTable['eyebrown_high'].item / 10) + 0.0)
    SetPedFaceFeature(myPed, 7, (tempSkinTable['eyebrown_forward'].item / 10) + 0.0)
    SetPedFaceFeature(myPed, 8, (tempSkinTable['cheek_1'].item / 10) + 0.0)
    SetPedFaceFeature(myPed, 9, (tempSkinTable['cheek_2'].item / 10) + 0.0)
    SetPedFaceFeature(myPed, 10, (tempSkinTable['cheek_3'].item / 10) + 0.0)
    SetPedFaceFeature(myPed, 11, tempSkinTable['eye_opening'].item)
    SetPedFaceFeature(myPed, 12, (tempSkinTable['lips_thickness'].item / 10) + 0.0)
    SetPedFaceFeature(myPed, 13, (tempSkinTable['jaw_bone_width'].item / 10) + 0.0)
    SetPedFaceFeature(myPed, 14, (tempSkinTable['jaw_bone_back_lenght'].item / 10) + 0.0)
    SetPedFaceFeature(myPed, 15, (tempSkinTable['chimp_bone_lowering'].item / 10) + 0.0)
    SetPedFaceFeature(myPed, 16, (tempSkinTable['chimp_bone_lenght'].item / 10) + 0.0)
    SetPedFaceFeature(myPed, 17, (tempSkinTable['chimp_bone_width'].item / 10) + 0.0)
    SetPedFaceFeature(myPed, 18, (tempSkinTable['chimp_hole'].item / 10) + 0.0)
    SetPedFaceFeature(myPed, 19, (tempSkinTable['neck_thikness'].item/ 10) + 0.0)

    if tempSkinTable["hat"].item ~= -1 and tempSkinTable["hat"].item ~= 0 then
        SetPedPropIndex(myPed, 0, tempSkinTable["hat"].item, tempSkinTable["hat"].texture, true)
    else
        ClearPedProp(myPed, 0)
    end

    if tempSkinTable["glass"].item ~= -1 and tempSkinTable["glass"].item ~= 0 then
        SetPedPropIndex(myPed, 1, tempSkinTable["glass"].item, tempSkinTable["glass"].texture, true)
    else
        ClearPedProp(myPed, 1)
    end

    if tempSkinTable["ear"].item ~= -1 and tempSkinTable["ear"].item ~= 0 then
        SetPedPropIndex(myPed, 2, tempSkinTable["ear"].item, tempSkinTable["ear"].texture, true)
    else
        ClearPedProp(myPed, 2)
    end

    if tempSkinTable["watch"].item ~= -1 and tempSkinTable["watch"].item ~= 0 then
        SetPedPropIndex(myPed, 6, tempSkinTable["watch"].item, tempSkinTable["watch"].texture, true)
    else
        ClearPedProp(myPed, 6)
    end

    if tempSkinTable["bracelet"].item ~= -1 and tempSkinTable["bracelet"].item ~= 0 then
        SetPedPropIndex(myPed, 7, tempSkinTable["bracelet"].item, tempSkinTable["bracelet"].texture, true)
    else
        ClearPedProp(myPed, 7)
    end
end