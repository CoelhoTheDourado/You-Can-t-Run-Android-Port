local author = 'your dad'

function onStepHit()

    if curStep == 30 then

    makeLuaText('songtext','Credits',0,500,0)
    setTextSize('songtext', 30)
    addLuaText('songtext')
    setObjectCamera('songtext','other')
    setTextFont('songtext', 'creditsFont.ttf')

    makeLuaSprite('intro1','intro1',250,-800)
    setObjectCamera('intro1','other')
    setProperty('intro1.alpha',0.85)
    addLuaSprite('intro1')
    scaleObject('intro1', 1.7, 1);

    makeLuaText('song','Code',0,535,0)
    setTextSize('song', 30)
    addLuaText('song')
    setObjectCamera('song','other')
    setTextFont('song', 'creditsFont.ttf')

    makeLuaText('song1','Rozy',0,545,0)
    setTextSize('song1', 22)
    addLuaText('song1')
    setObjectCamera('song1','other')
    setTextFont('song1', 'creditsFont.ttf')

    makeLuaText('song2','Bruh',0,545,0)
    setTextSize('song2', 22)
    addLuaText('song2')
    setObjectCamera('song2','other')
    setTextFont('song2', 'creditsFont.ttf')

    makeLuaText('song3','ArtWork',0,500,0)
    setTextSize('song3', 30)
    addLuaText('song3')
    setObjectCamera('song3','other')
    setTextFont('song3', 'creditsFont.ttf')

    makeLuaText('song4','Modiey',0,535,0)
    setTextSize('song4', 22)
    addLuaText('song4')
    setObjectCamera('song4','other')
    setTextFont('song4', 'creditsFont.ttf')

    makeLuaText('song5','Music',0,530,0)
    setTextSize('song5', 30)
    addLuaText('song5')
    setObjectCamera('song5','other')
    setTextFont('song5', 'creditsFont.ttf')

    makeLuaText('song6','Droxiter',0,515,0)
    setTextSize('song6', 24)
    addLuaText('song6')
    setObjectCamera('song6','other')
    setTextFont('song6', 'creditsFont.ttf')

    makeLuaText('song7','Charting',0,475,0)
    setTextSize('song7', 31)
    addLuaText('song7')
    setObjectCamera('song7','other')
    setTextFont('song7', 'creditsFont.ttf')

    makeLuaText('song8','Rozy',0,545,0)
    setTextSize('song8', 22)
    addLuaText('song8')
    setObjectCamera('song8','other')
    setTextFont('song8', 'creditsFont.ttf')

    elseif curStep == 31 then
        
        doTweenY('songtweenin','intro1',0,1,'cubeIn')
end
   end

function onUpdate()
    setProperty('songtext.y',getProperty('intro1.y') - -50,getProperty('songtext.y') - 50)
    setProperty('authortext.y',getProperty('intro1.y'))
    setProperty('song.y',getProperty('intro1.y') - -140,getProperty('song.y') - 50)
    setProperty('song1.y',getProperty('intro1.y') - -195,getProperty('song1.y') - 50)
    setProperty('song2.y',getProperty('intro1.y') - -230,getProperty('song2.y') - 50)
    setProperty('song3.y',getProperty('intro1.y') - -320,getProperty('song3.y') - 50)
    setProperty('song4.y',getProperty('intro1.y') - -370,getProperty('song4.y') - 50)
    setProperty('song5.y',getProperty('intro1.y') - -470,getProperty('song5.y') - 50)
    setProperty('song6.y',getProperty('intro1.y') - -520,getProperty('song6.y') - 50)
    setProperty('song7.y',getProperty('intro1.y') - -620,getProperty('song7.y') - 50)
    setProperty('song8.y',getProperty('intro1.y') - -670,getProperty('song8.y') - 50)
end

function onTweenCompleted(tag)
    if tag == 'songtweenin' then
        runTimer('tweentimer',5)
    end
    if tag == 'songtweenout' then
        removeLuaText('authortext')
        removeLuaText('songtext')
        removeLuaSprite('intro1')
    end
end

function onTimerCompleted(tag)
    if tag == 'tweentimer' then
        doTweenY('songtweenout','intro1',-1000,1,'cubeIn')
    end
end