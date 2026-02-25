function onCreate()
    makeLuaSprite('A', 'bg', 50, -450);
    scaleObject('A', 1.6, 1.6);
    setScrollFactor('A', 1, 1);
    addLuaSprite('A', false);

	makeAnimatedLuaSprite('gb1', 'gb1', 50, -450);
	scaleObject('gb1', 1.6, 1.6);
	addAnimationByPrefix('gb1', 'idle', 'idle', 24, true)
	setProperty('gb1.alpha', 0);
	addLuaSprite('gb1', false)

    makeLuaSprite('logo', 'logo', 0, 0);
    scaleObject('logo', 1, 1);
    setProperty('logo.visible', false);
    setObjectCamera('logo', 'hud');
    addLuaSprite('logo', true);

    makeLuaSprite('BAISE','BAISE' , 50, -450);  
    setProperty('BAISE.visible', false);
    setScrollFactor('BAISE', 1, 1);
    scaleObject('BAISE', 1.6, 1.6);
    setObjectCamera('BAISE', 'game');                
    setProperty('BAISE.color', 0XF100DA);
    setProperty('BAISE.alpha', 0);             
    addLuaSprite('BAISE', false);     
    
    makeLuaSprite('X','BAISE' , 50, -450);  
    setProperty('X.visible', false);
    setScrollFactor('X', 1, 1);
    scaleObject('X', 1.6, 1.6);
    setObjectCamera('X', 'game');                
    setProperty('X.color', 0X8A01F1);
    setProperty('X.alpha', 0);
    addLuaSprite('X', false); 

    makeLuaSprite('purple', 'purple1', 50, -450);
    scaleObject('purple', 1.6, 1.6);
    setScrollFactor('purple', 1, 1);
	setProperty('purple.alpha', 0);
    addLuaSprite('purple', false);

    makeLuaSprite('blackOverlay', nil, 0, 0); 
	makeGraphic('blackOverlay', 1280*2, 720*2, '000000');    
    setScrollFactor('blackOverlay', 1, 1);
    scaleObject('blackOverlay', 1, 1);
    setObjectCamera('blackOverlay', 'hud');                
    setProperty('blackOverlay.visible', false);
    addLuaSprite('blackOverlay', true);                   

    makeLuaSprite('Q_img', 'Q', 245, 255);                     
    makeLuaSprite('E_img', 'E', 600, 265);                      
    makeLuaSprite('D_img', 'D', 850, 290);                   
    scaleObject('Q_img', 1, 1);
    scaleObject('E_img', 1, 1);
    scaleObject('D_img', 1, 1);
    setObjectCamera('Q_img', 'hud');
    setObjectCamera('E_img', 'hud');
    setObjectCamera('D_img', 'hud');
    setProperty('Q_img.visible', false);
    setProperty('E_img.visible', false);
    setProperty('D_img.visible', false);
    addLuaSprite('Q_img', true);
    addLuaSprite('E_img', true);
    addLuaSprite('D_img', true);
end

