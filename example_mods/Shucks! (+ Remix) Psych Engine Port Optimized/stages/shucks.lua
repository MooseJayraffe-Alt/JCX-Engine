local rtxshader = false
local shucks = 'stages/shucks/'
local colorShader = "ColorCorrection"
local things = {'light', 'hook', 'chain', 'bg', 'gf', 'boyfriend', 'extralight', 'glow', 'glow2', 'darkness2', 'lightbase'}
local things2 = {'chairbg', 'torture', 'chairdark'}
local hudS = {'iridaAccTxt', 'iridaMissTxt', 'iridaScoreTxt'}
local shit = 200

function onCreate()
    -- BG
    makeLuaSprite('bg', shucks..'bg', -1800, -1585)
    setProperty('bg.alpha', 0)
    scaleObject('bg', 4, 4)
    addLuaSprite('bg', false)

    makeLuaSprite('chairbg', shucks..'chair/bg', -800, -785)
    setProperty('chairbg.alpha', 0)
    scaleObject('chairbg',2,2)
    setScrollFactor('chairbg', 1.1, 1.0)
    addLuaSprite('chairbg', false)

    makeLuaSprite('torture', shucks..'chair/torture', -900, -785)
    scaleObject('torture',2,2)
    setProperty('torture.alpha', 0)
    addLuaSprite('torture')

    makeLuaSprite('extralight', shucks..'extralight', -1800, -1585)
    setProperty('extralight.alpha', 0)
    setScrollFactor('extralight', 1.1, 1.0)
    scaleObject('extralight', 4, 4)
    addLuaSprite('extralight', true)
    --corredor (mudar isso!)
    makeAnimatedLuaSprite('hallway', shucks..'runhallway', 0, 0)
    addAnimationByPrefix('hallway', 'intro', 'intro', 24, false)
    addAnimationByPrefix('hallway', 'loop', 'loop', 24, true)
    addAnimationByPrefix('hallway', 'bodies', 'bodies', 24, true)
    addAnimationByPrefix('hallway', 'end', 'end', 24, false)
    setProperty('hallway.alpha', 0)
    scaleObject('hallway', 3.4, 3.4)
    updateHitbox('hallway')
    addLuaSprite('hallway', false)
    --Pernas dos personagens e 
    makeAnimatedLuaSprite('detgleg', shucks..'legs', 300, 300) --animado
    addAnimationByPrefix('detgleg', 'avisei', 'detg', 24, true)
    setProperty('detgleg.alpha', 0)
    scaleObject('detgleg', 1.3, 1.3)
    updateHitbox('detgleg')
    addLuaSprite('detgleg')

    makeAnimatedLuaSprite('marvinleg', shucks..'legs', 620, 50) --animado
    addAnimationByPrefix('marvinleg', 'porra', 'marv', 24, true)
    setProperty('marvinleg.alpha', 0)
    scaleObject('marvinleg', 2.3, 2.3)
    updateHitbox('marvinleg')
    addLuaSprite('marvinleg')
    -- Luzes e efeitos
    --bg1
    makeLuaSprite('light', shucks..'light', shit, -1600)
    setProperty('light.alpha', 0)
    setScrollFactor('light', 1.1, 1.0)
    ScaleShit('light',4,4)
    addLuaSprite('light', true)

    makeLuaSprite('lightbase', shucks..'lightbase', shit, -1585)
    setProperty('lightbase.alpha', 0)
    setScrollFactor('lightbase', 1.1, 1.0)
    ScaleShit('lightbase',4,4)
    addLuaSprite('lightbase', true)

    makeLuaSprite('glow2', shucks..'glow2', 0, 0)
    setProperty('glow2.alpha', 0)
    camOv('glow2', 'camOv')
    scaleObject('glow2', 2.8, 2.8)
    addLuaSprite('glow2', true)

    makeLuaSprite('glow', shucks..'glow', shit, -1585)
    setProperty('glow.alpha', 0)
    setScrollFactor('glow', 1.1, 1.0)
    ScaleShit('glow', 4, 4)
    addLuaSprite('glow', true)

    makeLuaSprite('glow3', shucks..'glow3', -1800, -1585)
    setProperty('glow3.alpha', 0)
    setScrollFactor('glow3', 1.1, 1.0)
    scaleObject('glow3', 4, 4)
    addLuaSprite('glow3', true)

    makeLuaSprite('chain', shucks..'chain', -1800, -1585)
    setProperty('chain.alpha', 0)
    setScrollFactor('chain', 0.8, 1.0)
    scaleObject('chain', 4, 4)
    addLuaSprite('chain', true)

    makeLuaSprite('hook', shucks..'hook', -1800, -1585)
    setProperty('hook.alpha', 0)
    setScrollFactor('hook', 0.7, 1.0)
    scaleObject('hook', 4, 4)
    addLuaSprite('hook', true)

    makeLuaSprite('darknessred', shucks..'darkness red', 0, 0)
    setProperty('darknessred.alpha', 0)
    camOv('darknessred', 'camOv')
    scaleObject('darknessred', 2.8, 2.8)
    addLuaSprite('darknessred', true)

    makeLuaSprite('darkness2', shucks..'darkness alt', 0, 0)
    setProperty('darkness2.alpha', 0)
    camOv('darkness2', 'camOv')
    setBlendMode('darkness2', 'MULTIPLY')
    scaleObject('darkness2', 2.8, 2.8)
    addLuaSprite('darkness2', true)

    makeLuaSprite('chairglow', shucks..'chair/glow', -900, -400)
    setProperty('chairglow.alpha', 0)
    scaleObject('chairglow',2,2)
    camOv('chairglow', 'camOv')
    addLuaSprite('chairglow', true)

    makeLuaSprite('chairdark', shucks..'chair/dark', -300, -180) --1100 -600
    setProperty('chairdark.alpha', 0)
    scaleObject('chairdark', 1.10,1.10)
    camOv('chairdark', 'camOv')
    addLuaSprite('chairdark', true)    
    -- TEXT
    makeAnimatedLuaSprite('text', shucks..'ShucksText', -15, 0)
    addAnimationByPrefix('text', 'text', 'ShucksText ShucksText', 24, true)
    setProperty('text.alpha', 0)
    scaleObject('text', 3.8, 3.8)
    camOv('text', 'camOv')
    addLuaSprite('text', true)
    -- BLACK FADE
    makeLuaSprite('black', '', 0, 0)
    makeGraphic('black', screenWidth * 2, screenHeight * 2, '000000')    
    setProperty('black.alpha', 0)
    screenCenter('black')
    vidCam('black', 'vidCam')
    addLuaSprite('black')    
    --inicio
    makeLuaSprite('dore', 'the d o r e the door', 0, 0) --1100 -600
    vidCam('dore', 'vidCam')
    addLuaSprite('dore', true)    
    --detg
    makeAnimatedLuaSprite('chair_introbottom', shucks..'chairintro/bottom', -700, -400) --animado
    addAnimationByPrefix('chair_introbottom', 'intro', 'intro', 24, false)
    setProperty('chair_introbottom.alpha', 0)
    scaleObject('chair_introbottom', 6, 6)
    addLuaSprite('chair_introbottom', false)
    --marvin
    makeAnimatedLuaSprite('chair_introtop', shucks..'chairintro/top', -900, -700) --animado
    addAnimationByPrefix('chair_introtop', 'intro', 'intro', 24, false)
    setProperty('chair_introtop.alpha', 0)
    scaleObject('chair_introtop', 6, 6)
    addLuaSprite('chair_introtop', true)
    --ALL BLEND
    setBlendMode('glow', 'ADD')
    setBlendMode('glow2', 'MULTIPLY')
    setBlendMode('glow3', 'ADD')
    setBlendMode('chairglow', 'OVERLAY')
    setBlendMode('chairdark', 'MULTIPLY')
    setBlendMode('darknessred', 'MULTIPLY')
    --pra não lagar na parte que eles corre
    setProperty('camHUD.angle', 1)    
