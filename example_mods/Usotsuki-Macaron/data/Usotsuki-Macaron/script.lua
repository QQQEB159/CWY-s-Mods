local borderInitX, borderInitY

function onCreate()
	makeLuaSprite('border', 'tvborder', 0, 0);
	setScrollFactor('border', 0, 0);
	scaleObject('border', 2, 2);
	addLuaSprite('border', false);
	setProperty('border.alpha', 1);
	setObjectCamera('border', 'hud');
	screenCenter('border');

	borderInitX = getProperty('border.x')
	borderInitY = getProperty('border.y')

	makeLuaSprite('grey', '', -100, -100);
	makeGraphic('grey', 1280*2, 720*2, '271A36');
	setScrollFactor('grey', 0, 0);
	screenCenter('grey');
	addLuaSprite('grey', false);
	setObjectCamera('grey', 'hud');
	setProperty('grey.alpha', 0.0001);
end

function onStepHit()
	if curStep == 192 or curStep == 592 or curStep == 929 then
		setProperty('grey.alpha', 1);
	end

	if curStep == 195 or curStep == 595 or curStep == 940 then
		setProperty('grey.alpha', 0.0001);

		cancelTween('borderScaleX');
		cancelTween('borderScaleY');
		cancelTween('borderPosX');
		cancelTween('borderPosY');

		doTweenX('borderScaleX', 'border.scale', 2, 2, "quadOut");
		doTweenY('borderScaleY', 'border.scale', 2, 2, "quadOut");
		doTweenX('borderPosX', 'border', borderInitX, 2, "quadOut");
		doTweenY('borderPosY', 'border', borderInitY, 2, "quadOut");

		noteTweenX('bf', 4, defaultPlayerStrumX0, 1, "quadOut");
		noteTweenX('bf1', 5, defaultPlayerStrumX1, 1, "quadOut");
		noteTweenX('bf2', 6, defaultPlayerStrumX2, 1, "quadOut");
		noteTweenX('bf3', 7, defaultPlayerStrumX3, 1, "quadOut");
		noteTweenX('dad4', 0, defaultOpponentStrumX0, 1, "quadOut");
		noteTweenX('dad5', 1, defaultOpponentStrumX1, 1, "quadOut");
		noteTweenX('dad6', 2, defaultOpponentStrumX2, 1, "quadOut");
		noteTweenX('dad7', 3, defaultOpponentStrumX3, 1, "quadOut");
	end

	if curStep == 131 or curStep == 532 or curStep == 896 then
		cancelTween('borderScaleX');
		cancelTween('borderScaleY');
		cancelTween('borderPosX');
		cancelTween('borderPosY');

		doTweenX('borderScaleX', 'border.scale', 1, 2, "quadOut");
		doTweenY('borderScaleY', 'border.scale', 1, 2, "quadOut");
		doTweenX('borderPosX', 'border', -640, 2, "quadOut");
		doTweenY('borderPosY', 'border', -360, 2, "quadOut");

		noteTweenX('bf', 4, defaultPlayerStrumX0 - 75, 1, "quadOut");
		noteTweenX('bf1', 5, defaultPlayerStrumX1 - 75, 1, "quadOut");
		noteTweenX('bf2', 6, defaultPlayerStrumX2 - 75, 1, "quadOut");
		noteTweenX('bf3', 7, defaultPlayerStrumX3 - 75, 1, "quadOut");
		noteTweenX('dad4', 0, defaultOpponentStrumX0 + 75, 1, "quadOut");
		noteTweenX('dad5', 1, defaultOpponentStrumX1 + 75, 1, "quadOut");
		noteTweenX('dad6', 2, defaultOpponentStrumX2 + 75, 1, "quadOut");
		noteTweenX('dad7', 3, defaultOpponentStrumX3 + 75, 1, "quadOut");
	end
end