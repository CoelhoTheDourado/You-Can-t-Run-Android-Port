-- I'm so sorry about the messy code
local setDefault = false
local thing = 1

moveLeftBeats = {228}
moveDownBeats = {232, 238,  367}
moveUpBeats = {208, 234, 254}
moveRightBeats = {212, 230, 236, 239, 366}
moveToDefault = {215, 240, 256, 368}

moveLeftBeatsDad = {262, 272, 300, 366}
moveDownBeatsDad = {260, 268, 276, 288, 367}
moveUpBeatsDad = {270, 280, 296, 368}
moveRightBeatsDad = {259, 264, 282, 292, 304}
moveToDefaultDad = {307, 384}


function onSongStart()
    setDefaultStrumPos() -- The defaultStrumY variable is broken on start for now
end

function setDefaultStrumPos(target)
    if target == nil then
        target = 'among us'
    end
    if string.lower(target) ~= 'bf' then
        for i = 0,3 do
            _G['defaultOpponentStrumX'..i] = getPropertyFromGroup('opponentStrums', i, 'x')
            _G['defaultOpponentStrumY'..i] = getPropertyFromGroup('opponentStrums', i, 'y')
        end
    end
    if string.lower(target) ~= 'dad' then
        for i = 0,3 do
            _G['defaultPlayerStrumX'..i] = getPropertyFromGroup('playerStrums', i, 'x')
            _G['defaultPlayerStrumY'..i] = getPropertyFromGroup('playerStrums', i, 'y')
        end
    end 
end

