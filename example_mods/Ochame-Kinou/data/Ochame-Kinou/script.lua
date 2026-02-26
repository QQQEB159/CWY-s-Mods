function onCreate()
	makeLuaSprite('border', 'tvborder', 0, 0);
	setScrollFactor('border', 0, 0);
	scaleObject('border', 2, 2);
	addLuaSprite('border', false);
	setProperty('border.alpha', 1);
	setObjectCamera('border', 'other');
	screenCenter('border'); 
	setProperty('border.scale.x', 1);
	setProperty('border.scale.y', 1);
	setProperty('border.x', -640);
	setProperty('border.y', -360);

end

function onCreatePost()
	for i = 0, 3 do
		local curX = getPropertyFromGroup('playerStrums', i, 'x');
		setPropertyFromGroup('playerStrums', i, 'x', curX - 75);
	end
	for i = 0, 3 do
		local curX = getPropertyFromGroup('opponentStrums', i, 'x');
		setPropertyFromGroup('opponentStrums', i, 'x', curX + 75);
	end
	setProperty("dad.alpha", 0.01)
	setProperty("boyfriend.alpha", 0.01)
end

function onEvent(e, v1, v2)
	if e == "" then
		if v1=="set zoom" then
			setProperty("camGame.zoom", v2)
		elseif v1=="Cinematics" then
			--debugPrint(v2)
		--elseif v1=="set zoom" then
			--setProperty("camGame.zoom", v2)
		--else
		end
	end
end
function onStepHit()
	if curStep==48 then
		setProperty("dad.alpha", 1)
		setProperty("boyfriend.alpha", 1)
	elseif curStep==192 then
		setProperty("dad.alpha", 0.01)
		setProperty("boyfriend.alpha", 0.01)
		setProperty("camGame.alpha", 0.01)
		setProperty("camHUD.alpha", 0)
		setProperty("comboGroup.alpha", 0.01)
	elseif curStep==196 then
		setProperty("comboGroup.alpha", 1)
		setProperty("camGame.alpha", 1)
	elseif curStep==219 then
		setProperty("camGame.alpha", 1)
		setProperty('defaultCamZoom', 1);
		setProperty("dad.alpha", 1)
		setProperty("boyfriend.alpha", 1)
	elseif curStep==224 then
		doTweenAlpha("camH", "camHUD", 1, 1,"linear")
	elseif curStep==288 then
		setProperty('defaultCamZoom', 0.8);
	end
end