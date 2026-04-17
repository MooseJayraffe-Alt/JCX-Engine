local videoPath = callMethodFromClass('backend.Paths', 'video', {'shucks-door'})
local videoPath1 = callMethodFromClass('backend.Paths', 'video', {'shucks-lyrics'})
local videoPath2 = callMethodFromClass('backend.Paths', 'video', {'shucks-youbitch'})
local precacheChars = {
    {'dad', 'detg'},
    --{'dad', 'detg-saw'},
    {'dad', 'detg-chair'},
    {'dad', 'detg-run'},
    {'boyfriend', 'marvin-shucks'},
    --{'boyfriend', 'marvin-shucks-chair'},
    --{'boyfriend', 'marvin-shucks-run'},
}
local setaSpeed = 1.25
local run = false
local runBG = 'loop'
local runBGLoop = true
local runPos = true
local notShadow = false

function onCreate()
for i=1, #precacheChars do
local charData = precacheChars[i]
addCharacterToList(charData[2], charData[1])
end
end

function onCreatePost()
setPropertyFromGroup('playerStrums', 0, 'y', -150)
setPropertyFromGroup('playerStrums', 1, 'y', -150)
setPropertyFromGroup('playerStrums', 2, 'y', -150)
setPropertyFromGroup('playerStrums', 3, 'y', -150)

setPropertyFromGroup('opponentStrums', 0, 'y', -150)
setPropertyFromGroup('opponentStrums', 1, 'y', -150)
setPropertyFromGroup('opponentStrums', 2, 'y', -150)
setPropertyFromGroup('opponentStrums', 3, 'y', -150)

makeLuaSprite('songcard','cards/' .. songName .. '',0,0)
setObjectCamera('songcard','other')
addLuaSprite('songcard')
screenCenter('songcard','xy')

hideShucksBG(false)
hideChairBG(false)
hideRun(false)
setProperty('gf.alpha',0)
--setProperty('boyfriend.alpha',0)
setProperty('songcard.alpha',0)

--videosInGameplay
createInstance('doorVid', 'backend.VideoSpriteManager', {-40, -40})
addInstance('doorVid', false)
setObjectCamera('doorVid','other')
scaleObject('doorVid', 1.07, 1.07)

createInstance('lyricVid', 'backend.VideoSpriteManager', {-240, -140})
addInstance('lyricVid', false)
setObjectCamera('lyricVid','hud')
scaleObject('lyricVid', 0.75, 0.75)

createInstance('bitchVid', 'backend.VideoSpriteManager', {-40, -40})
addInstance('bitchVid', false)
setObjectCamera('bitchVid','other')
scaleObject('bitchVid', 1.07, 1.07)

makeLuaSprite('shaderEffect', '', -500, -500)
makeGraphic('shaderEffect', screenWidth * 2, screenHeight * 2, 'FFFFFF')
setObjectCamera('shaderEffect', 'hud')
setObjectOrder('shaderEffect','uiGroup')
addLuaSprite('shaderEffect', true)
setProperty('shaderEffect.alpha', 0)
setBlendMode('shaderEffect', 'SUBTRACT')

triggerEvent('Camera Zoom','1.05','0.01')
end

function hideShucksBG(state)
local bgShucks = {'p1_bg','p1_extralight','p1_light','p1_lightbase','p1_glow2','p1_glow','p1_glow3','p1_chain','p1_hook','p1_darknessred','p1_darkness'}
for _, bgShucks in ipairs (bgShucks) do
setProperty(bgShucks .. '.visible', state)
end

if state == true then
local bgShucks2 = {'p1_bg','p1_extralight','p1_light','p1_lightbase','p1_glow2','p1_glow','p1_glow3','p1_chain','p1_hook','p1_darknessred','p1_darkness'}
for _, bgShucks2 in ipairs (bgShucks2) do
setProperty(bgShucks2 .. '.visible', true)
end
end
end

function hideChairBG(state)
local bgChair = {'chair_bg','chair_chair','chair_introbottom','chair_introtop','chair_glow','chair_dark','chair_text'}
for _, bgChair in ipairs (bgChair) do
setProperty(bgChair .. '.visible', state)
end

if state == true then
local bgChair2 = {'chair_bg','chair_chair','chair_introbottom','chair_introtop','chair_glow','chair_dark','chair_text'}
for _, bgChair2 in ipairs (bgChair2) do
setProperty(bgChair2 .. '.visible', true)
end
end
end

