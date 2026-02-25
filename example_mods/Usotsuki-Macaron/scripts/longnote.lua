animSuffixbf=nil
animSuffixgf=nil
animSuffixdad=nil
changeanim=false
local ShowSplash=false
local holdfolders = "Ui update/holdCover"
local notedatas = {"Purple","Blue","Green","Red"};
function onCreatePost()
    for i = 0,getProperty('unspawnNotes.length')-1 do
	    if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
		    setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
            setPropertyFromGroup('unspawnNotes', i, 'noMissAnimation', true)
		end
	end
    isPixel6 = getPropertyFromClass('PlayState', 'isPixelStage')
    isPixel7 = getPropertyFromClass('states.PlayState', 'isPixelStage')
    if not isPixel6 or not isPixel7 then 
        ShowSplash=true
    end
    for i = 1,#holdfolders do
        makeAnimatedLuaSprite("holdCoverEnd"..notedatas[i], holdfolders..notedatas[i], -2000,-2000)
        addLuaSprite("holdCoverEnd"..notedatas[i], true)
        setObjectCamera("holdCoverEnd"..notedatas[i], 'camHUD')
        addAnimationByPrefix("holdCoverEnd"..notedatas[i], "holdend", "holdCoverEnd"..notedatas[i], 24, false)
        playAnim("holdCoverEnd"..notedatas[i], "holdend", true);
    end
end
local holdofsets = {
    hold = {x=-110,y=-93},
    holdend = {x=-110,y=-93}
};
local visiblehold = {false,false,false,false}
local oppovisiblehold = {false,false,false,false}
local presskey = {"left","down","up","right"}
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if isSustainNote then
        if string.find(getPropertyFromGroup('notes', id, 'animation.curAnim.name'):lower(), 'end') then
            if getPropertyFromGroup('notes', id, 'gfNote') and animSuffixgf==nil then
                changeanim=true
                triggerEvent('Alt Idle Animation','gf','')
            elseif getPropertyFromGroup('notes', id, 'gfNote') then
                changeanim=true
                triggerEvent('Alt Idle Animation','gf',animSuffixgf)
            end
            if animSuffixbf==nil then
                changeanim=true
                triggerEvent('Alt Idle Animation','bf','')
            else
                changeanim=true
                triggerEvent('Alt Idle Animation','bf',animSuffixbf)
            end
            if not getProperty('cpuControlled') then
                runHaxeCode([[
		            var strum = game.playerStrums.members[]]..noteData..[[];
		            if (strum != null) {
		            	strum.playAnim('pressed', true);
		            	strum.resetAnim = 0;
		            }
                ]]);
            else
                runHaxeCode([[
		            var strum = game.playerStrums.members[]]..noteData..[[];
		            if (strum != null) {
			            strum.playAnim('static', true);
			            strum.resetAnim = 0;
		            }
                ]]);
            end
        else
            if getPropertyFromGroup('notes', id, 'gfNote') then
                triggerEvent('Alt Idle Animation','gf','我屑屑泥，c')
            else
                triggerEvent('Alt Idle Animation','bf','我屑屑泥，c')
            end
        end
    end
    if isSustainNote and ShowSplash then
        --triggerEvent('Play Animation',0,'sing'.. directions[noteData + 1] .. '-sus')
        
        --runTimer('dad animations', crochet/1000, 1)
        --dadanim = directions[noteData + 1];
        local ofsets = {
            x = getPropertyFromGroup('playerStrums',noteData,'x'),
            y = getPropertyFromGroup('playerStrums',noteData,'y'),
        };
        --debugPrint(ofsets.x+holdofsets.hold.x.."aaaaaa"..ofsets.y+holdofsets.hold.y+300)
        if string.find(getPropertyFromGroup('notes', id, 'animation.curAnim.name'):lower(), 'end') and isSustainNote then
            --debugPrint('sus-end')
            --characterPlayAnim('dad', 'sing'.. directions[noteData + 1] .. '-sus-end', true)
            visiblehold[noteData+1] = false;
            setProperty("holdCover"..notedatas[noteData+1]..".visible", false)

            makeAnimatedLuaSprite("holdCoverEnd"..notedatas[noteData+1], holdfolders..notedatas[noteData+1], ofsets.x+holdofsets.holdend.x, ofsets.y+holdofsets.holdend.y)
            addLuaSprite("holdCoverEnd"..notedatas[noteData+1], true)
            setObjectCamera("holdCoverEnd"..notedatas[noteData+1], 'camHUD')
            addAnimationByPrefix("holdCoverEnd"..notedatas[noteData+1], "holdend", "holdCoverEnd"..notedatas[noteData+1], 24, false)
            playAnim("holdCoverEnd"..notedatas[noteData+1], "holdend", true);

            setProperty("holdCoverEnd"..notedatas[noteData+1]..".visible", true)

            setPropertyFromGroup('notes', id, 'visible',false)
        else
            --debugPrint('sus')
            --characterPlayAnim('dad', 'sing'.. directions[noteData + 1] .. '-sus', true)
            if visiblehold[noteData+1] == false then
                visiblehold[noteData+1] = true;
                makeAnimatedLuaSprite("holdCover"..notedatas[noteData+1], holdfolders..notedatas[noteData+1], ofsets.x+holdofsets.hold.x, ofsets.y+holdofsets.hold.y)
                setObjectCamera("holdCover"..notedatas[noteData+1], 'camHUD')
                addLuaSprite("holdCover"..notedatas[noteData+1], true)
                addAnimationByPrefix("holdCover"..notedatas[noteData+1], "hold", "holdCover"..notedatas[noteData+1], 24, true)
                playAnim("holdCover"..notedatas[noteData+1], "hold", true);
                
                setProperty("holdCover"..notedatas[noteData+1]..".visible", true)
            end
        end
    end
