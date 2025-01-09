Character_ESX = {}

local Components = {
	{name = 'sex',				value = 0,		min = 0},
	{name = 'mom',				value = 21,		min = 21},
	{name = 'dad',				value = 0,		min = 0},
	{name = 'face_md_weight',	value = 50,		min = 0},
	{name = 'skin_md_weight',	value = 50,		min = 0},
	{name = 'nose_1',			value = 0,		min = -10},
	{name = 'nose_2',			value = 0,		min = -10},
	{name = 'nose_3',			value = 0,		min = -10},
	{name = 'nose_4',			value = 0,		min = -10},
	{name = 'nose_5',			value = 0,		min = -10},
	{name = 'nose_6',			value = 0,		min = -10},
	{name = 'cheeks_1',			value = 0,		min = -10},
	{name = 'cheeks_2',			value = 0,		min = -10},
	{name = 'cheeks_3',			value = 0,		min = -10},
	{name = 'lip_thickness',	value = 0,		min = -10},
	{name = 'jaw_1',			value = 0,		min = -10},
	{name = 'jaw_2',			value = 0,		min = -10},
	{name = 'chin_1',			value = 0,		min = -10},
	{name = 'chin_2',			value = 0,		min = -10},
	{name = 'chin_3',			value = 0,		min = -10},
	{name = 'chin_4',			value = 0,		min = -10},
	{name = 'neck_thickness',	value = 0,		min = -10},
	{name = 'hair_1',			value = 0,		min = 0},
	{name = 'hair_2',			value = 0,		min = 0},
	{name = 'hair_color_1',		value = 0,		min = 0},
	{name = 'hair_color_2',		value = 0,		min = 0},
	{name = 'tshirt_1',			value = 0,		min = 0,    componentId	= 8},
	{name = 'tshirt_2',			value = 0,		min = 0,    textureof	= 'tshirt_1'},
	{name = 'torso_1',			value = 0,		min = 0,    componentId	= 11},
	{name = 'torso_2',			value = 0,		min = 0,	textureof	= 'torso_1'},
	{name = 'decals_1',			value = 0,		min = 0,	componentId	= 10},
	{name = 'decals_2',			value = 0,		min = 0,	textureof	= 'decals_1'},
	{name = 'arms',				value = 0,		min = 0},
	{name = 'arms_2',			value = 0,		min = 0},
	{name = 'pants_1',			value = 0,		min = 0,	componentId	= 4},
	{name = 'pants_2',			value = 0,		min = 0,	textureof	= 'pants_1'},
	{name = 'shoes_1',			value = 0,		min = 0,	componentId	= 6},
	{name = 'shoes_2',			value = 0,		min = 0,	textureof	= 'shoes_1'},
	{name = 'mask_1',			value = 0,		min = 0,	componentId	= 1},
	{name = 'mask_2',			value = 0,		min = 0,	textureof	= 'mask_1'},
	{name = 'bproof_1',			value = 0,		min = 0,	componentId	= 9},
	{name = 'bproof_2',			value = 0,		min = 0,	textureof	= 'bproof_1'},
	{name = 'chain_1',			value = 0,		min = 0,	componentId	= 7},
	{name = 'chain_2',			value = 0,		min = 0,	textureof	= 'chain_1'},
	{name = 'helmet_1',			value = -1,		min = -1,	componentId	= 0 },
	{name = 'helmet_2',			value = 0,		min = 0,	textureof	= 'helmet_1'},
	{name = 'glasses_1',		value = 0,		min = 0,	componentId	= 1},
	{name = 'glasses_2',		value = 0,		min = 0,	textureof	= 'glasses_1'},
	{name = 'watches_1',		value = -1,		min = -1,	componentId	= 6},
	{name = 'watches_2',		value = 0,		min = 0,	textureof	= 'watches_1'},
	{name = 'bracelets_1',		value = -1,		min = -1,	componentId	= 7},
	{name = 'bracelets_2',		value = 0,		min = 0,	textureof	= 'bracelets_1'},
	{name = 'bags_1',			value = 0,		min = 0,	componentId	= 5},
	{name = 'bags_2',			value = 0,		min = 0,	textureof	= 'bags_1'},
	{name = 'eye_color',		value = 0,		min = 0},
	{name = 'eye_squint',		value = 0,		min = -10},
	{name = 'eyebrows_1',		value = 0,		min = Config.SkinManager == "qb-clothing" and -1 or 0},
	{name = 'eyebrows_2',		value = 0,		min = 0},
	{name = 'eyebrows_3',		value = 0,		min = 0},
	{name = 'eyebrows_4',		value = 0,		min = 0},
	{name = 'eyebrows_5',		value = 0,		min = -10},
	{name = 'eyebrows_6',		value = 0,		min = -10},
	{name = 'makeup_1',			value = 0,		min = Config.SkinManager == "qb-clothing" and -1 or 0},
	{name = 'makeup_2',			value = 0,		min = 0},
	{name = 'makeup_3',			value = 0,		min = 0},
	{name = 'makeup_4',			value = 0,		min = 0},
	{name = 'lipstick_1',		value = 0,		min = Config.SkinManager == "qb-clothing" and -1 or 0},
	{name = 'lipstick_2',		value = 0,		min = 0},
	{name = 'lipstick_3',		value = 0,		min = 0},
	{name = 'lipstick_4',		value = 0,		min = 0},
	{name = 'ears_1',			value = -1,		min = -1,	componentId	= 2},
	{name = 'ears_2',			value = 0,		min = 0,	textureof	= 'ears_1'},
	{name = 'chest_1',			value = 0,		min = 0},
	{name = 'chest_2',			value = 0,		min = 0},
	{name = 'chest_3',			value = 0,		min = 0},
	{name = 'bodyb_1',			value = -1,		min = -1},
	{name = 'bodyb_2',			value = 0,		min = 0},
	{name = 'bodyb_3',			value = -1,		min = -1},
	{name = 'bodyb_4',			value = 0,		min = 0},
	{name = 'age_1',			value = 0,		min = Config.SkinManager == "qb-clothing" and -1 or 0},
	{name = 'age_2',			value = 0,		min = 0},
	{name = 'blemishes_1',		value = 0,		min = 0},
	{name = 'blemishes_2',		value = 0,		min = 0},
	{name = 'blush_1',			value = 0,		min = Config.SkinManager == "qb-clothing" and -1 or 0},
	{name = 'blush_2',			value = 0,		min = 0},
	{name = 'blush_3',			value = 0,		min = 0},
	{name = 'complexion_1',		value = 0,		min = 0},
	{name = 'complexion_2',		value = 0,		min = 0},
	{name = 'sun_1',		    value = 0,		min = 0},
	{name = 'sun_2',		    value = 0,		min = 0},
	{name = 'moles_1',			value = 0,		min = 0},
	{name = 'moles_2',			value = 0,		min = 0},
	{name = 'beard_1',			value = 0,		min = Config.SkinManager == "qb-clothing" and -1 or 0},
	{name = 'beard_2',			value = 0,		min = 0},
	{name = 'beard_3',			value = 0,		min = 0},
	{name = 'beard_4',			value = 0,		min = 0}
}