end

function ScaleShit(name,tag,tag2)
setProperty(name..'.scale.x', tag)
setProperty(name..'.scale.y', tag2)
end

function onCreatePost()    
    if shadersEnabled then
    initLuaShader('ColorCorrection')
    initLuaShader('bloom')
    --shader shit
    makeLuaSprite("temporaryShader1", nil, 0,0)  
    setProperty("temporaryShader1.alpha", 0)
    addLuaSprite('temporaryShader1', false)     
    
    makeLuaSprite("temporaryShader2", nil, 0,0)  
    setProperty("temporaryShader2.alpha", 0)
    addLuaSprite('temporaryShader2', false)  
    --damn
    setSpriteShader('temporaryShader1', 'ColorCorrection')    
    setSpriteShader('temporaryShader2', 'bloom')
    --dor
    setShaderFloat('temporaryShader1', "hue", -10)
    setShaderFloat('temporaryShader1', "saturation", 0)
    setShaderFloat('temporaryShader1', "contrast", 30)
    setShaderFloat('temporaryShader1', "brightness", 0)
    --ok
    runHaxeCode([[
    game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader1").shader), new ShaderFilter(game.getLuaObject("temporaryShader2").shader)]);
    ]])
    addHaxeLibrary("temporaryShader1", "openfl.filters")
    addHaxeLibrary("temporaryShader2", "openfl.filters")  
    end
    --ok
    setScrollFactor('gf', 1.0, 1.0)
    setProperty('gf.alpha', 0)
    setProperty('boyfriend.alpha', 0)
    setProperty('dad.alpha', 0)
    --uh
    runHaxeCode ([[
    game.getLuaObject('light').origin.y = 0;
    game.getLuaObject('glow').origin.y = 0;
    ]])
    --a
    if downscroll then
    runHaxeCode([[
    game.uiGroup.y = -FlxG.height;
    ]])
    for i=0,3 do --just to be safe
	setPropertyFromGroup('opponentStrums', i, 'y', screenHeight + 5)
	setPropertyFromGroup('playerStrums', i, 'y', screenHeight + 5)
	end    
    else
    runHaxeCode([[
    game.uiGroup.y = FlxG.height;
    ]])
    for i=0,3 do --just to be safe
	setPropertyFromGroup('opponentStrums', i, 'y', -screenHeight)
	setPropertyFromGroup('playerStrums', i, 'y', -screenHeight)
	end    
    end
    --song card
    makeLuaSprite('songcard', 'game/cards/shucks', 0, 0)
    setObjectCamera('songcard', 'camHUD')
    screenCenter('songcard')
    setScrollFactor('songcard', 0, 0)
    setProperty('songcard.antialiasing', getPropertyFromClass('ClientPrefs', 'data.globalAntialiasing'))
    setProperty('songcard.alpha', 0)
    addLuaSprite('songcard', false)
    --precache pq sim tlgd?
    --parte 1/parte de sangue
    addCharacterToList('detg', 'dad');
    addCharacterToList('marvin-shucks', 'bf');
    addCharacterToList('rose-shucks-dead', 'gf');    
    --parte da cadeira
    addCharacterToList('marvin-shucks-chair', 'bf');
    addCharacterToList('detg-saw', 'gf');
    addCharacterToList('detg-chair', 'dad');
    addCharacterToList('detg-run', 'dad');    
    --ok
