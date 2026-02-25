local bSprites = {}
local bSpeeds = {}  
local function getScreenWidth()
    return getPropertyFromClass('flixel.FlxG', 'width')
end

local function getScreenHeight()
    return getPropertyFromClass('flixel.FlxG', 'height')
end

function onCreate()
    makeLuaSprite('A', 'purple', -550, -250)
    scaleObject('A', 2, 2)
    setScrollFactor('A', 1, 1)
    addLuaSprite('A', false)

    local screenWidth = getScreenWidth()
    local screenHeight = getScreenHeight()
    local count = math.random(10, 20)
    for i = 1, count do
        local spriteName = 'B_' .. i
        local imageName = 'B'
        makeLuaSprite(spriteName, imageName, 0, 0) 
        setProperty('B_' .. i .. '.alpha', 0)
        doTweenAlpha('B_' .. i, 'B_' .. i, 1, 0.1)
        if getProperty(spriteName .. '.width') == 0 then
            makeLuaSprite(spriteName, 'boyfriend', 0, 0)
        end
        local scale = 1
        scaleObject(spriteName, scale, scale)
        setProperty(spriteName .. '.angle', 0)
        local w = getProperty(spriteName .. '.width')
        local h = getProperty(spriteName .. '.height')
        local startX = math.random(0, screenWidth - w)
        local startY = screenHeight + math.random(0, 900) 
        setProperty(spriteName .. '.x', startX)
        setProperty(spriteName .. '.y', startY)
        addLuaSprite(spriteName, false)
        local speed = math.random(50, 200)
        bSpeeds[i] = speed
        bSprites[i] = spriteName
    end
    local numY = screenHeight / 15 
    for i = 1, 5 do
        local numName = 'num' .. i
        local imageName = tostring(i)  
        makeLuaSprite(numName, imageName, -500, numY)  
        if getProperty(numName .. '.width') == 0 then
            makeLuaSprite(numName, 'boyfriend', -500, numY)
        end
        scaleObject(numName, 1.2, 1.2) 
        setProperty(numName .. '.alpha', 0)  
        addLuaSprite(numName, false)
    end
end
function onUpdate(elapsed)
    local screenWidth = getScreenWidth()
    local screenHeight = getScreenHeight()

    for i, spriteName in ipairs(bSprites) do
        local speed = bSpeeds[i]
        local x = getProperty(spriteName .. '.x')
        local y = getProperty(spriteName .. '.y')
        local w = getProperty(spriteName .. '.width')
        local h = getProperty(spriteName .. '.height')
        y = y - speed * elapsed
        setProperty(spriteName .. '.y', y)
        if y + h < 0 then
            local newX = math.random(0, screenWidth - w)
            local newY = screenHeight + math.random(0, 200)
            setProperty(spriteName .. '.x', newX)
            setProperty(spriteName .. '.y', newY)
        end
    end
end
function onStepHit()
    local step = curStep 
    local screenWidth = getScreenWidth()
    local screenHeight = getScreenHeight()
    local function moveToCenter(numTag, stepNum)
        local num = 'num' .. numTag
        setProperty(num .. '.x', -500)
        setProperty(num .. '.alpha', 1)
        local targetX = screenWidth / 2 - getProperty(num .. '.width') / 2
        doTweenX('move' .. numTag, num, targetX, 0.5, 'linear')
    end
    local function fadeOut(numTag, stepNum)
        doTweenAlpha('fade' .. numTag, 'num' .. numTag, 0, 0.5, 'linear')
    end

    if step == 195 then
        moveToCenter(1, step)
    elseif step == 199 then
        fadeOut(1, step)
    elseif step == 201 then
        moveToCenter(2, step)
    elseif step == 204 then
        fadeOut(2, step)
    elseif step == 205 then
        moveToCenter(3, step)
    elseif step == 212 then
        fadeOut(3, step)
    elseif step == 213 then
        moveToCenter(4, step)
    elseif step == 220 then
        fadeOut(4, step)
    elseif step == 221 then
        moveToCenter(5, step)
    elseif step == 228 then
        fadeOut(5, step)

    elseif step == 260 then
        moveToCenter(1, step)
    elseif step == 264 then
        fadeOut(1, step)
        moveToCenter(2, step)
    elseif step == 268 then
        fadeOut(2, step)
        moveToCenter(3, step)
    elseif step == 276 then
        fadeOut(3, step)
        moveToCenter(4, step)
    elseif step == 284 then
        fadeOut(4, step)
        moveToCenter(5, step)
    elseif step == 291 then
        fadeOut(5, step)

    elseif step == 596 then
        moveToCenter(1, step)
    elseif step == 600 then
        fadeOut(1, step)
        moveToCenter(2, step)
    elseif step == 603 then
        fadeOut(2, step)
        moveToCenter(3, step)
    elseif step == 612 then
        fadeOut(3, step)
        moveToCenter(4, step)
    elseif step == 615 then
        fadeOut(4, step)
        moveToCenter(5, step)
    elseif step == 628 then
        fadeOut(5, step)

    elseif step == 660 then
        moveToCenter(1, step)
    elseif step == 663 then
        fadeOut(1, step)
        moveToCenter(2, step)
    elseif step == 668 then
        fadeOut(2, step)
        moveToCenter(3, step)
    elseif step == 676 then
        fadeOut(3, step)
        moveToCenter(4, step)
    elseif step == 680 then
        fadeOut(4, step)
        moveToCenter(5, step)
    elseif step == 692 then
        fadeOut(5, step)

    elseif step == 940 then
        moveToCenter(1, step)
    elseif step == 945 then
        fadeOut(1, step)
        moveToCenter(2, step)
    elseif step == 948 then
        fadeOut(2, step)
        moveToCenter(3, step)
    elseif step == 956 then
        fadeOut(3, step)
        moveToCenter(4, step)
    elseif step == 964 then
        fadeOut(4, step)
        moveToCenter(5, step)
    elseif step == 972 then
        fadeOut(5, step)

    elseif step == 1004 then
        moveToCenter(1, step)
    elseif step == 1008 then
        fadeOut(1, step)
        moveToCenter(2, step)
    elseif step == 1011 then
        fadeOut(2, step)
        moveToCenter(3, step)
    elseif step == 1019 then
        fadeOut(3, step)
        moveToCenter(4, step)
    elseif step == 1028 then
        fadeOut(4, step)
        moveToCenter(5, step)
    elseif step == 1036 then
        fadeOut(5, step)
    end
end