function hideRun(state)
local bgRun = {'run_legsdetg','run_legsmarv','run_multi','run_dark','run_add','runbg'}
for _, bgRun in ipairs (bgRun) do
setProperty(bgRun .. '.visible', state)
end

if state == true then
local bgRun2 = {'run_legsdetg','run_legsmarv','run_multi','run_dark','run_add','runbg'}
for _, bgRun2 in ipairs (bgRun2) do
setProperty(bgRun2 .. '.visible', true)
end
end
end

function onSongStart()
callMethod('doorVid.startVideo', {videoPath})
setProperty('camGame.alpha', 0)
end

function onStepHit()
if curStep == 72 then
removeLuaSprite('doorVid', true)
setProperty('camGame.alpha', 1)
setProperty('dad.alpha', 1)
setProperty('boyfriend.alpha', 1)
setProperty('cameraSpeed', 999)
triggerEvent('Play Animation', 'anim', 'bf')
        
elseif curStep == 80 then
triggerEvent('Play Animation', 'anim', 'bf')

elseif curStep == 154 then
cancelTween('tag2')
doTweenZoom('tag2', 'camGame', 0.85, 5, 'circInOut')

elseif curStep == 176 then
noteTweenY('seta0Y', 0, 50, setaSpeed, 'quadOut')
noteTweenY('seta1Y', 1, 50, setaSpeed, 'quadOut')
noteTweenY('seta2Y', 2, 50, setaSpeed, 'quadOut')
noteTweenY('seta3Y', 3, 50, setaSpeed, 'quadOut')

noteTweenY('seta4Y', 4, 50, setaSpeed, 'quadOut')
noteTweenY('seta5Y', 5, 50, setaSpeed, 'quadOut')
noteTweenY('seta6Y', 6, 50, setaSpeed, 'quadOut')
noteTweenY('seta7Y', 7, 50, setaSpeed, 'quadOut')
setProperty('cameraSpeed', 1)

elseif curStep == 304 then
cancelTween('tag2')
doTweenZoom('tag2', 'camGame', 0.75, 4, 'circInOut')
triggerEvent('showHUD','up','')

elseif curStep == 307 then
setProperty('cameraSpeed', 0.75)
   
elseif curStep == 452 then
hideShucksBG(true)
triggerEvent('defaultHUD','','')
notShadow = true
setProperty('cameraSpeed', 1)
setProperty('gf.alpha',1)
triggerEvent('Change Character','dad','detg')
triggerEvent('Change Character','boyfriend','marvin-shucks')
triggerEvent('Play Animation', 'intro', 'dad')
triggerEvent('Camera Zoom', '0.55', '0.01')

elseif curStep == 528 then  
setProperty('camHUD.alpha', 1)

elseif curStep == 544 then
cameraFlash('camGame', 'FFFFFF', 1)
setProperty('cameraSpeed', 2)

elseif curStep == 800 then
triggerEvent('Camera Position','','')
setProperty('cameraSpeed', 0.65)

elseif curStep == 808 then
doTweenAlpha('songCardIn', 'songcard', 1, 1)
setProperty('cameraSpeed', 1)
--triggerEvent('Change Camera Bop','4','')

elseif curStep == 828 then
doTweenAlpha('songCardOut', 'songcard', 0, 2)

elseif curStep == 1087 then
triggerEvent('Camera Position','340','-540')
setProperty('cameraSpeed', 2)

elseif curStep == 1120 then
triggerEvent('Camera Position','','')
setProperty('cameraSpeed', 2)

elseif curStep == 1182 then
setProperty('cameraSpeed', 999)

elseif curStep == 1184 then
triggerEvent('Camera Follow Pos',getMidpointX('dad'),getMidpointY('dad'))
cameraSetTarget('dad')

elseif curStep == 1192 then
triggerEvent('Camera Follow Pos',getMidpointX('boyfriend'),getMidpointY('boyfriend'))
cameraSetTarget('boyfriend')

elseif curStep == 1199 then
triggerEvent('Camera Follow Pos',getMidpointX('dad'),getMidpointY('dad'))
cameraSetTarget('dad')

elseif curStep == 1207 then
triggerEvent('Camera Follow Pos','340','-540')

