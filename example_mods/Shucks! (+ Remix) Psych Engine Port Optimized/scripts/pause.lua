local curPause = 0
local selectedYeah = false
local leftShit = {}
local rightShit = {}
local glowers = {}
local greyscale = false

function onPause()
if getProperty('canPause') then
openCustomSubstate('irida_pause', true)
lockConductor = true
if buildTarget ~= 'windows' then
setPropertyFromClass('flixel.FlxG', 'mouse.visible', true)
end
return Function_Stop
end
--isso aqui e para parar as Cutscenes 
function onUpdatePost(elapsed)
if lockConductor then
setPropertyFromClass('backend.Conductor', 'songPosition', lockTime)
end
end
end

function createIridaPause()
--blz
selectedYeah = false
--tween thing
runHaxeCode([[
var camPause = getVar('camPause');
//ta
camPause.alpha = 0;
camPause.zoom = 1.25;
FlxTween.tween(camPause, {alpha: 1, zoom: 1}, 0.5, {startDelay: 0.38, ease: FlxEase.cubeOut});
]])
--tweenShit
tweenIntroShit()
end

function onCreate()
if songName:lower() == 'shucks' or songName:lower() == 'shucks-v4' then
renderImage = 'shucks'
else
renderImage = 'nil'
end
end

function onCreatePost()
    setProperty('camPause.alpha', 0)
    -- Fundo vermelho multiplicado
    makeLuaSprite('red', nil, 0, 0)
    makeGraphic('red', screenWidth, screenHeight, 'cc0062')
    camPause('red', 'camPause')
    addLuaSprite('red', true)
    setBlendMode('red', 'multiply')
    -- barra esquerda
    makeLuaSprite('barl', 'menus/pause/barl', -300, 0)
    camPause('barl', 'camPause')
    addLuaSprite('barl', true)
    table.insert(leftShit, 'barl')

    local buttonNames = {'resume', 'restart', 'exit'}
    local buttonYs = {5, 197, 462}
    local glowYs = {0, 131, 472}

    for i = 1,3 do
        local btn = 'btn'..i
        makeLuaSprite(btn, 'menus/pause/'..buttonNames[i], -300, buttonYs[i])
        camPause(btn, 'camPause')
        addLuaSprite(btn, true)
        table.insert(leftShit, btn)     

        local glow = 'glow'..i
        makeLuaSprite(glow, 'menus/pause/'..buttonNames[i]..'-glow', -300, glowYs[i])
        setBlendMode(glow, 'add')
        camPause(glow, 'camPause')
        addLuaSprite(glow, true)
        table.insert(glowers, glow)        
    end
    -- barra direita
    makeLuaSprite('barr', 'menus/pause/barr', screenWidth + 300 - 641, 0)
    camPause('barr', 'camPause')
    addLuaSprite('barr', true)
    table.insert(rightShit, 'barr')    
    --dor
    render()
    -- barras sobrepostas
    makeLuaSprite('barroverlong', 'menus/pause/barroverlong', screenWidth + 300 - 818, screenHeight - 215)
    camPause('barroverlong', 'camPause')
    addLuaSprite('barroverlong', true)    
    table.insert(rightShit, 'barroverlong')

    makeLuaSprite('barroversmall', 'menus/pause/barroversmall', screenWidth + 300 - 442, screenHeight - 280)
    camPause('barroversmall', 'camPause')
    addLuaSprite('barroversmall', true)    
    table.insert(rightShit, 'barroversmall')

    makeLuaSprite('barrover', 'menus/pause/barrover', screenWidth + 300 - 201, 0)
    camPause('barrover', 'camPause')
    addLuaSprite('barrover', true)   
    table.insert(rightShit, 'barrover')
end

function render()
    renderOffset = {-100, 0}    
    -- Lista de músicas personalizadas
    makeLuaSprite('render', 'menus/pause/renders/'..renderImage, 0, 0)
    setProperty('render.antialiasing', getPropertyFromClass('ClientPrefs', 'data.globalAntialiasing'))
    -- Define posição
    local renderWidth = getProperty('render.width')
    local renderHeight = getProperty('render.height')
    setProperty('render.x', screenWidth + renderWidth + renderOffset[1])
    setProperty('render.y', screenHeight / 2 - renderHeight / 2 + renderOffset[2])
    -- Adiciona à câmera de pause
    camPause('render', 'camPause')
    addLuaSprite('render', true)
    table.insert(rightShit or {}, 'render')
end

function tweenIntroShit()
setProperty('red.alpha', 1)
doTweenX('barlIn', 'barl', 0, 1.3, 'expoOut')
--ta
for i = 1,3 do
bt = 'btn'..i
doTweenX(bt..'In', bt, 0, i + 3, 'expoOut')
--uh
glo = 'glow'..i
doTweenX(glo..'In', glo, 0, i + 3, 'expoOut')
end
--uh
doTweenX('barrIn', 'barr', screenWidth - 641, 1.2, 'expoOut')
doTweenX('barroverlongIn', 'barroverlong', screenWidth - 818, 1.5, 'expoOut')
doTweenX('barroversmallIn', 'barroversmall', screenWidth - 442, 2, 'expoOut')
doTweenX('barroverIn', 'barrover', screenWidth - 201, 2, 'expoOut')
doTweenX('renderIn', 'render', 580, 1.5, 'expoOut')
end