end
--blz
local singAnimations = {
    [0] = 'singLEFT',
    [1] = 'singDOWN',
    [2] = 'singUP',
    [3] = 'singRIGHT'
}
--parte de sangue ui ui
function opponentNoteHit(id, direction, noteType, isSustainNote)
if bloody then
if noteType ~= 'No Animation' then
playAnim('dad', singAnimations[direction]..'-alt', true)
setProperty('dad.holdTimer',0)
end
end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
if bloody then
if noteType ~= 'No Animation' then
playAnim('boyfriend', singAnimations[direction]..'-alt', true)
setProperty('boyfriend.holdTimer',0)
end
end
end

function bloodyIdleSuffix(suffix)
setProperty('dad.idleSuffix', suffix)
setProperty('boyfriend.idleSuffix', suffix)
end

function bloodyGeral(thing,suffix)
bloody = thing
bloodyIdleSuffix(suffix)
end
--ok
function onUpdatePost()
local currentBeat = (getSongPosition()/2000)*(curBpm/60)
runHaxeCode([[
game.getLuaObject('light').angle = game.getLuaObject('glow').angle = Math.sin(Conductor.songPosition / 1000) * 7.5;
]])
if runDuetShit then
setProperty('camHUD.angle', 2 * math.cos(currentBeat))
end
end

function onSongStart()
setProperty('dore.alpha', 0)
setProperty('camHUD.angle', 0)
--ok
onCreateCutscene('door', 'door', 0, 0)
setProperty('door.alpha', 0)
doTweenAlpha('venha', 'door', 1, 3, 'quartOut')
end

function noteShit(tag,alpha,y,timer,ease)
if tag == 'tween' then
for i=0,3 do
if y == 0 then
y = _G['defaultOpponentStrumY'..i]
end
noteTweenY('outtaHere'..i..'TweenYOpp', i, y, timer, ease)
end
for i=4,7 do
if y == 0 then
y = _G['defaultPlayerStrumY'..i] - 4
end
noteTweenY('outtaHere'..i..'TweenYPlayer', i, y, timer, ease)
end
elseif tag == 'alpha' then
for i=0,3 do
noteTweenAlpha('outtaHere'..i..'TweenAlphaOpp', i, middlescroll and alpha * 0.35 or alpha, timer, ease)
end
for i=4,7 do
noteTweenAlpha('outtaHere'..i..'TweenAlphaPlayer', i, alpha, timer, ease)
end
end
end

local walkDown = false
local walkDown2 = false
function onBeatHit()
if runBg then
    if curBeat % 2 == 0 then        
        walkDown = not walkDown
        walkDown2 = not walkDown2

        -- BF (ou personagem índice 4)
        --if stringStartsWith(getProperty('boyfriend.animation.name'), 'sing') then
            if walkDown2 then
                setProperty('boyfriend.y', 190)
            else
                setProperty('boyfriend.y', 200)
            end
        --end
        -- DAD (ou personagem índice 3)
        if stringStartsWith(getProperty('dad.animation.name'), 'sing') then
            if walkDown then
                setProperty('dad.y', 190)
            else
                setProperty('dad.y', 200)
            end
        end
    end
 end