end
function noteMiss(id, noteData, noteType, isSustainNote)
    if isSustainNote then
        if string.find(getPropertyFromGroup('notes', id, 'animation.curAnim.name'):lower(), 'end') then
            if getPropertyFromGroup('notes', id, 'gfNote') and animSuffixgf==nil then
                changeanim=true
                triggerEvent('Alt Idle Animation','gf','')
            elseif getPropertyFromGroup('notes', id, 'gfNote') then
                changeanim=true
                triggerEvent('Alt Idle Animation','gf',animSuffixgf)
            end
            if animSuffixbf==nil then
                changeanim=true
                triggerEvent('Alt Idle Animation','bf','')
            else
                changeanim=true
                triggerEvent('Alt Idle Animation','bf',animSuffixbf)
            end
        else
            if getPropertyFromGroup('notes', id, 'gfNote') then
                triggerEvent('Alt Idle Animation','gf','我屑屑泥，c')
            else
                triggerEvent('Alt Idle Animation','bf','我屑屑泥，c')
            end
        end
    end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if isSustainNote then
        if string.find(getPropertyFromGroup('notes', id, 'animation.curAnim.name'):lower(), 'end') then
            if getPropertyFromGroup('notes', id, 'gfNote') and animSuffixgf==nil then
                changeanim=true
                triggerEvent('Alt Idle Animation','gf','')
            elseif getPropertyFromGroup('notes', id, 'gfNote') then
                changeanim=true
                triggerEvent('Alt Idle Animation','gf',animSuffixgf)
            end
            if animSuffixdad==nil then
                changeanim=true
               triggerEvent('Alt Idle Animation','dad','')
            else
                changeanim=true
                triggerEvent('Alt Idle Animation','dad',animSuffixdad)
            end
            runHaxeCode([[
		        var strum = game.opponentStrums.members[]]..noteData..[[];
		        if (strum != null) {
			        strum.playAnim('static', true);
			        strum.resetAnim = 0;
		        }
            ]]);
        else
            if getPropertyFromGroup('notes', id, 'gfNote') then
                triggerEvent('Alt Idle Animation','gf','我屑屑泥，c')
            else
                triggerEvent('Alt Idle Animation','dad','我屑屑泥，c')
            end
        end
    end
    if isSustainNote and ShowSplash then
        --triggerEvent('Play Animation',0,'sing'.. directions[noteData + 1] .. '-sus')
        
        --runTimer('dad animations', crochet/1000, 1)
        --dadanim = directions[noteData + 1];
        local ofsets = {
            x = getPropertyFromGroup('opponentStrums',noteData,'x'),
            y = getPropertyFromGroup('opponentStrums',noteData,'y'),
        };
        --debugPrint(ofsets.x+holdofsets.hold.x.."aaaaaa"..ofsets.y+holdofsets.hold.y+300)
        if string.find(getPropertyFromGroup('notes', id, 'animation.curAnim.name'):lower(), 'end') and isSustainNote then
            --debugPrint('sus-end')
            --characterPlayAnim('dad', 'sing'.. directions[noteData + 1] .. '-sus-end', true)
            oppovisiblehold[noteData+1] = false;
            setProperty("OppoholdCover"..notedatas[noteData+1]..".visible", false)

            setPropertyFromGroup('notes', id, 'visible',false)
        else
            --debugPrint('sus')
            --characterPlayAnim('dad', 'sing'.. directions[noteData + 1] .. '-sus', true)
            if oppovisiblehold[noteData+1] == false then
                oppovisiblehold[noteData+1] = true;
                makeAnimatedLuaSprite("OppoholdCover"..notedatas[noteData+1], holdfolders..notedatas[noteData+1], ofsets.x+holdofsets.hold.x, ofsets.y+holdofsets.hold.y)
                setObjectCamera("OppoholdCover"..notedatas[noteData+1], 'camHUD')
                addLuaSprite("OppoholdCover"..notedatas[noteData+1], true)
                addAnimationByPrefix("OppoholdCover"..notedatas[noteData+1], "hold", "holdCover"..notedatas[noteData+1], 24, true)
                playAnim("OppoholdCover"..notedatas[noteData+1], "hold", true);
                
                setProperty("OppoholdCover"..notedatas[noteData+1]..".visible", true)
            end
        end
    end
