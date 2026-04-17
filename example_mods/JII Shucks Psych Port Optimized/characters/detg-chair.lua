charsTable = {}
function onCreate()
createChar('tag','detg-saw', 650, 1000,true,'boyfriendGroup',1)
end

function createChar(tag,name,xpos,ypos,flip,order,prior)
runHaxeCode([[
var ]]..tag..[[ = new Character(]].. xpos ..[[,]].. ypos ..[[,"]].. name ..[[");
game.add(]]..tag..[[);
setVar(']]..tag..[[',]]..tag..[[);
]])
table.insert(charsTable,tag)
setObjectOrder(tag,getObjectOrder(order)+ prior )
end

function onCountdownTick(counter)
for _,v in pairs(charsTable) do
runHaxeCode([[
if (]]..counter..[[ % getVar("]]..v..[[").danceEveryNumBeats == 0 && getVar("]]..v..[[").animation.curAnim != null && !StringTools.startsWith(getVar("]]..v..[[").animation.curAnim.name, 'sing') && !getVar("]]..v..[[").stunned)
{
getVar("]]..v..[[").dance();
}
]]);
end
end

function onBeatHit()
	for _,v in pairs(charsTable) do
		runHaxeCode([[
			if (]]..curBeat..[[ % getVar("]]..v..[[").danceEveryNumBeats == 0 && getVar("]]..v..[[").animation.curAnim != null && !StringTools.startsWith(getVar("]]..v..[[").animation.curAnim.name, 'sing') && !getVar("]]..v..[[").stunned)
			{
				getVar("]]..v..[[").dance();
			}
		]]);
	end
end

function onUpdatePost()
setProperty('tag.flipX', false)
if getProperty('dad.visible') then
setProperty('tag.visible', true)
else
setProperty('tag.visible', false)
end
if dadName == 'detg-chair' then
setProperty('tag.visible', true)
else
setProperty('tag.visible', false)
end
end

function opponentNoteHit(i, d, t, s)
noteHitOrMiss(i, d, t, s, true)
end

function noteHitOrMiss(i, d, t, s, m)
animName = 'game.singAnimations['.. d ..']'
if t == '' or t == 'character sings too' then
if m then
anim = anim .. '+ "miss"'
end
runHaxeCode([[
getVar("tag").playAnim(]] .. animName .. [[, true);
getVar("tag").holdTimer = 0;
]])
end
end