end
--caso vc queira fazer uma chart de um remix de um shucks muito foda tá aqui um jeito mais fácil
function shucksEvent(tag)
if tag == 1 then
--remove dorVideo
setProperty('door.alpha', 0)
runHaxeCode([[
game.uiGroup.alpha = 0;
]])
--ta com deficiência que não aparece?
setProperty('boyfriend.alpha', 1)
--sfd
playAnim('boyfriend', 'anim', true);
setProperty('boyfriend.specialAnim', true)
elseif tag == 2 then
doTweenAlpha('detgShit', 'dad', 1, (stepCrochet / 1000)*20, 'circInOut')
--teste
doTweenX('Teste1', 'camFollow', -80, (stepCrochet / 1000)*20, 'circInOut')
doTweenY('teste2', 'camFollow', -25, (stepCrochet / 1000)*20, 'circInOut')
--ta
zoomShit(1,(stepCrochet / 1000) * 20,'circInOut')
elseif tag == 3 then
local duration = (stepCrochet / 1000) * 16
noteShit('tween', 1, 0, duration, 'circInOut')
elseif tag == 4 then
runHaxeCode([[
FlxTween.tween(game.uiGroup, {alpha: 1, y: 0}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.circInOut});
]])
--calmo
doTweenX('Teste1', 'camFollow', 275, (stepCrochet / 1000)*20, 'circInOut')
doTweenY('teste2', 'camFollow', 0, (stepCrochet / 1000)*20, 'circInOut')
--ta
zoomShit(0.75,(stepCrochet / 1000) * 16,'circInOut')
elseif tag == 5 then
-- Fade do HUD (substitui camHUD.fade)
runHaxeCode([[
FlxTween.tween(game.uiGroup, {alpha: 0}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.circInOut});
]])
runTimer('afterFade', (stepCrochet / 1000) * 4)
elseif tag == 6 then
--uh
setProperty('isCameraOnForcedPos', false)
--don't care
noteShit('alpha', 1, 0, (stepCrochet / 1000) * 16, 'circInOut')
runHaxeCode([[
FlxTween.tween(game.uiGroup, {alpha: 1}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.circInOut});
]])
elseif tag == 7 then
cameraFlash('camHUD', 'FF000E', 0.5, true)
elseif tag == 8 then
runHaxeCode([[
FlxTween.tween(game.getLuaObject('songcard'), {alpha: 1}, (Conductor.stepCrochet / 1000) * 8);
FlxTween.tween(game.getLuaObject('songcard'), {alpha: 0}, (Conductor.stepCrochet / 1000) * 16, {startDelay: (Conductor.stepCrochet / 1000) * 24});
]])
elseif tag == 9 then
tweenShader('brightness', 0, -50, (stepCrochet / 1000) * 16)
tweenShader('hue', -10, -10, (stepCrochet / 1000) * 16)
tweenShader('saturation', 0, 50, (stepCrochet / 1000) * 16)
tweenShader('contrast', 30, 100, (stepCrochet / 1000) * 16)
elseif tag == 10 then
tweenShader('brightness', -50, 0, (stepCrochet / 1000) * 16)
tweenShader('hue', -10, -10, (stepCrochet / 1000) * 16)
tweenShader('saturation', 50, -10, (stepCrochet / 1000) * 16)
tweenShader('contrast', 100, 30, (stepCrochet / 1000) * 16)
elseif tag == 11 then
setProperty('gf.cameraPosition[0]', -25)
setProperty('gf.cameraPosition[1]', 475)
elseif tag == 12 then
noteShit('alpha', 0, 0, (stepCrochet / 1000) * 16, 'circInOut')
--ok this is Very dumb
if downscroll then
runHaxeCode([[
FlxTween.tween(game.uiGroup, {alpha: 0, y: -FlxG.height}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.circInOut});
]])
else
runHaxeCode([[
FlxTween.tween(game.uiGroup, {alpha: 0, y: FlxG.height}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.circInOut});
]])
end
elseif tag == 13 then
tweenShader('brightness', 0, -50, (stepCrochet / 1000) * 16)
tweenShader('hue', -10, -10, (stepCrochet / 1000) * 16)
tweenShader('saturation', 0, 50, (stepCrochet / 1000) * 16)
tweenShader('contrast', 30, 100, (stepCrochet / 1000) * 16)
elseif tag == 14 then
onCreateCutscene('cutscene', 'shucks', 0, 0)
setProperty('cutscene.alpha', 0)
elseif tag == 15 then
local time = (stepCrochet / 1000) * 8
-- Fade da câmera principal (camGame)
bloodyGeral(false,'')
runTimer('afterFadeChair', time) -- Espera o fade terminar pra executar o resto
-- Tweens equivalentes
doTweenAlpha('damnnnn', 'camGame', 0, time, 'circInOut')
noteShit('alpha', 0, 0, time, 'circInOut')
--uh
if downscroll then
runHaxeCode([[
FlxTween.tween(game.uiGroup, {alpha: 0, y: -FlxG.height}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.circInOut});
]])
else
runHaxeCode([[
FlxTween.tween(game.uiGroup, {alpha: 0, y: FlxG.height}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.circInOut});
]])
end
--a
doTweenAlpha('videoFade', 'cutscene', 1, time, 'linear')
elseif tag == 16 then
setProperty('defaultCamZoom', 0.4)
setProperty('camGame.zoom', 0.4)
runHaxeCode([[
game.uiGroup.alpha = 1;
]])
-- Faz um fade nas notas e depois ajusta as câmeras
noteShit('alpha', 1, 0, (stepCrochet / 1000) * 16, 'circInOut')
runTimer('camNotesFade', (stepCrochet / 1000) * 17)
--uh
if middlescroll then
oppX = -1200
else
oppX = -640
end
--kay
for i=0,3 do --just to be safe
setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultOpponentStrumX'..i] + oppX)
end
if not middlescroll then
for i=0,3 do --just to be safe
setPropertyFromGroup('playerStrums', i, 'x', _G['defaultOpponentStrumX'..i])
end
end
elseif tag == 17 then
setProperty('cutscene.alpha', 0)
setProperty('camGame.alpha', 1)
setProperty('text.alpha', 1)
playAnim('text', 'text', true)
doTweenAlpha('textFade', 'text', 0, 4.5, 'cubeInOut')
--cutscene da cadeira
chairCutscene()
--shader
if shadersEnabled then
setShaderFloat('temporaryShader1', "hue", -10)
setShaderFloat('temporaryShader1', "saturation", 30)
setShaderFloat('temporaryShader1', "contrast", 50)
setShaderFloat('temporaryShader1', "brightness", -30)
end
elseif tag == 18 then
for i=0,3 do
--detg note
noteTweenX("o2"..i, i, _G['defaultOpponentStrumX'..i], (stepCrochet / 1000) * 16,"circInOut");
end
if not middlescroll then
for i=4,7 do
--marvin
noteTweenX("oi2"..i, i, _G['defaultPlayerStrumX'..i - 4], (stepCrochet / 1000) * 16,"circInOut");
end
end
runHaxeCode([[
FlxTween.tween(game.uiGroup, {y: 0}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.circInOut});
]])
elseif tag == 19 then
triggerEvent('Camera Zoom', '', '0.8,ata,8,expo,Out,direct')
elseif tag == 20 then
--marvin
triggerEvent('Camera Movement', '1', 'false,8,expo,Out')
elseif tag == 21 then
--detg
triggerEvent('Camera Movement', '0', 'false,8,expo,Out')
elseif tag == 22 then
triggerEvent('Camera Zoom', '', '0.4,ata,8,expo,Out,direct')
triggerEvent('Camera Position', '880', '160,true,8,expo,Out')
elseif tag == 23 then
onCreateCutscene('run', 'run', 0, 0)
elseif tag == 24 then
noteShit('alpha', 0, 0, (stepCrochet / 1000) * 4, 'circInOut')
if downscroll then
runHaxeCode([[
FlxTween.tween(game.uiGroup, {alpha: 0, y: -FlxG.height}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.circInOut});
]])
else
runHaxeCode([[
FlxTween.tween(game.uiGroup, {alpha: 0, y: FlxG.height}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.circInOut});
]])
end
setProperty('defaultCamZoom', 1)
setProperty('camGame.zoom', 1)
--ja troca aqui logo
triggerEvent('Change Character', 'bf', 'marvin-shucks-run');
triggerEvent('Change Character', 'dad', 'detg-run');
runBg = true
--alpha nigga
setProperty('gf.alpha', 0)
elseif tag == 25 then
noteShit('alpha', 1, 0, (stepCrochet / 1000) * 4, 'circInOut')
runHaxeCode([[
FlxTween.tween(game.uiGroup, {alpha: 1, y: 0}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.circInOut});
]])
elseif tag == 26 then
setProperty('run.alpha', 0)
cameraFlash('camGame', 'FF000E', (stepCrochet / 1000) * 4, true)
--uh
for _, things2 in pairs(things2) do 
setProperty(things2..'.alpha', 0)
end
--vai toma no cu
runDuetShit = true
--corre marvin
setProperty('hallway.alpha', 1) 
playAnim('hallway', 'intro', true)
--damn
runHaxeCode([[
game.getLuaObject('hallway').animation.finishCallback = (introAnim:String) -> {
if (introAnim == 'intro')
game.getLuaObject('hallway').playAnim("loop", true);
};
]])
--ok
setProperty('gf.alpha', 0)
setProperty('torture.alpha', 0)
setProperty('marvinleg.alpha', 1)
 --ajeita
