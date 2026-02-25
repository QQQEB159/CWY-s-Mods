local config = {
	scaleMultiplier = 0.8,

	baseScale = 0.45,

	offsetP1 = {x = -25, y = -15},
	offsetP2 = {x = 10, y = 30},

	healthLow = 0.4,
	healthHigh = 1.6,

	flipP1 = true,
	flipP2 = false,

	hideOriginalIcons = true,

	useUIGroup = true,

	customOrder = -1,
}
local animP1 = 'normal'
local lastAnimP1 = 'normal'
local iconP2A = 'iconP2A'
local lastP2Frame = 0

function onCreate()
	makeLuaSprite(iconP2A, 'icons/icon-teto', getProperty('iconP2.x'), getProperty('iconP2.y'));
	local fullWidth = getProperty(iconP2A .. '.width')
	if fullWidth > 0 then
		loadGraphic(iconP2A, 'icons/icon-teto', fullWidth / 2, getProperty(iconP2A .. '.height'));
	else
		loadGraphic(iconP2A, 'icons/icon-teto', 0, 0);
	end
	addAnimation(iconP2A, 'static', {0, 1}, 0, false);
	playAnim(iconP2A, 'static', false);
	setProperty(iconP2A .. '.animation.curAnim.curFrame', 0);
	scaleObject(iconP2A, config.baseScale, config.baseScale);
	setObjectCamera(iconP2A, 'hud');
	addLuaSprite(iconP2A, false);
	if config.useUIGroup then
		addToGroup('uiGroup', iconP2A);
	end
	setProperty(iconP2A .. '.flipX', config.flipP2);

	makeAnimatedLuaSprite('iconP1A', 'icons/icon-bucksGF', getProperty('iconP1.x'), getProperty('iconP1.y'));
	addAnimationByPrefix('iconP1A', 'normal', 'idle', 24, true);
	addAnimationByPrefix('iconP1A', 'losing', 'losing', 24, true);
	playAnim('iconP1A', animP1);
	scaleObject('iconP1A', config.baseScale, config.baseScale);
	setObjectCamera('iconP1A', 'hud');
	addLuaSprite('iconP1A', false);
	if config.useUIGroup then
		addToGroup('uiGroup', 'iconP1A');
	end
	setProperty('iconP1A.flipX', config.flipP1);
end

function onCreatePost()
	if config.hideOriginalIcons then
		setProperty('iconP1.visible', false);
		setProperty('iconP2.visible', false);
	end

	if config.useUIGroup then
		local uiOrder = getObjectOrder('uiGroup')
		setObjectOrder('iconP1A', uiOrder + 1);
		setObjectOrder(iconP2A, uiOrder + 1);
	elseif config.customOrder >= 0 then
		setObjectOrder('iconP1A', config.customOrder);
		setObjectOrder(iconP2A, config.customOrder);
	end

	if getProperty(iconP2A .. '.width') == 0 then
		runTimer('reloadP2Graphic', 0.1, 1);
	end
end

function onTimerCompleted(tag)
	if tag == 'reloadP2Graphic' then
		local fullWidth = getProperty(iconP2A .. '.width')
		if fullWidth > 0 then
			loadGraphic(iconP2A, 'icons/icon-teto', fullWidth / 2, getProperty(iconP2A .. '.height'));
		end
	end
end

function onUpdatePost(elapsed)
	local p1Scale = getProperty('iconP1.scale.x') * config.scaleMultiplier
	setProperty('iconP1A.x', getProperty('iconP1.x') - config.offsetP1.x);
	setProperty('iconP1A.y', getProperty('iconP1.y') - config.offsetP1.y);
	setProperty('iconP1A.scale.x', p1Scale);
	setProperty('iconP1A.scale.y', p1Scale);
	
	setProperty('iconP1.visible', false);
	setProperty('iconP2.visible', false);

	local p2Scale = getProperty('iconP2.scale.x') * config.scaleMultiplier
	setProperty(iconP2A .. '.x', getProperty('iconP2.x') + config.offsetP2.x);
	setProperty(iconP2A .. '.y', getProperty('iconP2.y') + config.offsetP2.y);
	setProperty(iconP2A .. '.scale.x', p2Scale);
	setProperty(iconP2A .. '.scale.y', p2Scale);

	local health = getProperty('health')
	local targetP1Anim = 'normal'
	local targetP2Frame = 0

	if health < config.healthLow then
		targetP1Anim = 'losing'
		targetP2Frame = 1
	elseif health > config.healthHigh then
		targetP1Anim = 'normal'
		targetP2Frame = 1
	else
		targetP1Anim = 'normal'
		targetP2Frame = 0
	end

	if targetP1Anim ~= lastAnimP1 then
		playAnim('iconP1A', targetP1Anim);
		lastAnimP1 = targetP1Anim
	end

	if targetP2Frame ~= lastP2Frame then
		setProperty(iconP2A .. '.animation.curAnim.curFrame', targetP2Frame);
		lastP2Frame = targetP2Frame
	end
end