function onCreate()
--CAMERAS EVERYWHERE OH GOD AAAAAAAAAAAAAAAA
--caralho num e que funciona? kkkkkk decidi juntar tudo e deu certo
--ok agora isso ficou um pouquinho grande d+
runHaxeCode([[
//ta
var vidCam;
var camOv;
var dieCam;
var camPause;
//isla....
FlxG.cameras.remove(game.camHUD, false);
FlxG.cameras.remove(game.camOther, false);

camOv = new FlxCamera();
camOv.bgColor = 0x00;
vidCam = new FlxCamera();
vidCam.bgColor = 0x00;
camPause = new FlxCamera();
camPause.bgColor = 0x00;
dieCam = new FlxCamera();
dieCam.bgColor = 0x00;

FlxG.cameras.add(camOv, false);
FlxG.cameras.add(vidCam, false);
FlxG.cameras.add(dieCam, false);
FlxG.cameras.add(game.camHUD, false);
FlxG.cameras.add(game.camOther, false);
FlxG.cameras.add(camPause, false);

createGlobalCallback('camOv', function(tag:String){game.getLuaObject(tag).camera = camOv;});
setVar('camOv',camOv);
createGlobalCallback('vidCam', function(tag:String){game.getLuaObject(tag).camera = vidCam;});
setVar('vidCam',vidCam);
createGlobalCallback('camPause', function(tag:String){game.getLuaObject(tag).camera = camPause;});
setVar('camPause',camPause);
createGlobalCallback('dieCam', function(tag:String){game.getLuaObject(tag).camera = dieCam;});
setVar('dieCam',dieCam);
]])
end