for i=1, #Components, 1 do
	Character_ESX[Components[i].name] = Components[i].value
end

function refreshValues()
	Character_ESX = {}
	for i=1, #Components, 1 do
		Character_ESX[Components[i].name] = Components[i].value
	end
end

function getMaxValues()
    local components = json.decode(json.encode(Components))
	for k,v in pairs(Character_ESX) do
		for i=1, #components, 1 do
			if k == components[i].name then
				components[i].value = v
			end
		end
	end
	return components, GetMaxVals()
end

function GetMaxVal(item)
	local myPed = PlayerPedId()
	local maxVals = GetMaxVals()
	if item == 'tshirt_1' then
		return 'tshirt_2', maxVals['tshirt_2']
	elseif item == 'torso_1' then
		return 'torso_2', maxVals['torso_2']
	elseif item == 'helmet_1' then
		return 'helmet_2', maxVals['helmet_2']
	elseif item == 'pants_1' then
		return 'pants_2', maxVals['pants_2']
	elseif item == 'shoes_1' then
		return 'shoes_2', maxVals['shoes_2']
	elseif item == 'mask_1' then
		return 'mask_2', maxVals['mask_2']
	elseif item == 'decals_1' then
		return 'decals_2', maxVals['decals_2']
	elseif item == 'chain_1' then
		return 'chain_2', maxVals['chain_2']
	elseif item == 'glasses_1' then
		return 'glasses_2', maxVals['glasses_2']
	elseif item == 'watches_1' then
		return 'watches_2', maxVals['watches_2']
	elseif item == 'bracelets_1' then
		return 'bracelets_2', maxVals['bracelets_2']
	elseif item == 'bags_1' then
		return 'bags_2', maxVals['bags_2']
	elseif item == 'ears_1' then
		return 'ears_2', maxVals['ears_2']
	elseif item == 'bproof_1' then
		return 'bproof_2', maxVals['bproof_2']
	elseif item == 'hair_1' then
		return 'hair_2', maxVals['hair_2']
	end