elseif curStep == 1216 then
triggerEvent('Camera Follow Pos',getMidpointX('dad'),getMidpointY('dad'))
cameraSetTarget('dad')

elseif curStep == 1223 then
triggerEvent('Camera Follow Pos',getMidpointX('boyfriend'),getMidpointY('boyfriend'))
cameraSetTarget('boyfriend')

elseif curStep == 1231 then
triggerEvent('Camera Follow Pos',getMidpointX('dad'),getMidpointY('dad'))
cameraSetTarget('dad')

elseif curStep == 1240 then
triggerEvent('Camera Follow Pos',getMidpointX('boyfriend'),getMidpointY('boyfriend'))
cameraSetTarget('boyfriend')

elseif curStep == 1248 then
triggerEvent('Camera Follow Pos',getMidpointX('dad'),getMidpointY('dad'))
cameraSetTarget('dad')

elseif curStep == 1254 then
triggerEvent('Camera Follow Pos',getMidpointX('boyfriend'),getMidpointY('boyfriend'))
cameraSetTarget('boyfriend')

elseif curStep == 1263 then
triggerEvent('Camera Follow Pos',getMidpointX('dad'),getMidpointY('dad'))
cameraSetTarget('dad')

elseif curStep == 1269 then
triggerEvent('Camera Follow Pos',getMidpointX('dad'),getMidpointY('dad'))
cameraSetTarget('dad')

elseif curStep == 1279 then
triggerEvent('Camera Follow Pos',getMidpointX('boyfriend'),getMidpointY('boyfriend'))
cameraSetTarget('boyfriend')

elseif curStep == 1287 then
triggerEvent('Camera Follow Pos',getMidpointX('dad'),getMidpointY('dad'))
cameraSetTarget('dad')

elseif curStep == 1295 then
triggerEvent('Camera Follow Pos',getMidpointX('boyfriend'),getMidpointY('boyfriend'))
cameraSetTarget('boyfriend')

elseif curStep == 1302 then
triggerEvent('Camera Follow Pos',getMidpointX('dad'),getMidpointY('dad'))
cameraSetTarget('dad')

elseif curStep == 1312 then
triggerEvent('Camera Position','','')
setProperty('cameraSpeed', 1)
cameraFlash('camGame','FF0000',2)
doTweenAlpha('shaderEffect1', 'shaderEffect', 0.15, 2, 'linear')

elseif curStep == 1371 then
triggerEvent('Camera Position','340','-540')
setProperty('cameraSpeed', 0.75)

elseif curStep == 1467 then
triggerEvent('Camera Position','','')
setProperty('cameraSpeed', 1)
doTweenAlpha('shaderEffect2', 'shaderEffect', 0, 2, 'linear')

elseif curStep == 1536 then
triggerEvent('Camera Position','340','-540')
setProperty('cameraSpeed', 2)

elseif curStep == 1600 then
triggerEvent('Camera Position','','')

elseif curStep == 1602 then
setProperty('cameraSpeed', 1)

elseif curStep == 1725 then
triggerEvent('Camera Position','340','-540')
setProperty('cameraSpeed', 0.55)

elseif curStep == 1879 then
triggerEvent('Camera Zoom','0.8','4')

elseif curStep == 1884 then
doTweenAlpha('icon3Show', 'iconP3', 1, 1, 'quartOut')
doTweenX('icon3Move', 'iconP3', getProperty('iconP1.x') - 45, 0.5, 'quartOut')

elseif curStep == 1900 then
triggerEvent('Camera Follow Pos',getMidpointX('dad'),getMidpointY('dad'))
cameraSetTarget('dad')
triggerEvent('Play Animation', 'lookover', 'dad')
triggerEvent('Camera Zoom','0.65','1')

elseif curStep == 1919 then
triggerEvent('Camera Follow Pos','340','-540')
triggerEvent('Camera Zoom','0.85','2')

elseif curStep == 2012 then
triggerEvent('Camera Follow Pos','','')
triggerEvent('Camera Zoom','0.65','1')

elseif curStep == 2144 then
triggerEvent('Camera Follow Pos','340','-540')
triggerEvent('Camera Zoom', '0.5', '1')
setProperty('cameraSpeed', 1)
triggerEvent('Play Animation', 'lookback', 'dad')

elseif curStep == 2395 then
triggerEvent('Camera Follow Pos','','')
triggerEvent('Camera Zoom', '0.45', '2')