function onStepHit()
    if curStep == 272 then
        showLogoFromBottom()
    elseif curStep == 388 then
        fadeOutLogo()
    end
    if curStep == 656 then
        setProperty('BAISE.visible', true);
        setProperty('BAISE.alpha', 0);
        doTweenAlpha('BAISELayerAppear', 'BAISE', 1, 0.8, 'sineInOut');
        setProperty('X.visible', true);
        setProperty('X.alpha', 0);
		doTweenAlpha('BAISELayerChange', 'X', 1, 5, 'sineInOut');
    end
    if curStep == 766 then
        setProperty('blackOverlay.visible', true);
        setProperty('blackOverlay.alpha', 0);
        doTweenAlpha('blackAppear', 'blackOverlay', 1, 0.6, 'sineInOut');
    end
    if curStep == 771 then
        setProperty('Q_img.visible', true);
        setProperty('Q_img.alpha', 1);
    end
    if curStep == 774 then
        setProperty('E_img.visible', true);
        setProperty('E_img.alpha', 1);
    end
    if curStep == 777 then
        setProperty('D_img.visible', true);
        setProperty('D_img.alpha', 1);
    end
    if curStep == 784 then
        doTweenAlpha('BAISEFadeOut', 'BAISE', 0, 0.6, 'linear');
        doTweenAlpha('blackFadeOut', 'blackOverlay', 0, 0.6, 'linear');
        doTweenAlpha('BAISELayerChange', 'X', 0, 0.6, 'linear');
		setProperty('Q_img.alpha', 0);
		setProperty('E_img.alpha', 0);
		setProperty('D_img.alpha', 0);
		setProperty('gb1.alpha', 1);
    end
	if curStep == 856 then
	    doTweenAlpha('gb1Appear', 'gb1', 0, 5, 'linear');
	end
     if curStep == 1168 then
        setProperty('BAISE.visible', true);
        setProperty('BAISE.alpha', 0);
        doTweenAlpha('BAISELayerAppear', 'BAISE', 1, 0.8, 'sineInOut');
        setProperty('X.visible', true);
        setProperty('X.alpha', 0);
		doTweenAlpha('BAISELayerChange', 'X', 1, 5, 'sineInOut');
    end
    if curStep == 1268 then
        setProperty('blackOverlay.visible', true);
        setProperty('blackOverlay.alpha', 0);
        doTweenAlpha('blackAppear', 'blackOverlay', 1, 0.6, 'sineInOut');
    end
    if curStep == 1280 then
        setProperty('Q_img.visible', true);
        setProperty('Q_img.alpha', 1);
    end
    if curStep == 1281 then
        setProperty('E_img.visible', true);
        setProperty('E_img.alpha', 1);
    end
    if curStep == 1285 then
        setProperty('D_img.visible', true);
        setProperty('D_img.alpha', 1);
    end
    if curStep == 1296 then
        doTweenAlpha('BAISEFadeOut', 'BAISE', 0, 0.6, 'linear');
        doTweenAlpha('blackFadeOut', 'blackOverlay', 0, 0.6, 'linear');
        doTweenAlpha('BAISELayerChange', 'X', 0, 0.6, 'linear');
		setProperty('Q_img.alpha', 0);
		setProperty('E_img.alpha', 0);
		setProperty('D_img.alpha', 0);
		setProperty('gb1.alpha', 1);
    end
	if curStep == 1552 then
	    doTweenAlpha('gb1Appear', 'gb1', 0, 5, 'linear');
	end
    if curStep == 1936 then
        setProperty('BAISE.visible', true);
        setProperty('BAISE.alpha', 0);
        doTweenAlpha('BAISELayerAppear', 'BAISE', 1, 0.8, 'sineInOut');
        setProperty('X.visible', true);
        setProperty('X.alpha', 0);
		doTweenAlpha('BAISELayerChange', 'X', 1, 5, 'sineInOut');
    end
    if curStep == 2043 then
        setProperty('blackOverlay.visible', true);
        setProperty('blackOverlay.alpha', 0);
        doTweenAlpha('blackAppear', 'blackOverlay', 1, 0.6, 'sineInOut');
    end
    if curStep == 2048 then
        setProperty('Q_img.visible', true);
        setProperty('Q_img.alpha', 1);
    end
    if curStep == 2054 then
        setProperty('E_img.visible', true);
        setProperty('E_img.alpha', 1);
    end
    if curStep == 2054 or curStep == 2057 or curStep == 2060 or curStep == 2063 or curStep == 2066 or curStep == 2069 or curStep == 2072 then
        setProperty('D_img.visible', true);
        setProperty('D_img.alpha', 1);  
    end
    if curStep == 2056 or curStep == 2058 or curStep == 2061 or curStep == 2064 or curStep == 2067 or curStep == 2070 or curStep == 2073 then
        setProperty('D_img.alpha', 0);
    end
    if curStep == 2075 then
        doTweenAlpha('BAISEFadeOut', 'BAISE', 0, 0.6, 'linear');
        doTweenAlpha('blackFadeOut', 'blackOverlay', 0, 0.6, 'linear');
        doTweenAlpha('BAISELayerChange', 'X', 0, 0.6, 'linear');
		setProperty('Q_img.alpha', 0);
		setProperty('E_img.alpha', 0);
		setProperty('D_img.alpha', 0);
		setProperty('gb1.alpha', 1);
    end
	if curStep == 2326 then
	    doTweenAlpha('gb1Appear', 'gb1', 0, 5, 'linear');
	end
       if curStep == 2464 then
        setProperty('blackOverlay.visible', true);
        setProperty('blackOverlay.alpha', 0);
        doTweenAlpha('blackAppear', 'blackOverlay', 1, 0.6, 'sineInOut');
    end
end

function showLogoFromBottom()
    local logoWidth = getProperty('logo.width') * getProperty('logo.scale.x');
    local logoHeight = getProperty('logo.height') * getProperty('logo.scale.y');
    local targetX = (screenWidth - logoWidth) / 2;
    local targetY = (screenHeight - logoHeight) / 2;
    local startY = screenHeight + logoHeight;
    setProperty('logo.x', targetX);
    setProperty('logo.y', startY);
    setProperty('logo.visible', true);
    doTweenY('logoMoveUp', 'logo', targetY, 1, 'sineOut');
end

function fadeOutLogo()
    doTweenAlpha('logoFadeOut', 'logo', 0, 1, 'linear');
    runTimer('hideLogoAfterFade', 1.1);
end

function onTimerCompleted(tag)
    if tag == 'hideLogoAfterFade' then
        setProperty('logo.visible', false);
        setProperty('logo.alpha', 1);
    end
end

function onTweenCompleted(tag)
    if tag == 'purpleFadeOut' then
        setProperty('purpleLayer.visible', false);
        setProperty('purpleLayer.alpha', 1);
    elseif tag == 'blackFadeOut' then
        setProperty('blackOverlay.visible', false);
        setProperty('blackOverlay.alpha', 1);
    elseif tag == 'QFadeOut' then
        setProperty('Q_img.visible', false);
        setProperty('Q_img.alpha', 1);
    elseif tag == 'EFadeOut' then
        setProperty('E_img.visible', false);
        setProperty('E_img.alpha', 1);
    elseif tag == 'DFadeOut' then
        setProperty('D_img.visible', false);
        setProperty('D_img.alpha', 1);
    end
end