end

function GetMaxVals()
	local myPed = PlayerPedId()
	local data = {
		sex				= 1,
		mom				= 45,
		dad				= 44,
		face_md_weight	= 100,
		skin_md_weight	= 100,
		nose_1			= 10,
		nose_2			= 10,
		nose_3			= 10,
		nose_4			= 10,
		nose_5			= 10,
		nose_6			= 10,
		cheeks_1		= 10,
		cheeks_2		= 10,
		cheeks_3		= 10,
		lip_thickness	= 10,
		jaw_1			= 10,
		jaw_2			= 10,
		chin_1			= 10,
		chin_2			= 10,
		chin_3			= 10,
		chin_4			= 10,
		neck_thickness	= 10,
		age_1			= GetPedHeadOverlayNum(3)-1,
		age_2			= 10,
		beard_1			= GetPedHeadOverlayNum(1)-1,
		beard_2			= 10,
		beard_3			= GetNumHairColors()-1,
		beard_4			= GetNumHairColors()-1,
		hair_1			= GetNumberOfPedDrawableVariations(myPed, 2) - 1,
		hair_2			= GetNumberOfPedTextureVariations(myPed, 2, Character_ESX['hair_1']) - 1,
		hair_color_1	= GetNumHairColors()-1,
		hair_color_2	= GetNumHairColors()-1,
		eye_color		= 31,
		eye_squint		= 10,
		eyebrows_1		= GetPedHeadOverlayNum(2)-1,
		eyebrows_2		= 10,
		eyebrows_3		= GetNumHairColors()-1,
		eyebrows_4		= GetNumHairColors()-1,
		eyebrows_5		= 10,
		eyebrows_6		= 10,
		makeup_1		= GetPedHeadOverlayNum(4)-1,
		makeup_2		= 10,
		makeup_3		= GetNumHairColors()-1,
		makeup_4		= GetNumHairColors()-1,
		lipstick_1		= GetPedHeadOverlayNum(8)-1,
		lipstick_2		= 10,
		lipstick_3		= GetNumHairColors()-1,
		lipstick_4		= GetNumHairColors()-1,
		blemishes_1		= GetPedHeadOverlayNum(0)-1,
		blemishes_2		= 10,
		blush_1			= GetPedHeadOverlayNum(5)-1,
		blush_2			= 10,
		blush_3			= GetNumHairColors()-1,
		complexion_1	= GetPedHeadOverlayNum(6)-1,
		complexion_2	= 10,
		sun_1			= GetPedHeadOverlayNum(7)-1,
		sun_2			= 10,
		moles_1			= GetPedHeadOverlayNum(9)-1,
		moles_2			= 10,
		chest_1			= GetPedHeadOverlayNum(10)-1,
		chest_2			= 10,
		chest_3			= GetNumHairColors()-1,
		bodyb_1			= GetPedHeadOverlayNum(11)-1,
		bodyb_2			= 10,
		bodyb_3			= GetPedHeadOverlayNum(12)-1,
		bodyb_4			= 10,
		ears_1			= GetNumberOfPedPropDrawableVariations(myPed, 2) - 1,
		ears_2			= GetNumberOfPedPropTextureVariations(myPed, 2, Character_ESX['ears_1'] - 1),
		tshirt_1		= GetNumberOfPedDrawableVariations(myPed, 8) - 1,
		tshirt_2		= GetNumberOfPedTextureVariations(myPed, 8, Character_ESX['tshirt_1']) - 1,
		torso_1			= GetNumberOfPedDrawableVariations(myPed, 11) - 1,
		torso_2			= GetNumberOfPedTextureVariations(myPed, 11, Character_ESX['torso_1']) - 1,
		decals_1		= GetNumberOfPedDrawableVariations(myPed, 10) - 1,
		decals_2		= GetNumberOfPedTextureVariations(myPed, 10, Character_ESX['decals_1']) - 1,
		arms			= GetNumberOfPedDrawableVariations(myPed, 3) - 1,
		arms_2			= 10,
		pants_1			= GetNumberOfPedDrawableVariations(myPed, 4) - 1,
		pants_2			= GetNumberOfPedTextureVariations(myPed, 4, Character_ESX['pants_1']) - 1,
		shoes_1			= GetNumberOfPedDrawableVariations(myPed, 6) - 1,
		shoes_2			= GetNumberOfPedTextureVariations(myPed, 6, Character_ESX['shoes_1']) - 1,
		mask_1			= GetNumberOfPedDrawableVariations(myPed, 1) - 1,
		mask_2			= GetNumberOfPedTextureVariations(myPed, 1, Character_ESX['mask_1']) - 1,
		bproof_1		= GetNumberOfPedDrawableVariations(myPed, 9) - 1,
		bproof_2		= GetNumberOfPedTextureVariations(myPed, 9, Character_ESX['bproof_1']) - 1,
		chain_1			= GetNumberOfPedDrawableVariations(myPed, 7) - 1,
		chain_2			= GetNumberOfPedTextureVariations(myPed, 7, Character_ESX['chain_1']) - 1,
		bags_1			= GetNumberOfPedDrawableVariations(myPed, 5) - 1,
		bags_2			= GetNumberOfPedTextureVariations(myPed, 5, Character_ESX['bags_1']) - 1,
		helmet_1		= GetNumberOfPedPropDrawableVariations(myPed, 0) - 1,
		helmet_2		= GetNumberOfPedPropTextureVariations(myPed, 0, Character_ESX['helmet_1']) - 1,
		glasses_1		= GetNumberOfPedPropDrawableVariations(myPed, 1) - 1,
		glasses_2		= GetNumberOfPedPropTextureVariations(myPed, 1, Character_ESX['glasses_1'] - 1),
		watches_1		= GetNumberOfPedPropDrawableVariations(myPed, 6) - 1,
		watches_2		= GetNumberOfPedPropTextureVariations(myPed, 6, Character_ESX['watches_1']) - 1,
		bracelets_1		= GetNumberOfPedPropDrawableVariations(myPed, 7) - 1,
		bracelets_2		= GetNumberOfPedPropTextureVariations(myPed, 7, Character_ESX['bracelets_1'] - 1)
	}
	return data
