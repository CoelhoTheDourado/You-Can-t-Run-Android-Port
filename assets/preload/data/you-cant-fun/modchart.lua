--Modchart Vars
local defaultNotePos = {};
local camZoom = false;
local shakearrowangle = false;
local shakeCam = false;
local moveArrowCamX = false;
local moveArrowCamY = false;
local moveHudX = false;
local moveHudY = false;
local shakeAngleHud = false;
local ArrowCamXForce = 12;
local ArrowCamYForce = 12;
local HudX = 12;
local HudY = 12;
local ArrowCamAngleForce = 4;
local hudAngle = -4;
local camAngle = -4;
local shakearrow = false;
local shakearrow2 = false;
local shakearrow3 = false;
local shakearrow4 = false;
local shakearrow5 = false;

function onCreate()
    arrowInHud = false;
    addCharacterToList('sonic_exe_pixel','dad');
    addCharacterToList('bf-pixel-alt','bf');
    addCharacterToList('gf-pixel-alt','gf');
end

function onSongStart()
    for i = 0,7 do
        x = getPropertyFromGroup('strumLineNotes', i, 'x')

        y = getPropertyFromGroup('strumLineNotes', i, 'y')

        angle = getPropertyFromGroup('strumLineNotes', i, 'angle')


        table.insert(defaultNotePos, {x, y, angle})
    end
end

function onUpdate(elapsed)
    songPos = getPropertyFromClass('Conductor', 'songPosition');
    currentBeat = (songPos / 1000) * (bpm / 60);

    if camZoom then
        setCamZoom('cam',1.15);
        setCamZoom('hud',1.2);
        setCamZoom('arrow',1.2);
        camZoom = false;
    end

    if shakearrowangle then
        setProperty('arrowCAM.angle', ArrowCamAngleForce*math.sin(currentBeat));
    end

    if moveArrowCamX then
        setProperty('arrowCAM.x', ArrowCamXForce*math.sin(currentBeat) * math.pi);
    end

    if moveArrowCamY then
        setProperty('arrowCAM.y', ArrowCamYForce*math.cos(currentBeat) * math.pi);
    end

    if moveHudX then
        setProperty('camHUD.x', HudX*math.sin(currentBeat) * math.pi);
    end

    if moveHudY then
        setProperty('camHUD.y', HudY*math.cos(currentBeat) * math.pi);
    end

    if shakeAngleHud then
        setProperty('camHUD.angle', hudAngle*math.sin(currentBeat));
    end

    if shakeCam then
        setPropertyFromClass('flixel.FlxG','camera.angle',camAngle*math.sin(currentBeat));
    end

    if shakearrow then
        for i=0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + 20 * math.sin((currentBeat + i*0)))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + 10 * math.sin((currentBeat + i*1) * math.pi))
        end
    end
    if shakearrow2 then
        for i=0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + 15 * math.sin((currentBeat + i*0)))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + 10 * math.sin((currentBeat + i*0.25) * math.pi))
        end
    end
    if shakearrow3 then
        for i=0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + 0 * math.sin((currentBeat + i*0)))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + 32 * math.sin((currentBeat + i*0) * math.pi))
        end
    end
    if shakearrow4 then
        for i=0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + 0 * math.sin((currentBeat + i*0)))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + 5 * math.sin((currentBeat + i*1) * math.pi))
        end
    end
    if shakearrow5 then
        for i=0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + 20 * math.sin((currentBeat + i*0.25) * math.pi))
        end
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 1423 and curStep <= 1449 then
        cameraShake('cam',0.02,0.2);
    end
end

function onGameOver()
	shakearrow = false;
    shakearrow2 = false;
    shakearrow3 = false;
    shakearrow4 = false;
    shakearrow5 = false;
    moveArrowCamX = false;
    moveArrowCamY = false;
    moveHudX = false;
    moveHudY = false;
    shakeAngleHud = false;
    shakeCam = false;
    setProperty('defaultCamZoom',0.9);
    resetCam();
end

function resetStaticArrows(time)
    for i = 0,7 do
        noteTweenX("movementX " .. i, i, defaultNotePos[i + 1][1], time, "linear");
        noteTweenY("movementY " .. i, i, defaultNotePos[i + 1][2], time, "linear");
        noteTweenAngle("movementAngle " .. i, i, defaultNotePos[i + 1][3], time, "linear");
    end
end

function arrowBump(amount, smallamount, time)
    for i = 0,7 do
        thing = 0;
        if i == 4 or i == 0 then
            thing = -amount
        end
        if i == 5 or i == 1 then
            thing = -smallamount
        end
        if i == 6 or i == 2 then
            thing = smallamount
        end
        if i == 7 or i == 3 then
            thing = amount
        end
        setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i, 'x') + thing);
        noteTweenX("movementXbump " .. i, i, defaultNotePos[i + 1][1], time, "linear");
    end
end

function arrowBump2()
    for i = 0,7 do
        thing = 0;
        if i == 4 or i == 0 then
            thingX = rangeRandom(-64,35);
            thingY = rangeRandom(-32,32);
            thingAngle = rangeRandom(-15,15);
        end
        if i == 5 or i == 1 then
            thingX = rangeRandom(-32,32);
            thingY = rangeRandom(-15,15);
            thingAngle = rangeRandom(-15,15);
        end
        if i == 6 or i == 2 then
            thingX = rangeRandom(-32,32);
            thingY = rangeRandom(-15,15)
            thingAngle = rangeRandom(-15,15);
        end
        if i == 7 or i == 3 then
            thingX = rangeRandom(-64,35);
            thingY = rangeRandom(-32,32);
            thingAngle = rangeRandom(-15,15);
        end
        setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i, 'x') + thingX);
        setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i, 'y') + thingY);
        setPropertyFromGroup('strumLineNotes', i, 'angle', getPropertyFromGroup('strumLineNotes', i, 'angle') + thingAngle);
        noteTweenX("movementXbump " .. i, i, defaultNotePos[i + 1][1], 0.2, "linear");
        noteTweenY("movementY " .. i, i, defaultNotePos[i + 1][2], 0.2, "linear");
        noteTweenAngle("movementAngle " .. i, i, defaultNotePos[i + 1][3], 0.2, "linear");
    end
end

function rangeRandom(from, to)
    return from + (math.random() * (to - from))
end

function resetArrowCam()
    setProperty('arrowCAM.x',0);
    setProperty('arrowCAM.y',0);
    setProperty('arrowCAM.angle',0);
end

function resetHudCam()
    setProperty('camHUD.x',0);
    setProperty('camHUD.y',0);
    setProperty('camHUD.angle',0);
end

function resetCam()
    setPropertyFromClass('flixel.FlxG','camera.angle',0);
end

--For Stage