setPosition('dad', 400, 190)
setPosition('boyfriend', 600, 200)
--uii
triggerEvent('Camera Position', '627.5', '353,false,8,expo,Out')
--anim
playAnim('dad', 'intro', true);
setProperty('dad.specialAnim', true)
--a
runHaxeCode([[
game.dad.animation.finishCallback = (introAnim:String) -> {
if (introAnim == 'intro')
game.getLuaObject('detgleg').alpha = 1;
};
]])
if shadersEnabled then
setShaderFloat('temporaryShader1', "hue", -10)
setShaderFloat('temporaryShader1', "saturation", 7)
setShaderFloat('temporaryShader1', "contrast", 35)
setShaderFloat('temporaryShader1', "brightness", 3)
end
elseif tag == 27 then
triggerEvent('Camera Zoom', '', '2,ata,16,cube,InOut,direct')
triggerEvent('Camera Position', '927.5', '400,true,16,cube,InOut')
elseif tag == 28 then
triggerEvent('Camera Position', '527.5', '300,false,16,cube,InOut')
elseif tag == 29 then
playAnim('hallway', 'bodies', true);
--ta
triggerEvent('Camera Zoom', '', '1,ata,8,expo,Out,direct')
triggerEvent('Camera Position', '627.5', '353,true,8,expo,Out')
elseif tag == 30 then
marvinDandoFuga()
elseif tag == 31 then
noteShit('alpha', 0, 0, (stepCrochet / 1000) * 24, 'linear')
--ai
detgFall()
--ok
gaelzinho = true
end
end

