--this maybe sucks, idk
local str = 20

function goodNoteHit(_,d)
if curStage ~= 'squcks' then
if mustHitSection then
moveCam(d)
end
end
end

function opponentNoteHit(_,d)
if curStage ~= 'squcks' then
if not mustHitSection then
moveCam(d)
end
end
end

function moveCam(data)
    callMethod('camGame.targetOffset.set', {0,0})
    setProperty('camGame.targetOffset.'..(data%3==0 and 'x' or 'y'), str * (data%2==0 and -1 or 1))
    runTimer('resetCamera', (crochet/1000)*2)
    onTimerCompleted = function(tag) if tag == 'resetCamera' then
        callMethod('camGame.targetOffset.set', {0,0}) end
    end
end