elseif curStep == 2399 then
triggerEvent('Camera Zoom', '0.55', '2')
triggerEvent('Play Animation', 'voiceline', 'bf')
triggerEvent('Play Animation', 'voiceline', 'gf')
triggerEvent('Play Animation', 'voiceline', 'dad')

elseif curStep == 2400 then
doTweenAlpha('icon3Hide', 'iconP3', 0, 1)
doTweenAlpha('camHUDFade', 'camHUD', 0, 2, 'circInOut')
triggerEvent('showHUD','down','')

elseif curStep == 2412 then
triggerEvent('Camera Zoom', '0.65', '1')

elseif curStep == 2431 then
triggerEvent('Camera Zoom', '0.45', '1')
triggerEvent('Camera Follow Pos',getMidpointX('dad'),getMidpointY('dad'))
cameraSetTarget('dad')

elseif curStep == 2457 then
triggerEvent('Camera Zoom', '0.8', '1')

elseif curStep == 2472 then
triggerEvent('Camera Zoom', '0.6', '1')

elseif curStep == 2499 then
triggerEvent('Camera Zoom', '0.75', '1')

elseif curStep == 2505 then
triggerEvent('Camera Zoom', '0.85', '1')

elseif curStep == 2521 then
triggerEvent('Camera Zoom', '0.55', '3')

elseif curStep == 2544 then
triggerEvent('Camera Follow Pos',getMidpointX('boyfriend'),getMidpointY('boyfriend'))
cameraSetTarget('boyfriend')

elseif curStep == 2553 then
triggerEvent('Camera Follow Pos',getMidpointX('dad'),getMidpointY('dad'))
cameraSetTarget('dad')
setProperty('cameraSpeed', 0.45)

elseif curStep == 2592 then
triggerEvent('Camera Follow Pos','340','-540')

elseif curStep == 2607 then
triggerEvent('Camera Zoom', '0.7', '2')

elseif curStep == 2645 then
triggerEvent('Camera Zoom', '0.8', '2')
triggerEvent('Change Character','gf','rose-shucks-dead')

setProperty('dad.idleSuffix','-alt')
for i = 0, getProperty('unspawnNotes.length')-1 do
if not getProperty('unspawnNotes['..i..'].mustPress') then
 setProperty('unspawnNotes['..i..'].animSuffix', '-alt')
end
end

elseif curStep == 2655 then
triggerEvent('Camera Zoom', '0.55', '2')

elseif curStep == 2656 then
changeIconP1('marvin-shucks-bloody')
doTweenAlpha('hudIn', 'camHUD', 1, 1, 'circInOut')
triggerEvent('showHUD','up','')

elseif curStep == 2663 then
triggerEvent('Camera Follow Pos','','')

elseif curStep == 2671 then
setProperty('cameraSpeed', 1)
cameraFlash('camGame','FF0000',1)

elseif curStep == 2715 then
triggerEvent('Camera Zoom', '0.8', '1')

elseif curStep == 2735 then
triggerEvent('Camera Zoom', '0.55', '1')
cameraFlash('camGame','FF0000',1)

elseif curStep == 2928 then
triggerEvent('Camera Position','340','-540')

elseif curStep == 3075 then
triggerEvent('Camera Position','','')

elseif curStep == 3087 then
cameraFlash('camGame','FF0000',0.45)
doTweenAlpha('shaderEffect2', 'shaderEffect', 0.17, 2, 'linear')

elseif curStep == 3149 then
triggerEvent('Camera Zoom', '0.55', '1')
triggerEvent('Camera Position','340','-540')
setProperty('cameraSpeed', 0.45)

elseif curStep == 3423 then
triggerEvent('Camera Zoom', '0.6', '1')

elseif curStep == 3440 then
triggerEvent('Camera Zoom', '0.7', '1')

elseif curStep == 3456 then
triggerEvent('Camera Zoom', '0.75', '1')

elseif curStep == 3460 then
triggerEvent('Camera Zoom', '0.8', '1')

elseif curStep == 3463 then
triggerEvent('Camera Zoom', '0.7', '1')

elseif curStep == 3468 then
triggerEvent('Camera Zoom', '0.65', '1')

elseif curStep == 3472 then
triggerEvent('Camera Position','','')
setProperty('cameraSpeed',1)

elseif curStep == 3560 then
callMethod('lyricVid.startVideo', {videoPath1})
setProperty('lyricVid.visible', false)
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)