function onStepHit()
if not gaelzinho then
if songName:lower() == 'shucks' then
if curStep == 72 then
shucksEvent(1)
elseif curStep == 154 then
shucksEvent(2)
elseif curStep == 176 then
shucksEvent(3)
elseif curStep == 304 then
shucksEvent(4)
elseif curStep == 452 then
shucksEvent(5)
elseif curStep == 464 or curStep == 3616 then
--vocal no volume 1
elseif curStep == 528 then
shucksEvent(6)
elseif curStep == 544 then
shucksEvent(7)
elseif curStep == 808 then
shucksEvent(8)
elseif curStep == 1312 then
shucksEvent(9)
elseif curStep == 1472 then
shucksEvent(10)
elseif curStep == 2124 then
shucksEvent(11)
elseif curStep == 2400 then
shucksEvent(12)
elseif curStep == 3088 then
shucksEvent(13)
elseif curStep == 3565 then --3568
shucksEvent(14)
elseif curStep == 3600 then
shucksEvent(15)
elseif curStep == 3872 then
shucksEvent(16)
elseif curStep == 3889 then
shucksEvent(17)
elseif curStep == 3952 then
shucksEvent(18)
elseif curStep == 4015 then
shucksEvent(19)
elseif curStep == 4016 or curStep == 4032 or curStep == 4048 or curStep == 4064 or curStep == 4088 or curStep == 4104 or curStep  == 4120 or curStep == 4136 then
shucksEvent(20)
elseif curStep == 4024 or curStep == 4040 or curStep == 4056 or curStep == 4072 or curStep == 4096 or curStep  == 4112 or curStep == 4128 then
shucksEvent(21)
elseif curStep == 4144 then
shucksEvent(22)
elseif curStep == 4383 then --4383
shucksEvent(23)
elseif curStep == 4396 then
shucksEvent(24)
elseif curStep == 4412 then
shucksEvent(25)
elseif curStep == 4416 then
shucksEvent(26)
elseif curStep == 4672 then
shucksEvent(27)
elseif curStep == 4696 then
shucksEvent(28)
elseif curStep == 4704 then
shucksEvent(29)
elseif curStep == 4972 then 
shucksEvent(30)
elseif curStep == 4976 then
shucksEvent(31)
end
end
--uh
if songName:lower() == 'shucks-v4' then
if curStep == 95 then
shucksEvent(1)
elseif curStep == 175 then
shucksEvent(2)
elseif curStep == 191 then
shucksEvent(3)
elseif curStep == 323 then
shucksEvent(4)
elseif curStep == 460 then
shucksEvent(5)
elseif curStep == 548 then
shucksEvent(6)
elseif curStep == 803 then
shucksEvent(8)
elseif curStep == 1312 or curStep == 2085 or curStep == 4947 then
shucksEvent(9)
elseif curStep == 1572 or curStep == 2340 or curStep == 5202 then
shucksEvent(10)
elseif curStep == 2884 then
shucksEvent(11)
elseif curStep == 3012 then
shucksEvent(12)
elseif curStep == 3582 then
shucksEvent(14)
elseif curStep == 3620 then
shucksEvent(15)
elseif curStep == 3885 then
shucksEvent(16)
elseif curStep == 3907 then
shucksEvent(17)
elseif curStep == 4028 then
shucksEvent(18)
elseif curStep == 4161 then
shucksEvent(19)
elseif curStep == 4163 or curStep == 4228 or curStep == 4291 or curStep == 4355 or curStep == 4407 then
shucksEvent(21)
elseif curStep == 4195 or curStep == 4259 or curStep == 4323 or curStep == 4387 then
shucksEvent(20)
elseif curStep == 4408 then --4416
shucksEvent(23)
elseif curStep == 4416 then
shucksEvent(24)
elseif curStep == 4432 then
shucksEvent(25)
elseif curStep == 4436 then
shucksEvent(26)
elseif curStep == 5186 then
shucksEvent(27)
elseif curStep == 5200 then
shucksEvent(28)
elseif curStep == 5203 then
shucksEvent(29)
elseif curStep == 6471 then
shucksEvent(30)
elseif curStep == 6475 then     
shucksEvent(31)
end
end
end
--ta
end
--fall part
function marvinDandoFuga()
--marvin
doTweenX('bfX', 'boyfriend', 1770, 1, 'circInOut')
doTweenY('bfY', 'boyfriend', 650, 1, 'circInOut')
doTweenX('bfScaleX', 'boyfriend.scale', 3.3, 1, 'circInOut')
doTweenY('bfScaleY', 'boyfriend.scale', 3.3, 1, 'circInOut')
--pernas
doTweenX('legX', 'marvinleg', 1770, 1, 'circInOut')
doTweenY('legY', 'marvinleg', 505, 1, 'circInOut')
doTweenX('legScaleX', 'marvinleg.scale', 3.3, 1, 'circInOut')
doTweenY('legScaleY', 'marvinleg.scale', 3.3, 1, 'circInOut')
end

