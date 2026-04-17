local healthPlayer3 = true
local isPlayer = true
local iconP3 = nil

function onCreate()
    makeLuaSprite('iconP3', nil, 1300, getProperty('iconP2.y') - (downscroll and -15 or 35))
    loadGraphic('iconP3', 'icons/rose-shucks', 150, 150, false)
    addAnimation('iconP3', 'idle', {0,1,2}, 0, false)
    setProperty('iconP3.flipX', true)
    setObjectCamera('iconP3', 'camHUD')
    setProperty('iconP3.alpha', 0)
    scaleObject('iconP3', 0.8, 0.8)
    addLuaSprite('iconP3', true)
end

function onUpdate(elapsed)
--shut up
if healthPlayer3 then
if getHealth() < 0.4 then
setProperty('iconP3.animation.curAnim.curFrame', 1)
else
setProperty('iconP3.animation.curAnim.curFrame', 0)
end
end
--damn
end

function onBeatHit()
setProperty('iconP3.scale.x', 1)
setProperty('iconP3.scale.y', 1)
doTweenX('iconP3ScaleX', 'iconP3.scale', 0.8, (0.5 * (60 / bpm)), 'circOut')
doTweenY('iconP3ScaleY', 'iconP3.scale', 0.8, (0.5 * (60 / bpm)), 'circOut')
end

function onStepHit()
if songName:lower() == 'shucks' then
if curStep == 1884 then
pesadelo(1)
elseif curStep == 2400 then
pesadelo(2)
end
end
if songName:lower() == 'shucks-v4' then
if curStep == 2739 then
pesadelo(1)
elseif curStep == 3012 then
pesadelo(2)
end
end
end

function pesadelo(tag)
if tag == 1 then
doTweenAlpha('iconP3FadeIn', 'iconP3', 1, 1, 'quartOut')
doTweenX('iconP3MoveIn', 'iconP3', 1150, 0.5, 'quartOut')
elseif tag == 2 then
healthPlayer3 = false
setProperty('iconP3.animation.curAnim.curFrame', 1)
doTweenX('iconP3Fall', 'iconP3', getProperty('iconP1.x') + 1175, (stepCrochet / 1000) * 8, 'circInOut')
doTweenAngle('iconP3Spin', 'iconP3', 90, (stepCrochet / 1000) * 8, 'circInOut')
end
end