elseif curStep == 3591 then
setProperty('cameraSpeed',0.45)
triggerEvent('Camera Follow Pos',getMidpointX('dad'),getMidpointY('dad'))
cameraSetTarget('dad')
doTweenAlpha('camHUD','camHUD',0,0.35)

elseif curStep == 3600 then
hideShucksBG(false)
setProperty('lyricVid.visible', true)
triggerEvent('Camera Follow Pos','','')
triggerEvent('Camera Zoom', '0.7', '1')

elseif curStep == 3604 then
setProperty('cameraSpeed', 1)
triggerEvent('Camera Zoom', '0.55', '1')

elseif curStep == 3872 then
hideChairBG(true)
setProperty('lyricVid.visible', false)
setProperty('gf.alpha', 0)
setProperty('camGame.alpha', 1)
triggerEvent('Change Character','dad','detg-chair')
triggerEvent('Change Character','boyfriend','marvin-shucks-chair')

triggerEvent('Camera Follow Pos','1465','845')
triggerEvent('Camera Zoom','0.45','0.01')

setProperty('dad.visible',false)
setProperty('cameraSpeed',999)
setProperty('boyfriend.visible',false)
playAnim('chair_introtop','intro')
playAnim('chair_introbottom','intro')
playAnim('chair_text','ShucksText ShucksText')
runTimer('bf',0.3)
runTimer('dad',0.6)

elseif curStep == 3888 then
setProperty('lyricVid.visible', false)

elseif curStep == 3952 then
doTweenAlpha('timeTitleFadeIn', 'timeTitle', 1, 4, 'circInOut')
doTweenAlpha('timeTxtFadeIn', 'timeTxt', 1, 4, 'circInOut')

elseif curStep == 4016 then
triggerEvent('Camera Zoom', '0.8', '0.1')
triggerEvent('Camera Follow Pos','1665','945')
setProperty('cameraSpeed',2)

elseif curStep == 4023 then
triggerEvent('Camera Follow Pos','1365','645')

elseif curStep == 4031 then
triggerEvent('Camera Follow Pos','1665','945')

elseif curStep == 4039 then
triggerEvent('Camera Follow Pos','1365','645')

elseif curStep == 4048 then
triggerEvent('Camera Follow Pos','1665','945')

elseif curStep == 4055 then
triggerEvent('Camera Follow Pos','1365','645')

elseif curStep == 4063 then
triggerEvent('Camera Follow Pos','1665','945')

elseif curStep == 4072 then
triggerEvent('Camera Follow Pos','1365','645')

elseif curStep == 4087 then
triggerEvent('Camera Follow Pos','1665','945')

elseif curStep == 4096 then
triggerEvent('Camera Follow Pos','1365','645')

elseif curStep == 4104 then
triggerEvent('Camera Follow Pos','1665','945')

elseif curStep == 4112 then
triggerEvent('Camera Follow Pos','1365','645')

elseif curStep == 4119 then
triggerEvent('Camera Follow Pos','1665','945')

elseif curStep == 4127 then
triggerEvent('Camera Follow Pos','1365','645')

elseif curStep == 4135 then
triggerEvent('Camera Follow Pos','1665','945')

elseif curStep == 4143 then
triggerEvent('Camera Follow Pos','1465','845')
triggerEvent('Camera Zoom','0.45','0.01')
setProperty('cameraSpeed',1)

elseif curStep == 4324 then

elseif curStep == 4335 then

elseif curStep == 4388 then
callMethod('bitchVid.startVideo', {videoPath2})
hideChairBG(false)
hideRun(true)
triggerEvent('Camera Zoom','0.55','0.01')
triggerEvent('Camera Follow Pos','1260','680')
triggerEvent('Change Character','dad','detg-run')
triggerEvent('Change Character','bf','marvin-run')

--elseif curStep == 4396 then

--elseif curStep == 4412 then

elseif curStep == 4416 then
cameraFlash('camGame','00FFFFF', 2)
run = true

elseif curStep == 4671 then
triggerEvent('Camera Zoom', '0.7', '0.1')
triggerEvent('Camera Follow Pos','1460','680')
setProperty('cameraSpeed', 0.45)

elseif curStep == 4696 then
triggerEvent('Camera Follow Pos','1060','680')
triggerEvent('Camera Zoom', '0.8', '0.1')
setProperty('cameraSpeed', 999)