function detgFall()
--damn
doTweenAlpha('hudFade', 'camHUD', 0, (stepCrochet / 1000) * 24, 'linear')
--a
setProperty('detgleg.alpha', 0)
--pera kkk
setProperty('dad.x', getProperty('dad.x') + 60)
setProperty('dad.y', getProperty('dad.y') + 100)
--shit
playAnim('dad', 'fall', true);
setProperty('dad.specialAnim', true)
--hall
playAnim('hallway', 'end', true)
--NOOOOOOOOO!!!
runHaxeCode([[
game.dad.animation.finishCallback = (introAnim:String) -> {
if (introAnim == 'fall')
game.dad.alpha = 0;
FlxTween.tween(game.camGame, {alpha: 0}, (Conductor.stepCrochet / 1000) * 24);
};
]])
end
--bruh
function onEvent(name, value1, value2)
if name == 'Change Character' then
if value1 == 'gf' then
if value2 == 'rose-shucks-dead' then
--hud
noteShit('alpha', 1, 0, (stepCrochet / 1000) * 16, 'circInOut')
runHaxeCode([[
FlxTween.tween(game.uiGroup, {alpha: 1, y: 0}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.circInOut});        
]])
--icon/blood anim
runHaxeCode([[
game.iconP1.changeIcon('marvin-shucks-bloody');
]])
bloodyGeral(true, '-alt')
--shader
if songName:lower() == 'shucks-v4' then
shucksEvent(13)
end
end
end
end
--ok
end
--ta
function chairCutscene()
--alpha
setProperty('chair_introtop.alpha', 1)
setProperty('chair_introbottom.alpha', 1)
--da play na anim
playAnim('chair_introtop', 'intro', true);
playAnim('chair_introbottom', 'intro', true);
--marvin
runHaxeCode([[
game.getLuaObject('chair_introtop').animation.finishCallback = (introAnim:String)->{
if (introAnim == 'intro')
game.getLuaObject('chair_introtop').alpha = 0; 
};
]])
runTimer('marvinChair', 0.35)
--detg
runHaxeCode([[
game.getLuaObject('chair_introbottom').animation.finishCallback = (introAnim:String)->{
if (introAnim == 'intro')
game.dad.alpha = 1;
game.gf.alpha = 1;
game.getLuaObject('chair_introbottom').alpha = 0; 
};
]])
end
-- Função auxiliar: flicker da câmera
function flickerCamera(duration, interval)
local loops = math.floor(duration / interval)
local visible = false
runTimer('flickerLoop', interval, loops)
end

function zoomShit(zoom,timer,ease)
if zoom == nil then zoom = 1 end
if timer == nil then timer = 1 end
if ease == nil then ease = 'linear' end
--ok
cancelTween('zoomIn')
doTweenZoom('zoomIn', 'camGame', zoom, timer, ease)
setProperty('defaultCamZoom', zoom)
end

