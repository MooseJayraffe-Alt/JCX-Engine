function onStartCountdown()
if gfName == 'rose-shucks' then
playAnim('gf', 'idle-alt', false)
setProperty('gf.idleSuffix', '-alt')
runHaxeCode([[
game.gf.recalculateDanceIdle();
]])
end end
--damn
function onEvent(name, value1, value2)
if name == 'Camera Movement' then
local target = value1 or '1'
--uh
if target == '0' then
mustHitSectionRose = false
elseif target == '1' then
mustHitSectionRose = true
end
--dor
roseShit()
end
end
--ok
function roseShit()
if gfName == 'rose-shucks' then
local direction = mustHitSectionRose and 'lookingright' or 'lookingleft'
local idlePose = mustHitSectionRose and '-alt' or ''
if getProperty('gf.idleSuffix') ~= idlePose then
playAnim('gf', direction, true)
setProperty('gf.idleSuffix', idlePose)
runHaxeCode([[
game.gf.recalculateDanceIdle();
]])
setProperty('gf.danced', false)
end end end