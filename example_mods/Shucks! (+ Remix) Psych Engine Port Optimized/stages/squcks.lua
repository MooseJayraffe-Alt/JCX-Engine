local squcks = 'stages/squcks/'
local AHHH = nil
local songcard = nil

function onCreate()
makeLuaSprite('squckbg', squcks..'squckbg', 323, 140)
scaleObject('squckbg', 4, 4)
addLuaSprite('squckbg', false)
    
makeLuaSprite('mult', squcks..'mult', -264, -207)
scaleObject('mult', 1.5, 1.3)
setBlendMode('mult', 'MULTIPLY')
addLuaSprite('mult', false)

makeLuaSprite('add', squcks..'light2', -275, -207)
scaleObject('add', 1.5, 1.3)
setBlendMode('add', 'ADD')
addLuaSprite('add', false)

makeLuaSprite('mult2', squcks..'darknessred', -259, -217)
scaleObject('mult2', 1.56, 1.26)
setProperty('mult2.alpha', 0.85)
addLuaSprite('mult2', false)
--macumba
if seenCutscene then
setProperty('skipCountdown',true)
end
end
--damn
function onCreatePost()
    setProperty('defaultCamZoom', 1)
    setProperty('camGame.zoom', 1)
    setProperty('gf.alpha', 0)
    setProperty('camNotes.alpha', 0)
    setProperty('camZooming', true)    
    -- Cria e aplica o shader
    if shadersEnabled then
    initLuaShader('bwoutline')
    --shader
    setCameraShader('bwoutlineShader','camGame','bwoutline')
    --things
    setShaderFloat('bwoutline', 'lowerBound', 0.01)
    setShaderFloat('bwoutline', 'upperBound', 0.2)
    setShaderBool('bwoutline', 'invert', true)
    end
    -- Configura as câmeras
    if downscroll then
    runHaxeCode([[
    game.uiGroup.y = -FlxG.height;
    ]])
    for i=0,3 do --just to be safe
	setPropertyFromGroup('opponentStrums', i, 'y', screenHeight)
	setPropertyFromGroup('playerStrums', i, 'y', screenHeight)
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
    -- Cria o sprite da songcard
    makeLuaSprite('songcard', 'game/cards/squcks', 0, 0)
    setProperty('songcard.antialiasing', getPropertyFromClass('ClientPrefs', 'data.globalAntialiasing'))
    setProperty('songcard.scrollFactor.x', 0)
    setProperty('songcard.scrollFactor.y', 0)
    setObjectCamera('songcard', 'camOther')
    screenCenter('songcard')
    addLuaSprite('songcard', true)
    --uh
    setProperty('camOther.alpha', 0)
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

function setCameraShader(tag,cam,shader)
    makeLuaSprite(tag, '', 0,0)  
    setProperty(tag..".alpha", 0)
    addLuaSprite(tag, false)  
    --ok
    setSpriteShader(tag, shader)
    --ok
    runHaxeCode([[
    game.]]..cam..[[.setFilters([new ShaderFilter(game.getLuaObject("]]..tag..[[").shader)]);
    ]])
    addHaxeLibrary(tag, "openfl.filters")
end

function removeCameraShader(tag)
setProperty(tag..'.filters', nil)
end

function onStepHit()
    if curStep == 12 then
        setProperty('camGame.visible', false)
        if shadersEnabled then
        removeCameraShader('camGame')
        end
    elseif curStep == 16 then
        setProperty('camGame.visible', true)

        local t = stepCrochet / 1000 * 16
        doTweenAlpha('camOtherAlpha', 'camOther', 1, t, 'circInOut')
        noteShit('tween', 1, 0, t, 'circInOut')
        noteShit('alpha', 1, 0, t, 'circInOut')

        runHaxeCode([[
        FlxTween.tween(game.uiGroup, {alpha: 1, y: 0}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.circInOut});
        ]])
        runHaxeCode([[
        FlxTween.tween(game.getLuaObject('songcard'), {alpha: 0}, (Conductor.stepCrochet / 1000) * 16, {startDelay: (Conductor.stepCrochet / 1000) * 64});
        ]])
    elseif curStep == 398 then
        restartSong(true)
    end
end

function onUpdate(elapsed)
    setProperty('iconP2.angle', getSongPosition())

    if getProperty('songcard.alpha') ~= 0 then
        local scaleX = (2 + math.sin(getSongPosition() / 500)) / 2
        local scaleY = (2 + -math.sin(getSongPosition() / 500)) / 2
        setProperty('songcard.scale.x', scaleX)
        setProperty('songcard.scale.y', scaleY)
    end
end

function onEndSong()
    -- Cancela o fim da música
    return Function_Stop
end