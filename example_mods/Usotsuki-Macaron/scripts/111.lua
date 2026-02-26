

function onCreate()
    if getProperty('timeBarBG') ~= nil then
        setProperty('timeBarBG.visible', false)
    end
    if getProperty('timeBar') ~= nil then
        setProperty('timeBar.visible', false)
    end
    if getProperty('timeTxt') ~= nil then
        setProperty('timeTxt.visible', false)
    end
end