end

if (Config.Core ~= 'ESX') then
    return
end

if (Config.SkinManager ~= "esx_skin") then
    return
end

function updateValue(skin)
    local myPed = PlayerPedId()

	for k,v in pairs(skin) do
		tempSkinTable[k] = v
	end


	local face_weight =	(tempSkinTable['face_md_weight'] / 100) + 0.0
	local skin_weight =	(tempSkinTable['skin_md_weight'] / 100) + 0.0
	SetPedHeadBlendData(myPed, tempSkinTable['mom'], tempSkinTable['dad'], 0, tempSkinTable['mom'], tempSkinTable['dad'], 0, face_weight, skin_weight, 0.0, false)

	SetPedFaceFeature(myPed, 0, (tempSkinTable['nose_1'] / 10) + 0.0)
	SetPedFaceFeature(myPed, 1, (tempSkinTable['nose_2'] / 10) + 0.0)
	SetPedFaceFeature(myPed, 2, (tempSkinTable['nose_3'] / 10) + 0.0)
	SetPedFaceFeature(myPed, 3, (tempSkinTable['nose_4'] / 10) + 0.0)
	SetPedFaceFeature(myPed, 4, (tempSkinTable['nose_5'] / 10) + 0.0)
	SetPedFaceFeature(myPed, 5, (tempSkinTable['nose_6'] / 10) + 0.0)

	SetPedFaceFeature(myPed, 8, (tempSkinTable['cheeks_1'] / 10) + 0.0)
	SetPedFaceFeature(myPed, 9, (tempSkinTable['cheeks_2'] / 10) + 0.0)
	SetPedFaceFeature(myPed, 10, (tempSkinTable['cheeks_3'] / 10) + 0.0)
    
	SetPedFaceFeature(myPed, 12, (tempSkinTable['lip_thickness'] / 10) + 0.0)
    
	SetPedFaceFeature(myPed, 13, (tempSkinTable['jaw_1'] / 10) + 0.0)
	SetPedFaceFeature(myPed, 14, (tempSkinTable['jaw_2'] / 10) + 0.0)
    
	SetPedFaceFeature(myPed, 15, (tempSkinTable['chin_1'] / 10) + 0.0)
	SetPedFaceFeature(myPed, 16, (tempSkinTable['chin_2'] / 10) + 0.0)
	SetPedFaceFeature(myPed, 17, (tempSkinTable['chin_3'] / 10) + 0.0)
	SetPedFaceFeature(myPed, 18, (tempSkinTable['chin_4'] / 10) + 0.0)
    
	SetPedFaceFeature(myPed, 19, (tempSkinTable['neck_thickness'] / 10) + 0.0)
    
	SetPedHeadOverlay(myPed, 3, tempSkinTable['age_1'], (tempSkinTable['age_2'] / 10) + 0.0)

	SetPedHeadOverlay(myPed, 0, tempSkinTable['blemishes_1'], (tempSkinTable['blemishes_2'] / 10) + 0.0)

	SetPedEyeColor(myPed, tempSkinTable['eye_color'])

	SetPedHeadOverlay(myPed, 2, tempSkinTable['eyebrows_1'], (tempSkinTable['eyebrows_2'] / 10) + 0.0)
	SetPedHeadOverlayColor(myPed, 2, 1,	tempSkinTable['eyebrows_3'], tempSkinTable['eyebrows_4'])
	SetPedFaceFeature(myPed, 6, (tempSkinTable['eyebrows_5'] / 10) + 0.0)
	SetPedFaceFeature(myPed, 7, (tempSkinTable['eyebrows_6'] / 10) + 0.0)
    
	SetPedHeadOverlay(myPed, 4, tempSkinTable['makeup_1'], (tempSkinTable['makeup_2'] / 10) + 0.0)
	SetPedHeadOverlayColor(myPed, 4, 2,	tempSkinTable['makeup_3'], tempSkinTable['makeup_4'])
    
	SetPedHeadOverlay(myPed, 8, tempSkinTable['lipstick_1'], (tempSkinTable['lipstick_2'] / 10) + 0.0)
	SetPedHeadOverlayColor(myPed, 8, 1,	tempSkinTable['lipstick_3'], tempSkinTable['lipstick_4'])
    
	SetPedComponentVariation(myPed, 2, tempSkinTable['hair_1'], tempSkinTable['hair_2'], 2)
	SetPedHairColor(myPed, tempSkinTable['hair_color_1'], tempSkinTable['hair_color_2'])
    
	SetPedHeadOverlay(myPed, 1, tempSkinTable['beard_1'], (tempSkinTable['beard_2'] / 10) + 0.0)
	SetPedHeadOverlayColor(myPed, 1, 1,	tempSkinTable['beard_3'], tempSkinTable['beard_4'])

	SetPedHeadOverlay(myPed, 5, tempSkinTable['blush_1'], (tempSkinTable['blush_2'] / 10) + 0.0)
	SetPedHeadOverlayColor(myPed, 5, 2,	tempSkinTable['blush_3'])

	SetPedHeadOverlay(myPed, 6, tempSkinTable['complexion_1'], (tempSkinTable['complexion_2'] / 10) + 0.0)
	SetPedHeadOverlay(myPed, 7, tempSkinTable['sun_1'], (tempSkinTable['sun_2'] / 10) + 0.0)
	SetPedHeadOverlay(myPed, 9, tempSkinTable['moles_1'], (tempSkinTable['moles_2'] / 10) + 0.0)

	SetPedHeadOverlay(myPed, 10, tempSkinTable['chest_1'], (tempSkinTable['chest_2'] / 10) + 0.0)
	SetPedHeadOverlayColor(myPed, 10, 1, tempSkinTable['chest_3'])

	if tempSkinTable['ears_1'] == -1 then
		ClearPedProp(myPed, 2)
	else
		SetPedPropIndex(myPed, 2, tempSkinTable['ears_1'], tempSkinTable['ears_2'], 2)
	end

	SetPedComponentVariation(myPed, 8, tempSkinTable['tshirt_1'], tempSkinTable['tshirt_2'], 2)
	SetPedComponentVariation(myPed, 11, tempSkinTable['torso_1'], tempSkinTable['torso_2'], 2)
	SetPedComponentVariation(myPed, 3, tempSkinTable['arms'], tempSkinTable['arms_2'], 2)
	SetPedComponentVariation(myPed, 10, tempSkinTable['decals_1'], tempSkinTable['decals_2'], 2)
	SetPedComponentVariation(myPed, 4, tempSkinTable['pants_1'], tempSkinTable['pants_2'], 2)
	SetPedComponentVariation(myPed, 6, tempSkinTable['shoes_1'], tempSkinTable['shoes_2'], 2)
	SetPedComponentVariation(myPed, 1, tempSkinTable['mask_1'], tempSkinTable['mask_2'], 2)
	SetPedComponentVariation(myPed, 9, tempSkinTable['bproof_1'], tempSkinTable['bproof_2'], 2)
	SetPedComponentVariation(myPed, 7, tempSkinTable['chain_1'], tempSkinTable['chain_2'], 2)
	SetPedComponentVariation(myPed, 5, tempSkinTable['bags_1'], tempSkinTable['bags_2'], 2)

	if tempSkinTable['helmet_1'] == -1 then
		ClearPedProp(myPed, 0)
	else
		SetPedPropIndex(myPed, 0, tempSkinTable['helmet_1'], tempSkinTable['helmet_2'], 2)
	end

	if tempSkinTable['glasses_1'] == -1 then
		ClearPedProp(myPed, 1)
	else
		SetPedPropIndex(myPed, 1, tempSkinTable['glasses_1'], tempSkinTable['glasses_2'], 2)
	end

	if tempSkinTable['watches_1'] == -1 then
		ClearPedProp(myPed, 6)
	else
		SetPedPropIndex(myPed, 6, tempSkinTable['watches_1'], tempSkinTable['watches_2'], 2)
	end

	if tempSkinTable['bracelets_1'] == -1 then
		ClearPedProp(myPed,	7)
	else
		SetPedPropIndex(myPed, 7, tempSkinTable['bracelets_1'], tempSkinTable['bracelets_2'], 2)
	end
end