function evaporaTweensExplodam()
--okCancelTweens
cancelTween('barlIn')
for i = 1,3 do
b = 'btn'..i
cancelTween(b..'In')
gl = 'glow'..i
cancelTween(gl..'In')
end
cancelTween('barrIn')
cancelTween('barroverlongIn')
cancelTween('barroversmallIn')
cancelTween('barroverIn')
cancelTween('renderIn')
end

function onCustomSubstateCreate(name)
if name == 'irida_pause' then
playSound('../music/pause-shucks', 1, 'iridaSongPause')
playSound('scrollMenu')
if buildTarget ~= 'windows' then
--android
makeLuaSprite('upButton', '', 0, 420)
makeGraphic('upButton', 150, 150, 'FF000C')    
setProperty('upButton.alpha', 0.7)
insertToCustomSubstate('upButton')
--massa
makeLuaSprite('downButton', '', 0, 570)
makeGraphic('downButton', 150, 150, '00F8FF')    
setProperty('downButton.alpha', 0.7)
insertToCustomSubstate('downButton')
--ui
makeLuaSprite('aButton', '', 1130, 570)
makeGraphic('aButton', 150, 150, '80FF00')    
setProperty('aButton.alpha', 0.7)
insertToCustomSubstate('aButton')
--uh
windowsOn = false
else
windowsOn = true
end
--blz
createIridaPause()
end
end

function onCustomSubstateUpdate(name)
if name == 'irida_pause' then
if selectedYeah then return end

if windowsOn then
if keyJustPressed('up') then
        curPause = curPause - 1
        if curPause < 0 then curPause = 2 end
        playSound('scrollMenu')
    elseif keyJustPressed('down') then
        curPause = curPause + 1
        if curPause > 2 then curPause = 0 end
        playSound('scrollMenu')
    elseif getProperty('controls.ACCEPT') then
        selectedYeah = true
        playSound('confirmMenu')
        fadeOutPause()
    end
else
if getMouseX('camOther') > getProperty('upButton.x') and getMouseY('camOther') > getProperty('upButton.y') and getMouseX('camOther') < getProperty('upButton.x') + getProperty('upButton.width') and getMouseY('camOther') < getProperty('upButton.y') + getProperty('upButton.height') and mouseReleased() then
        curPause = curPause - 1
        if curPause < 0 then curPause = 2 end
        playSound('scrollMenu')
    elseif getMouseX('camOther') > getProperty('downButton.x') and getMouseY('camOther') > getProperty('downButton.y') and getMouseX('camOther') < getProperty('downButton.x') + getProperty('downButton.width') and getMouseY('camOther') < getProperty('downButton.y') + getProperty('downButton.height') and mouseReleased() then
        curPause = curPause + 1
        if curPause > 2 then curPause = 0 end
        playSound('scrollMenu')
    elseif getMouseX('camOther') > getProperty('aButton.x') and getMouseY('camOther') > getProperty('aButton.y') and getMouseX('camOther') < getProperty('aButton.x') + getProperty('aButton.width') and getMouseY('camOther') < getProperty('aButton.y') + getProperty('aButton.height') and mouseReleased() then
        selectedYeah = true
        playSound('confirmMenu')
        fadeOutPause()
    end
end

    -- atualizar glow alpha
    for i = 1,3 do
        setProperty(glowers[i]..'.alpha', (curPause == i - 1) and 1 or 0.1)
end
end
end

function onCustomSubstateDestroy(name)
if name == 'irida_pause' then
stopSound('iridaSongPause')
if buildTarget ~= 'windows' then
setPropertyFromClass('flixel.FlxG', 'mouse.visible', false)
end
end
end

function onSoundFinished(tag)
if tag == 'iridaSongPause' then
playSound('../music/pause-shucks', 1, 'iridaSongPause')
end
end

function fadeOutPause()
    for i, spr in ipairs(leftShit) do
        doTweenX('leftOut'..i, spr, getProperty(spr..'.x') - screenWidth, 1, 'expoIn')
    end
    for i, spr in ipairs(rightShit) do
        doTweenX('rightOut'..i, spr, getProperty(spr..'.x') + screenWidth, 1, 'expoIn')
    end
    for i, spr in ipairs(glowers) do
        doTweenX('glowOut'..i, spr, getProperty(spr..'.x') - screenWidth, 1, 'expoIn')
    end
    --alpha
    doTweenAlpha('some', 'red', 0, 1, 'expoIn')
    evaporaTweensExplodam()
    --ok
    cancelTimer('pauseAction')
    runTimer('pauseAction', 0.8)
end

function onTimerCompleted(tag)
    if tag == 'pauseAction' then
        if curPause == 1 then
            restartSong()
        elseif curPause == 2 then
            exitSong()
        else
            closeCustomSubstate()
            lockConductor = false
        end
    end
end

function onDestroy()
if buildTarget ~= 'windows' then
setPropertyFromClass('flixel.FlxG', 'mouse.visible', true)
end
end