function setPosition(who,x,y)
--criei a melhor coisa sem querer
runHaxeCode([[
game.]]..who..[[.setPosition(]]..x..[[, ]]..y..[[);
]])
end

function destroyThings(tag)
runHaxeCode([[
game.getLuaObject("]]..tag..[[").destroy();
]])
end

function chairTorture()
setObjectOrder('gfGroup', getObjectOrder('boyfriendGroup') + 1)
end

function onCreateCutscene(name,video,x,y)
callScript('scripts/videoShit=sprite', 'onCreateVideo', {name,video,x,y,cam})
end

function activateScene()
setProperty('health', 1)
--aproveitando
cancelTween('bfOut')
--ok
for _, things in pairs(things) do 
setProperty(things..'.alpha', 1)
end
--ok v2
setProperty('glow3.alpha', 0.6)
setProperty('darknessred.alpha', 0.7)
--ok
if shadersEnabled then
--bloom shader
setShaderFloat('temporaryShader2', "Threshold", 0.005)
setShaderFloat('temporaryShader2', "Intensity", 1)
end
end

function tweenShader(param, from, to, duration)
if shadersEnabled then
runHaxeCode([[
var startValue:Float = ]]..tostring(from)..[[;
var endValue:Float = ]]..tostring(to)..[[;
var tweenDuration:Float = ]]..tostring(duration)..[[;
//shit
var shader = game.getLuaObject("temporaryShader1", false).shader;
if (shader != null) {
FlxTween.num(startValue, endValue, tweenDuration, {ease: FlxEase.quartOut}, function(v:Float) {
shader.setFloat("]]..param..[[", v);
});
}else{
trace("Shader does not exist");
}
]])
end
end
--ta feio isso aqui
function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'afterFade' then
        for i=0,3 do --just to be safe
			setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
			setPropertyFromGroup('playerStrums', i, 'alpha', 0)
		end
        --setProperty('camHUD.alpha', 0)
        runHaxeCode([[
        game.uiGroup.alpha = 0;
        ]])
        setProperty('camGame.visible', false)
        -- Flicker da câmera
        flickerCamera((stepCrochet / 1000) * 4, stepCrochet / 2500)
        -- Aplicar stage, strum e ícones
        activateScene()
        --ok
        triggerEvent('Change Character', 'bf', 'marvin-shucks');
        triggerEvent('Change Character', 'dad', 'detg');
        --damn
        if shadersEnabled then
        --bloom shader
        setShaderFloat('temporaryShader2', "Threshold", 0.005)
        setShaderFloat('temporaryShader2', "Intensity", 1)
        --ColorCorrection shader
        setShaderFloat('temporaryShader1', "hue", -10)
        setShaderFloat('temporaryShader1', "saturation", -10)
        setShaderFloat('temporaryShader1', "contrast", 30)
        setShaderFloat('temporaryShader1', "brightness", 0)
        end     
        --setProperty('dad.cameraPosition[0]', 325)
        --setProperty('dad.cameraPosition[1]', 675)

        setProperty('defaultCamZoom', 0.4)
        setProperty('camGame.zoom', 0.4)
    end
    if tag == 'flickerLoop' then
        setProperty('camGame.visible', not getProperty('camGame.visible'))
        if loopsLeft == 0 then
            setProperty('camGame.visible', true)
        end
    end
    if tag == 'afterFadeChair' then
        -- Troca o stage
        for _, things in pairs(things) do 
        setProperty(things..'.alpha', 0)
        end
        for _, things2 in pairs(things2) do 
        setProperty(things2..'.alpha', 1)
       end
       --troca
       triggerEvent('Change Character', 'bf', 'marvin-shucks-chair');
       triggerEvent('Change Character', 'dad', 'detg-chair');
       triggerEvent('Change Character', 'gf', 'detg-saw');   
       --ta(tira isso depois)
       triggerEvent('Camera Position', '880', '160,true,8,expo,Out')
       --posição
       setPosition('gf', -180, 350)
       setPosition('dad',-370, -340) -- -330
       setPosition('boyfriend', 520, 0)
       --isso aqui serve pra colocar a (gf/serra) por cima do (marvin/player)
       chairTorture()
        --isso aqui e para não atrapalhar na intro da cadeira
        setProperty('boyfriend.alpha', 0)
        setProperty('dad.alpha', 0)
        setProperty('gf.alpha', 0)
    end
if tag == 'camNotesFade' then
--ta
for i=0,3 do --just to be safe
setPropertyFromGroup('opponentStrums', i, 'alpha', 0.25)
end
--treze
end
if tag == 'marvinChair' then
setProperty('boyfriend.alpha', 1)
end
end