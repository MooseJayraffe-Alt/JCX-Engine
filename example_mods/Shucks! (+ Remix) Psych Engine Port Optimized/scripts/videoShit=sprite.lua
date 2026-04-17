--jeito mais simples pra criar video
function onCreateVideo(name,video,x,y,cam)
--pc shit
addHaxeLibrary('FlxVideo', 'hxcodec.flixel')
--damn
if x == nil then x = 0 end
if y == nil then y = 0 end
--fds
if buildTarget ~= 'windows' then
videoPath = callMethodFromClass('backend.Paths', 'video', {video})
--a
createInstance(name, 'backend.VideoSpriteManager', {x, y, 1280, 720})
addInstance(name)
end
--video
if buildTarget == 'windows' then
makeVideoSprite(name, video, x, y, cam, false)
else
callMethod(name..'.startVideo', {videoPath, false, 1})
end
--ok
setObjectOrder(name,getObjectOrder('noteGroup')-1)
--a
if cam == nil then
setObjectCamera(name, 'camHUD')
else
setObjectCamera(name, cam)
end
--ok
end

function onEvent(name, value1, value2)
if name == 'videoShit' then
onCreateVideo(value1,value2)
end
end