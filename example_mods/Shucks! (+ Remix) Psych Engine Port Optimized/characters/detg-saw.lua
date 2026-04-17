--so funciona se o oponente for o dbtg chair
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
if noteType ~= 'No Animation' then
if gfName == 'detg-saw' then
--okk
playAnim('gf', getProperty('singAnimations')[noteData+1], true)
setProperty('gf.holdTimer',0)
end
end
end