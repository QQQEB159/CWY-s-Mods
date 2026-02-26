animSuffixbf=nil
animSuffixgf=nil
animSuffixdad=nil
changeanim=false
function onCreatePost()
    for i = 0,getProperty('unspawnNotes.length')-1 do
	    if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
		    setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
            setPropertyFromGroup('unspawnNotes', i, 'noMissAnimation', true)
		end
	end
end
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
            runHaxeCode([[
		        var strum = game.playerStrums.members[]]..noteData..[[];
		        if (strum != null) {
		        	strum.playAnim('pressed', true);
		        	strum.resetAnim = 0;
		        }
            ]]);
        else
            if getPropertyFromGroup('notes', id, 'gfNote') then
                triggerEvent('Alt Idle Animation','gf','我屑屑泥，c')
            else
                triggerEvent('Alt Idle Animation','bf','我屑屑泥，c')
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
        else
            if getPropertyFromGroup('notes', id, 'gfNote') then
                triggerEvent('Alt Idle Animation','gf','我屑屑泥，c')
            else
                triggerEvent('Alt Idle Animation','dad','我屑屑泥，c')
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
        end
        aaa=aaa+1
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