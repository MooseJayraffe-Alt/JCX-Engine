local flip = false
local hudS = {}
local shucks = {
{'- S++', 1},
{'- S', 0.95},
{'- A', 0.9},
{'- B', 0.85},
{'- C', 0.8},
{'- E', 0.7},
{'- F', 0.20},
{'- KYS.', 0.10}
}
local barX = 720

function onCreate()
    if songName:lower() == 'shucks' or songName:lower() == 'shucks-v4' then
    shadow = true
    --ok
    setPropertyFromClass('states.PlayState','SONG.arrowSkin','game/notes/shadow')
    splashImage = 'game/splashes/shadow'
    prefix = '-shadow'
    else
    setPropertyFromClass('states.PlayState','SONG.arrowSkin','game/notes/default')
    splashImage = 'game/splashes/default'
    prefix = ''
    end
end

local oldRating = nil
local oldComboDigits = {}
local ratingX = 1000
local ratingY = 400
local comboX = 1050
local comboY = 500

function goodNoteHit(id,d,t,s)
if not s then
spawnEnemySplash(d)
--ok
    local rating = getPropertyFromGroup("notes", id, "rating")
    local ratingTag = "ratingPopup"
    
    if oldRating then
        removeLuaSprite(oldRating, true)
        oldRating = nil
    end   
    
    makeLuaSprite(ratingTag, "game/score/"..rating..prefix)
    setObjectCamera(ratingTag, "camHUD")
    scaleObject(ratingTag, 0.4, 0.4)
    setProperty(ratingTag..".alpha", 1)
    setProperty(ratingTag..".x", ratingX)
    setProperty(ratingTag..".y", ratingY) 
    addLuaSprite(ratingTag)

    oldRating = ratingTag
    startTween(ratingTag..'fade', ratingTag, {alpha = 0}, 0.5, {ease = 'linear', startDelay = 1})
    --startTween(ratingTag..'Y', ratingTag, {y = getProperty(ratingTag..".y") + 200}, 2, {ease = 'linear', startDelay = 0.2})
    --combo part
    for _,tag in ipairs(oldComboDigits) do
        removeLuaSprite(tag, true)
    end
    oldComboDigits = {}
    local combo = getProperty("combo")
    local comboStr = tostring(combo)

    local spacing = 35             
    local totalWidth = (#comboStr - 1) * spacing
    local startX = comboX - (totalWidth / 2)

    for i = 1, #comboStr do
        local digit = comboStr:sub(i, i)
        local tag = "comboDigit_"..i

        makeLuaSprite(tag, "game/score/num"..digit..prefix)
        setObjectCamera(tag, "camHUD")
        scaleObject(tag, 0.3, 0.3)
        setProperty(tag..".alpha", 1)
        setProperty(tag..".x", startX + ((i - 1) * spacing))
        setProperty(tag..".y", comboY)
        addLuaSprite(tag)
        table.insert(oldComboDigits, tag)
        startTween(tag..'fade', tag, {alpha = 0}, 0.5, {ease = 'linear', startDelay = 1})
        --startTween(tag..'Y', ratingTag, {y = getProperty(tag..".y") + 200}, 2, {ease = 'linear', startDelay = 0.2})
  end
end
end

local splashID = 0
function spawnEnemySplash(d)
    splashID = splashID + 1
    local tag = 'enemySplash'..splashID
          
    local noteOffsets = {
    	x = getPropertyFromGroup('playerStrums', d, 'x'),
        y = getPropertyFromGroup('playerStrums', d, 'y')
     }   
    --offset
    noteSplashX = noteOffsets.x - 95
    noteSplashY = noteOffsets.y - 95
    -- Cria o splash
    makeAnimatedLuaSprite(tag, splashImage, noteSplashX, noteSplashY)
    -- Seleciona animação pela direção
    local anim = ''
    if d == 0 then anim = 'purple 1'
    elseif d == 1 then anim = 'blue 1'
    elseif d == 2 then anim = 'green 1'
    elseif d == 3 then anim = 'red 1'
    end    

    addAnimationByPrefix(tag, anim, 'note splash '..anim, 24, false)
    setObjectCamera(tag, 'camHUD')
    setProperty(tag..'.alpha', getPropertyFromGroup('playerStrums', d, 'alpha'))
    addLuaSprite(tag, true)
    --timer que os Splash vai de Vasco 
    runTimer('removeSplash_'..splashID, 0.2)
end

function onTimerCompleted(tag)
if string.sub(tag, 1, 13) == 'removeSplash_' then
local id = string.sub(tag, 14)
removeLuaSprite('enemySplash'..id, true)
end
if tag:find("fade") then
        local base = tag:gsub("fade", "")
        removeLuaSprite(base, true)
        if base == oldRating then
            oldRating = nil
        end
    end
end

function onSpawnNote(i)
setPropertyFromGroup('notes', i, 'rgbShader.enabled', false)
setPropertyFromGroup('notes', i, 'noteSplashData.useRGBShader', false)
callMethod('notes.members['..i..'].reloadNote', {''})
end

function onCreatePost()    
    -- Cria novo HUD visual
    if songName:lower() == 'shucks' or songName:lower() == 'shucks-v4' then
    onCreateHealthBarCustom('game/Healthbarnew shadow', barX, 720)
    else
    onCreateHealthBarCustom('game/Healthbarnew', barX, 720)
    end

    if downscroll then
    if songName:lower() == 'shucks' or songName:lower() == 'shucks-v4' then
        onCreateHealthBarCustom('game/shadow_down', barX, 670)
        else
        onCreateHealthBarCustom('game/healthbar_downscroll', barX, 670)
    end
    if not downscroll then
        setProperty('healthBar.y', 631)
    end
    end

    setProperty('healthBar.scale.x', 1.6)
    setProperty('healthBar.scale.y', 2.5)
    -- HUD Elements
    setProperty('scoreTxt.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('timeBar.bg.visible', false)
    --setProperty('timeTxt.visible', false)
    setTextSize('timeTxt', 70)
    if downscroll then
    setProperty('timeTxt.y', getProperty('timeTxt.y') - 80)
    else
    setProperty('timeTxt.y', getProperty('timeTxt.y') + 60)
    end
    if middlescroll then  
    setProperty('timeTxt.x', getProperty('timeTxt.x') + 400)
    end
    setTextFont('timeTxt', 'SuperMario256.ttf')
    setProperty('botplayTxt.y', getProperty('botplayTxt.y') - 40)
    --uh
    setProperty('comboGroup.visible', false)
    --k
    makeLuaText('iridaAccTxt', 'Accuracy: 0', getProperty('iridaAccTxt.width'), getProperty('scoreTxt.x')+290, getProperty('scoreTxt.y') - 20)
    setObjectCamera('iridaAccTxt', 'camHUD')
    addLuaText('iridaAccTxt')
    setTextFont('iridaAccTxt', 'SuperMario256.ttf')
    setTextSize('iridaAccTxt', 20)
    setTextAlignment('iridaAccTxt', 'center')
    setTextBorder('iridaAccTxt', 3, '000000')
    
    makeLuaText('iridaMissTxt', 'Misses: 0', getProperty('iridaMissTxt.width'), getProperty('scoreTxt.x')+580, getProperty('scoreTxt.y') - 20)
    setObjectCamera('iridaMissTxt', 'camHUD')
    addLuaText('iridaMissTxt')
    setTextFont('iridaMissTxt', 'SuperMario256.ttf')
    setTextSize('iridaMissTxt', 20)
    setTextAlignment('iridaMissTxt', 'center')
    setTextBorder('iridaMissTxt', 3, '000000')
    
    makeLuaText('iridaScoreTxt', 'Score: 0', getProperty('iridaScoreTxt.width'), getProperty('scoreTxt.x')+800, getProperty('scoreTxt.y') - 20)
    setObjectCamera('iridaScoreTxt', 'camHUD')
    addLuaText('iridaScoreTxt')
    setTextFont('iridaScoreTxt', 'SuperMario256.ttf')
    setTextSize('iridaScoreTxt', 20)
    setTextAlignment('iridaScoreTxt', 'center')
    setTextBorder('iridaScoreTxt', 3, '000000')    
    --uh
    hudS = {'healthBar.BG', 'healthBar', 'iconP1', 'iconP2', 'iridaAccTxt', 'iridaMissTxt', 'iridaScoreTxt'}
    --icons y position shit
    setProperty('iconP1.y', getProperty('iconP1.y') + 10)
    setProperty('iconP2.y', getProperty('iconP2.y') + 5)
end

function onStepHit()
if songName:lower() == 'shucks' then
if curStep == 452 then
healthBarDefault()
noteDefault()
end
end
if songName:lower() == 'shucks-v4' then
if curStep == 464 then
healthBarDefault()
noteDefault()
end
end
end

function noteDefault()
for i= 0,7 do
setPropertyFromGroup('strumLineNotes', i, 'texture', 'game/notes/default');
end
setPropertyFromClass('states.PlayState','SONG.arrowSkin','game/notes/default')
splashImage = 'game/splashes/default'
prefix = ''
end

function healthBarDefault()
shadow = false
 if downscroll then
onCreateHealthBarCustom('game/healthbar_downscroll', barX, 670)
else
onCreateHealthBarCustom('game/healthbarnew', barX, 720)
end
end

function onCreateHealthBarCustom(image,x,y) --nome meio grande né?
runHaxeCode([[
new FlxTimer().start(0.01, function(tmr:FlxTimer) {
game.healthBar.bg.loadGraphic(Paths.image("]]..image..[["));
game.healthBar.bg.offset.set(]]..x..[[, ]]..y..[[);
game.healthBar.bg.scale.set(0.6, 0.6);
});
]])
end

local accuracy = 0
local wife = '- [N/Y]'
function aiii()
for _, ratin in ipairs(shucks) do
if getProperty('ratingPercent') >= ratin[2] then
wife = ratin[1]
break
end
end    
end

function onUpdate()
aiii()
--nobru
songAcc = getProperty('ratingPercent')
setTextString('iridaAccTxt', 'Accuracy: '..(math.floor(songAcc * 10000) / 100)..' '..wife)
setTextString('iridaMissTxt', 'Misses: '..misses)
setTextString('iridaScoreTxt', 'Score: '..score..'')
--ok
for i = 0,7 do
setPropertyFromGroup('strumLineNotes', i, 'rgbShader.enabled', false)
end
if downscroll then
setProperty('iridaAccTxt.y', getProperty('scoreTxt.y') - 75)
setProperty('iridaMissTxt.y', getProperty('scoreTxt.y') - 75)
setProperty('iridaScoreTxt.y', getProperty('scoreTxt.y') - 75)
else
setProperty('iridaAccTxt.y', getProperty('scoreTxt.y') - 20)
setProperty('iridaMissTxt.y', getProperty('scoreTxt.y') - 20)
setProperty('iridaScoreTxt.y', getProperty('scoreTxt.y') - 20)
end    
end

function onUpdatePost(elapsed)
    --damn    
    setProperty('iconP1.x', 1060)
    setProperty('iconP2.x', 60)
    --a
    if shadow then
    setTextColor('timeTxt', 'FFFFFF')
    setTextColor('iridaAccTxt', 'FFFFFF')
    setTextColor('iridaMissTxt', 'FFFFFF')
    setTextColor('iridaScoreTxt', 'FFFFFF')
    else
    setTextColor('timeTxt', '8B0000')
    setTextColor('iridaAccTxt', '8B0000')
    setTextColor('iridaMissTxt', '8B0000')
    setTextColor('iridaScoreTxt', '8B0000')
    end
    runHaxeCode([[
    game.getLuaObject('iridaAccTxt').alpha = game.uiGroup.alpha;
    game.getLuaObject('iridaMissTxt').alpha = game.uiGroup.alpha;
    game.getLuaObject('iridaScoreTxt').alpha = game.uiGroup.alpha;
    ]])
    --porras
    for i = 0, getProperty('grpNoteSplashes.length')-1 do
    setPropertyFromGroup('grpNoteSplashes', i, 'alpha', 0)
    end
end

function fadeHUD(alpha, duration)
    for _, o in ipairs(hudS) do
        if o == 'hud' then
            doTweenAlpha(o..'_fade', o, alpha, duration, 'expoOut')
        else
            setProperty(o..'.visible', alpha == 1)
        end
    end
end