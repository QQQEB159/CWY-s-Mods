local blackOverlay = nil

function onCreate()
    makeLuaSprite('blackOverlay', '', 0, 0)
    makeGraphic('blackOverlay', screenWidth, screenHeight, '000000')
    setProperty('blackOverlay.alpha', 0)
    setObjectOrder('blackOverlay', 9999)  
    addLuaSprite('blackOverlay', true)
    setObjectCamera('blackOverlay', 'hud')
end

function onStepHit()
    if curStep == 2460 then
        setProperty('blackOverlay.alpha', 1)
    end
end
function onDestroy()
    if getProperty('blackOverlay') then
        removeLuaSprite('blackOverlay', true)
    end
end