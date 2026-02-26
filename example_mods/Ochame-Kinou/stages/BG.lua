function onCreate()
	luaDebugMode=true
	--[[
	createInstance("BG","flixel.addons.display.FlxBackdrop",{
		callMethodFromClass("backend.Paths","image",{"BG/BG"})
	})
	addInstance("BG",false)]]
	runHaxeCode([[
		import flixel.addons.display.FlxBackdrop;

		var BG = new FlxBackdrop(Paths.image("BG/BG"),0x11,0,-130);
		BG.scale.set(2,2);
		BG.scrollFactor.set(0,0);
		BG.velocity.x = -160;
		game.addBehindGF(BG);
		setVar("BG",BG)
	]])

end