elseif curStep == 4704 then
triggerEvent('Camera Follow Pos','1260','680')
triggerEvent('Camera Zoom', '0.55', '0.1')
runBG = 'bodies'

elseif curStep == 4967 then
runBGLoop = false
runPos = false
setProperty('dad.x', 500)
setProperty('dad.y', 485)
playAnim('runbg', 'end', true)
setProperty('run_legsdetg.visible', false)
triggerEvent('Play Animation', 'fall', 'dad')
doTweenX('bf','boyfriend', 4500, 2)
doTweenX('legsMarvinAhhhhhh','run_legsmarv', 4500, 2)

elseif curStep == 4972 then
doTweenZoom('zoomInFinal', 'camGame', 2, 1, 'circInOut')

elseif curStep == 4976 then
doTweenAlpha('fadeGameOut', 'camGame', 0, 4, 'circInOut')

end
end

local seenCutscene = false
function onEndSong()
if isStoryMode and not seenCutscene then
startVideo('shucks-end-cutscene')
seenCutscene = true
return Function_Stop
end
return Function_Continue
end

function changeIconP1(state)
runHaxeCode([[game.iconP1.changeIcon(']] .. state .. [[')]]);
end

function moveTo(state)
if state == 'dad' then
triggerEvent('Camera Follow Pos',getMidpointX('dad'),getMidpointY('dad'))
cameraSetTarget('dad')
end

if state == 'bf' then
triggerEvent('Camera Follow Pos',getMidpointX('boyfriend'),getMidpointY('boyfriend'))
cameraSetTarget('boyfriend')
end

if state == 'nil' then
triggerEvent('Camera Follow Pos','','')
end
end

function onTimerCompleted(tag)
if tag == 'hudAngle' then
doTweenAngle('camHUDAngle','camHUD', -10, 4)
runTimer('hudAngle2', 4)
end
if tag == 'hudAngle2' then
doTweenAngle('camHUDAngle2','camHUD', 10, 4)
runTimer('hudAngle', 4)
end

if tag == 'shaderDarken' then
setProperty('boyfriend.color', getColorFromHex('333333'))
setProperty('dad.color', getColorFromHex('333333'))

elseif tag == 'setStageRun' then
triggerEvent('Change Stage', 'run_', '')
setProperty('defaultCamZoom', 1)
end
end

function onUpdate()

for i = 0, getProperty('unspawnNotes.length')-1 do
setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/shadow')
end

for i = 0, getProperty('opponentStrums.length')-1 do
setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/shadow')
end

for i = 0, getProperty('playerStrums.length')-1 do
setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/shadow')
end

if notShadow then

for i = 0, getProperty('unspawnNotes.length')-1 do
setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/default')
end

for i = 0, getProperty('opponentStrums.length')-1 do
setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/default')
end

for i = 0, getProperty('playerStrums.length')-1 do
setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/default')
end

end

if runBGLoop then
if getProperty('runbg.animation.curAnim.finished') then
playAnim('runbg', runBG, true)
end
end

if getProperty('dad.animation.curAnim.finished') then
setProperty('dad.visible', false)
end

if dadName == 'detg' then
setProperty('dad.x', -750)
setProperty('dad.y', -865)
end

if dadName == 'detg-chair' then
setProperty('dad.x', 500)
setProperty('dad.y', 332)
end

if boyfriendName == 'marvin-shucks' then
setProperty('boyfriend.x', 620)
setProperty('boyfriend.y', -465)
end

if boyfriendName == 'marvin-shucks-chair' then
setProperty('boyfriend.x', 1280)
setProperty('boyfriend.y', 675)
end

if gfName == 'rose-shucks' then
setProperty('gf.x', 80)
setProperty('gf.y', -830)
end

if gfName == 'rose-shucks-dead' then
setProperty('gf.x', 80)
setProperty('gf.y', -860)
end

if runPos then
if dadName == 'detg-run' then
setProperty('dad.x', 490)
setProperty('dad.y', 245)
end

if boyfriendName == 'marvin-shucks-run' then
setProperty('boyfriend.x', 1070)
setProperty('boyfriend.y', 280)
end
end
end

function onUpdatePost()
if run then
local angle = math.sin(getSongPosition() / 1000) * 2
setProperty('camHUD.angle', angle)
end
end