end
function onUpdatePost(elapsed)
    local aaa=0
    for i = 0, getProperty('notes.length')-1 do
        if aaa>3 then
            aaa=0
        end
        if getPropertyFromGroup('notes', i, 'isSustainNote') then
            if getPropertyFromGroup('notes', i, 'mustPress') then
                setPropertyFromGroup('notes', i, 'alpha', getPropertyFromGroup('playerStrums', aaa, 'alpha'))
            else
                setPropertyFromGroup('notes', i, 'alpha', getPropertyFromGroup('opponentStrums', aaa, 'alpha'))
            end
            if ShowSplash then
                setProperty("holdCover"..notedatas[aaa+1]..".alpha", getPropertyFromGroup('playerStrums', aaa, 'alpha'))
                setProperty("OppoholdCover"..notedatas[aaa+1]..".alpha", getPropertyFromGroup('opponentStrums', aaa, 'alpha'))
            end
        end
        aaa=aaa+1
    end
    for i = 1,#presskey do
        if keyReleased(presskey[i]) then
            visiblehold[i] = false;
            setProperty("holdCover"..notedatas[i]..".visible", false)

            
        end
    end
    for i = 1,4 do
        --debugPrint(getProperty("holdCoverEnd"..notedatas[i]..".animation.curAnim.paused"))
        if getProperty("holdCoverEnd"..notedatas[i]..'.animation.curAnim.finished') then
            setProperty("holdCoverEnd"..notedatas[i]..".visible", false)
        end
    end
end
function onEvent(name,value1,value2)
    if name=='Alt Idle Animation' and changeanim then
        if value1 == "bf" or value1 == "Bf" or value1 == "bF" or value1 == "BF" or value1 == "0" then
            animSuffixbf=value2
        end
        if value1 == "dad" or value1 == "Dad" or value1 == "dAd" or value1 == "daD" or value1 == "DAd" or value1 == "DaD" or value1 == "dAD" or value1 == "DAD" or value1 == "1" then
            animSuffixdad=value2
        end
        if value1 == "gf" or value1 == "Gf" or value1 == "gF" or value1 == "GF" or value1 == "2" then
            animSuffixgf=value2
        end
        changeanim=false
    end
end