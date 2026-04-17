local ye = 2.0
function onCreate()
makeAnimatedLuaSprite('runbg', 'stages/shucks/runhallway', 0, 0)
addAnimationByPrefix('runbg','intro','intro',24,false)
addAnimationByPrefix('runbg','loop','loop',24,false)
addAnimationByPrefix('runbg','bodies','bodies',24,false)
addAnimationByPrefix('runbg','end','end',24,false)
scaleObject('runbg', 2.02, 2.02)
setProperty('runbg.antialiasing', true)
addLuaSprite('runbg', false)
playAnim('runbg','loop')

makeAnimatedLuaSprite('run_legsdetg', 'stages/shucks/legs', 515, 600)
addAnimationByPrefix('run_legsdetg','detg','detg',24,true)
scaleObject('run_legsdetg', 0.6, 0.6)
addLuaSprite('run_legsdetg', false)

makeAnimatedLuaSprite('run_legsmarv', 'stages/shucks/legs', 1075, -5)
addAnimationByPrefix('run_legsmarv','marv','marv',24,true)
scaleObject('run_legsmarv', 1.45, 1.45)
addLuaSprite('run_legsmarv', false)

makeLuaSprite('run_multi', 'stages/shucks/runmulti', 0, 0)
scaleObject('run_multi', 4.5, 4.5)
setScrollFactor('run_multi', 1, 1)
--addLuaSprite('run_multi', false)

makeLuaSprite('run_dark', 'stages/shucks/rundarkness', 0, 0)
scaleObject('run_dark', 1, 1)
setScrollFactor('run_dark', 1, 1)
--addLuaSprite('run_dark', false)

makeLuaSprite('run_add', 'stages/shucks/runadd', 0, 0)
scaleObject('run_add', 5.25, 5.25)
setScrollFactor('run_add', 1, 1)
addLuaSprite('run_add', true)

makeLuaSprite('chair_bg', 'stages/shucks/chairbg', 0, 0)
scaleObject('chair_bg', 1, 1)
setScrollFactor('chair_bg', 1, 1)
addLuaSprite('chair_bg', false)

makeLuaSprite('chair_chair', 'stages/shucks/chair', 1152, 4 + 220)
scaleObject('chair_chair', 1, 1)
setScrollFactor('chair_chair', 1, 1)
addLuaSprite('chair_chair', false)

makeAnimatedLuaSprite('chair_introbottom', 'stages/shucks/chairintro/bottom', -70, 282)
addAnimationByPrefix('chair_introbottom','intro','intro',24, false)
scaleObject('chair_introbottom', 1.48, 1.48)
setScrollFactor('chair_introbottom', 1, 1)
addLuaSprite('chair_introbottom', true)

makeAnimatedLuaSprite('chair_introtop', 'stages/shucks/chairintro/top', -205, 15)
addAnimationByPrefix('chair_introtop','intro','intro',24, false)
scaleObject('chair_introtop', 1.48, 1.48)
setScrollFactor('chair_introtop', 1, 1)
addLuaSprite('chair_introtop', false)

makeLuaSprite('chair_glow', 'stages/shucks/chairglow', 0, 300)
scaleObject('chair_glow', 1, 1)
setScrollFactor('chair_glow', 1, 1)
addLuaSprite('chair_glow', false)
setProperty('chair_glow.blend', 0)
setProperty('chair_glow.alpha', 0.5)

makeAnimatedLuaSprite('chair_text', 'stages/shucks/ShucksText', 0, 130)
addAnimationByPrefix('chair_text','ShucksText ShucksText','ShucksText ShucksText',24, false)
scaleObject('chair_text', 3.9, 3.9)
setScrollFactor('chair_text', 1, 1)
addLuaSprite('chair_text', true)

--bg shucks xd

makeLuaSprite('p1_bg', 'stages/shucks/bg_', -1800, -1585)
scaleObject('p1_bg', 1, 1)
setScrollFactor('p1_bg', 1, 1)
addLuaSprite('p1_bg', false)

if not lowQuality then
makeAnimatedLuaSprite('p1_extralight', 'stages/shucks/bg', -1800, -1585)
addAnimationByPrefix('p1_extralight','extralight','extralight',0,true)
scaleObject('p1_extralight', 1, 1)
setScrollFactor('p1_extralight', 1.1, 1)
addLuaSprite('p1_extralight', false)
end

makeAnimatedLuaSprite('p1_light', 'stages/shucks/bg', -1800, -1600)
addAnimationByPrefix('p1_light','light','light',0,true)
scaleObject('p1_light', 1, 1)
setScrollFactor('p1_light', 1.1, 1)
addLuaSprite('p1_light', false)

makeLuaSprite('p1_glow2', 'stages/shucks/glow', 0, 0)
scaleObject('p1_glow2', 0.05, 0.05)
setScrollFactor('p1_glow2', 1, 1)
addLuaSprite('p1_glow2', false)
setObjectCamera('p1_glow2','hud')
setProperty('p1_glow2.alpha', 0.35)

if not lowQuality then
makeAnimatedLuaSprite('p1_glow', 'stages/shucks/bg', -1800, -1585)
addAnimationByPrefix('p1_glow','glow','glow',0,true)
scaleObject('p1_glow', 1, 1)
setScrollFactor('p1_glow', 1.1, 1)
addLuaSprite('p1_glow', false)
end

makeAnimatedLuaSprite('p1_chain', 'stages/shucks/bg', -1800, -1785)
addAnimationByPrefix('p1_chain','chain','chain',0,true)
scaleObject('p1_chain', 1, 1)
setScrollFactor('p1_chain', 0.8, 1)
addLuaSprite('p1_chain', false)

makeAnimatedLuaSprite('p1_hook', 'stages/shucks/bg', -1800, -1785)
addAnimationByPrefix('p1_hook','hook','hook',0,true)
scaleObject('p1_hook', 1, 1)
setScrollFactor('p1_hook', 0.7, 1)
addLuaSprite('p1_hook', true)

if not lowQuality then
makeLuaSprite('p1_darknessred', 'stages/shucks/darknessred', 0, 0)
scaleObject('p1_darknessred', 0.7, 0.7)
setObjectCamera('p1_darknessred','hud')
addLuaSprite('p1_darknessred', false)
setProperty('p1_darknessred.blend', 0)

makeLuaSprite('p1_darkness', 'stages/shucks/darknessInvert', -150, 0)
scaleObject('p1_darkness', 3.01, 3.05)
addLuaSprite('p1_darkness', false)
setObjectCamera('p1_darkness','hud')
setProperty('p1_darkness.alpha', 0.85)
setBlendMode('p1_darkness', 'SUBTRACT')
end
end

function onTimerCompleted(tag)
if tag == 'bf' then
setProperty('chair_introtop.visible', false)
setProperty('boyfriend.visible', true)
end
if tag == 'dad' then
setProperty('chair_introbottom.visible', false)
setProperty('dad.visible', true)
end
end

function onUpdatePost(elapsed)
local opt = {'p1_bg','p1_extralight','p1_light','p1_lightbase','p1_glow2','p1_glow','p1_glow3','p1_chain','p1_hook','p1_darknessred','chair_chair','chair_glow','chair_dark'}
for _, opt in ipairs (opt) do
scaleObject(opt, 1.0 + ye, 1.0 + ye)
end

local angle = math.sin(getSongPosition() / 1000) * 7.5
setProperty('p1_light.angle', angle)
setProperty('p1_glow.angle', angle)
end