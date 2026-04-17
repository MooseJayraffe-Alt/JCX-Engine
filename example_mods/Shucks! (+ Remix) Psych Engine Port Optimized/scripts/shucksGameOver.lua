local path = 'menus/gameover/shucks/'
function onGameOverStart()
if curStage == 'shucks' then
setProperty('boyfriend.alpha', 0)
--ok
makeLuaSprite('black', '', 0, 0)
makeGraphic('black', screenWidth * 3.5, screenHeight * 3.5, '000000')    
screenCenter('black')
dieCam('black', 'dieCam')
addLuaSprite('black', true)    
--fade
doTweenAlpha('blackFade', 'black', 0, 4, 'expoOut')
--shader
if shadersEnabled then
--uh
initLuaShader('coloredVignette')
setProperty('camOther.alpha', 1)
--uh
makeLuaSprite('vignette')
setSpriteShader('vignette', 'coloredVignette')
setShaderFloat("vignette", "strength", 1.0)
setShaderFloat("vignette", "amount", 1.0)
setShaderFloatArray("vignette", "color", {0,0,0})
--meu gato tá pulando tudo aqui na minha casa
runHaxeCode([[
game.camOther.setFilters([new ShaderFilter(game.getLuaObject("vignette").shader)]);
]])
addHaxeLibrary("vignette", "openfl.filters")
end
--lol
makeLuaSprite('table', path..'table', 0, 0)
dieCam('table', 'dieCam')
addLuaSprite('table')

makeLuaSprite('glow', path..'glow', 0, 0)
dieCam('glow', 'dieCam')
setBlendMode('glow', 'ADD')
addLuaSprite('glow')

makeLuaSprite('retry', path..'boner', 438, 370)
dieCam('retry', 'dieCam')
setBlendMode('glow', 'MUTLIPLY')
addLuaSprite('retry')
end
end 

function onGameOverConfirm(retry)
if curStage == 'shucks' then
if retry then
doTweenAlpha('blackFade', 'black', 1, 4, 'expoOut')
end
end
end