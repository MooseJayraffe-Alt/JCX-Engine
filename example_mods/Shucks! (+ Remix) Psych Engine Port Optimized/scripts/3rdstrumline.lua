animationsList = {}

local defaultstrumy
local noteoffset

local player3 = 'Rose Note' -- Change this to your LUA character
local isStrummin = true

function makeAnimationList()
	animationsList[0] = 'keyArrow' -- idle
	animationsList[1] = 'keyConfirm' -- key confirmed
	animationsList[2] = 'keyPressed' -- key miss
end

offsets = {};

function makeOffsets(object)
	offsets[0] = {x=36, y=36}
	offsets[1] = {x=61, y=59}
	offsets[2] = {x=34, y=34}
end

function onCreatePost()	
	if downscroll then
    	defaultstrumy = 570
    	fakeDefaultstrumy = 800
	    noteoffset = -570
	else
		defaultstrumy = 65
		fakeDefaultstrumy = -200
		noteoffset = 50
	end

	directions = {'left', 'down', 'up', 'right'}
	makeAnimationList()
	makeOffsets()

	for i=1, #directions do
		makeAnimatedLuaSprite('strum'..directions[i], 'game/notes/default', getPropertyFromGroup('opponentStrums', i-1, 'x') + 20, fakeDefaultstrumy)
		addAnimationByPrefix('strum'..directions[i], 'keyConfirm', directions[i]..' confirm', 24, false)
		addAnimationByPrefix('strum'..directions[i], 'keyPressed', directions[i]..' press', 24, false)
		addAnimationByPrefix('strum'..directions[i], 'keyArrow', 'arrow'..directions[i]:upper(), 24, false)
		setObjectCamera('strum'..directions[i], 'camHUD')
		scaleObject('strum'..directions[i], 0.7, 0.7)		
		addLuaSprite('strum'..directions[i])
		playAnimation('strum'..directions[i], 0, true)
	end
end

function playAnimation(character, animId, forced) -- thank you shadowmario :evil:
	-- 0 = keyArrow
	-- 1 = keyConfirm
	-- 2 = keyPressed
	animName = animationsList[animId]
	objectPlayAnimation(character, animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
	setProperty(character..'.offset.x', offsets[animId].x);
	setProperty(character..'.offset.y', offsets[animId].y);
	if animId == 1 then
		runTimer('stopanim'..character, 0.1)
	end
end

function onTimerCompleted(tag)
	if(string.sub(tag,1,8) == "stopanim") then
        	playAnimation(string.sub(tag,9), 0, true)
    	end
end

local direcnote = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
function onUpdatePost()
	for i=0, getProperty('notes.length')-1 do
		if getPropertyFromGroup('notes', i, 'noteType') == 'Rose Note' then
			if not isStrummin then
				return
			end

			noteX = getPropertyFromGroup('notes', i, 'x');
			noteY = getPropertyFromGroup('notes', i, 'y');

			setPropertyFromGroup('notes', i, 'ignoreNote', true)	
			setPropertyFromGroup('notes', i, 'alpha', 1)
			hitbox = 25;
			isSustainNote = getPropertyFromGroup('notes', i, 'isSustainNote');
			noteData = getPropertyFromGroup('notes', i, 'noteData');			
			strumY = getProperty('strum'..directions[noteData + 1]..'.y')	
			noteX = getProperty('strum'..directions[noteData + 1]..'.x')
			if downscroll then
				noteY = (noteY - strumY - noteoffset - offsets[0].x)
			else
				noteY = (noteY + noteoffset + offsets[0].x)
			end

			if isSustainNote then
				noteX = noteX + 32;
				--noteY = noteY
			end
			
			setPropertyFromGroup('notes', i, 'x', noteX)
			setPropertyFromGroup('notes', i, 'y', noteY)
			
			if math.abs(noteY - strumY) <= hitbox then
				playAnimation('strum'..directions[noteData+1], 1, false)
				triggerEvent('Play Animation',direcnote[noteData + 1], 'gf')
				removeFromGroup('notes', i)
			end
		end
	end
end

function onStepHit()
if songName:lower() == 'shucks' then
if curStep == 1884 then
Sup(0)
elseif curStep == 2400 then
Sup(1)
end
end
if songName:lower() == 'shucks-v4' then
if curStep == 2739 then
Sup(0)
elseif curStep == 3012 then
Sup(1)
end
end
end

function Sup(tag)
if tag == 0 then
for i=0,3 do
noteTweenX('outtaHere'..i..'TweenXOpp', i, _G['defaultOpponentStrumX'..i] - 1200, 2, 'expoOut')
end
for i=1, #directions do
doTweenY('a'..directions[i], 'strum'..directions[i], defaultstrumy, 2, 'circInOut')
end
elseif tag == 1 then
for i=0,3 do
noteTweenX('outtaHere'..i..'TweenXOpp', i, _G['defaultOpponentStrumX'..i], 2, 'expoOut')
end
for i=1, #directions do
doTweenY('a'..directions[i], 'strum'..directions[i], fakeDefaultstrumy, 2, 'circInOut')
end
end
end