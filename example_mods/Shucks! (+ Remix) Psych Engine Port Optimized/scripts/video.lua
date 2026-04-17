function onEndSong()
if songName:lower() == 'shucks' or songName:lower() == 'shucks-v4' then
if not allowCountdown then
startVideo('endshucks');
setProperty('camGame.visible', false)
setProperty('camHUD.visible', false)
allowCountdown = true;
return Function_Stop;
end
return Function_Continue;
end
end