function onBeatHit()
	if curBeat >= 139 and curBeat < 168 and curBeat % 4 == 0 then
		thing = thing * -1
		doTweenAngle('rotate', 'camHUD', thing * 10, crochet / 250, 'quartOut')
    elseif curBeat == 168 then
		doTweenAngle('rotate', 'camHUD', 0, crochet / 1000, 'quadOut') 
		for i = 0, 3 do 
            if middlescroll == false then
			    noteTweenX('changeDefault'..i, i+4, _G['defaultPlayerStrumX'..i] - 320, crochet / 1000, 'quartOut')
            end
			noteTweenAngle('spinStrum'..i, i+4, -360, crochet / 1000, 'quartOut')
            setPropertyFromGroup('opponentStrums', i, 'alpha', 0);
        end
    elseif (curBeat >= 135 and curBeat < 143) or (curBeat >= 143 and curBeat < 168) then
        thing = thing * -1
        for i = 0, 3 do 
            noteTweenX('movething'..i, i+4, _G['defaultPlayerStrumX'..i] + (20 * thing), crochet / 1000, 'quadOut')
        end
    elseif curBeat == 362 then 
        for i = 0, 3 do 
            if middlescroll == false then
                setPropertyFromGroup('opponentStrums', i, 'alpha', 1);
                noteTweenX('changeDefault'..i, i+4, _G['defaultPlayerStrumX'..i] + 320, crochet / 1000, 'quartOut')
            else 
                setPropertyFromGroup('opponentStrums', i, 'alpha', 0.35);
            end
            noteTweenAngle('spinStrum'..i, i+4, 0, crochet / 1000, 'quartOut')
        end
        setDefault = false
    else
        for i = 1,7 do
            if curBeat == moveLeftBeats[i] then --left
                for i = 0, 3 do 
                    noteTweenX('hello marioX'..i, i+4, _G['defaultPlayerStrumX'..i] - 50, crochet / 500, 'quartOut')
                    noteTweenY('hello marioY'..i, i+4, _G['defaultPlayerStrumY'..i], crochet / 500, 'quartOut')
                end
            elseif curBeat == moveDownBeats[i] then --down
                for i = 0, 3 do 
                    noteTweenX('hello marioX'..i, i+4, _G['defaultPlayerStrumX'..i], crochet / 500, 'quartOut')
                    noteTweenY('hello marioY'..i, i+4, _G['defaultPlayerStrumY'..i] + 50, crochet / 500, 'quartOut')
                end
            elseif curBeat == moveUpBeats[i] then --up
                for i = 0, 3 do 
                    noteTweenX('hello marioX'..i, i+4, _G['defaultPlayerStrumX'..i], crochet / 500, 'quartOut')
                    noteTweenY('hello marioY'..i, i+4, _G['defaultPlayerStrumY'..i] - 50, crochet / 500, 'quartOut')
                end
            elseif curBeat == moveRightBeats[i] then --right
                for i = 0, 3 do 
                    noteTweenX('hello marioX'..i, i+4, _G['defaultPlayerStrumX'..i] + 50, crochet / 500, 'quartOut')
                    noteTweenY('hello marioY'..i, i+4, _G['defaultPlayerStrumY'..i], crochet / 500, 'quartOut')
                end
            elseif curBeat == moveToDefault[i] then
                for i = 0,3 do
                    noteTweenX('hello marioX'..i, i+4, _G['defaultPlayerStrumX'..i], crochet / 500, 'quartOut')
                    noteTweenY('hello marioY'..i, i+4, _G['defaultPlayerStrumY'..i], crochet / 500, 'quartOut')
                end
            end
            -- Moving opponent notes
            if curBeat == moveLeftBeatsDad[i] then --left
                for i = 0, 3 do 
                    noteTweenX('not funnyX'..i, i, _G['defaultOpponentStrumX'..i] - 50, crochet / 500, 'quartOut')
                    noteTweenY('not funnyY'..i, i, _G['defaultOpponentStrumY'..i], crochet / 500, 'quartOut')
                end
            elseif curBeat == moveDownBeatsDad[i] then --down
                for i = 0, 3 do 
                    noteTweenX('not funnyX'..i, i, _G['defaultOpponentStrumX'..i], crochet / 500, 'quartOut')
                    noteTweenY('not funnyY'..i, i, _G['defaultOpponentStrumY'..i] + 50, crochet / 500, 'quartOut')
                end
            elseif curBeat == moveUpBeatsDad[i] then --up
                for i = 0, 3 do 
                    noteTweenX('not funnyX'..i, i, _G['defaultOpponentStrumX'..i], crochet / 500, 'quartOut')
                    noteTweenY('not funnyY'..i, i, _G['defaultOpponentStrumY'..i] - 50, crochet / 500, 'quartOut')
                end
            elseif curBeat == moveRightBeatsDad[i] then --right
                for i = 0, 3 do 
                    noteTweenX('not funnyX'..i, i, _G['defaultOpponentStrumX'..i] + 50, crochet / 500, 'quartOut')
                    noteTweenY('not funnyY'..i, i, _G['defaultOpponentStrumY'..i], crochet / 500, 'quartOut')
                end
            elseif curBeat == moveToDefaultDad[i] then
                for i = 0,3 do
                    noteTweenX('not funnyX'..i, i, _G['defaultOpponentStrumX'..i], crochet / 500, 'quartOut')
                    noteTweenY('not funnyY'..i, i, _G['defaultOpponentStrumY'..i], crochet / 500, 'quartOut')
                end
            end
        end
    end

    if curBeat >= 319 and curBeat < 364 then
		thing = thing * -1
		doTweenAngle('rotate', 'camHUD', thing * 5, crochet / 1000, 'quadInOut')
    elseif curBeat == 364 then
    	doTweenAngle('rotate', 'camHUD', 0, crochet / 1000, 'quadOut') 
    end
end

function onStepHit()
    if (curBeat >= 328 and curBeat < 359 and curStep % 2 == 0) or curBeat >= 343 and curBeat < 324 then
        thing = thing * -1
        for i = 0, 3 do 
            noteTweenX('movething'..i, i+4, _G['defaultPlayerStrumX'..i] + (20 * thing), stepCrochet / 1000, 'quadOut')
        end
    end
end
function onTweenCompleted(tag)
    if tag == 'changeDefault3' and setDefault == false then
        setDefaultStrumPos('bf')
        setDefault = true
    end
end