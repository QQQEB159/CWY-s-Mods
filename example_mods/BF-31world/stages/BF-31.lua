function onCreate()
    makeAnimatedLuaSprite('3', '3', -700, 250)
    addAnimationByPrefix('3', '3', 'idle', 15, true)
	addLuaSprite('3', false)
    scaleObject('3', 0.8, 0.8)
end