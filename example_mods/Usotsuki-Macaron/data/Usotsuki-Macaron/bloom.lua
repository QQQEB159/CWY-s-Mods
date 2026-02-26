function onCreatePost()
 
	initLuaShader("bloom")

	if shadersEnabled == true then
		makeLuaSprite("shaderImage")
		makeGraphic("shaderImage", screenWidth, screenHeight)
	end
	
	setSpriteShader("shaderImage", "bloom")

    addHaxeLibrary("ShaderFilter", "openfl.filters")
	runHaxeCode([[
	trace(ShaderFilter);
	game.camGame.filters = [new ShaderFilter(game.getLuaObject("shaderImage").shader)];
	game.camHUD.filters = [new ShaderFilter(game.getLuaObject("shaderImage").shader)];
	]])
end

function onUpdate()
    setShaderFloat("shaderImage", "iTime", os.clock())
end

--[[
    if you use crt, monitor remove game.camHUD

]]