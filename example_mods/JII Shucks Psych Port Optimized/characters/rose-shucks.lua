function onSectionHit()
if mustHitSection == true then
setProperty('gf.idleSuffix','-right')
end
if mustHitSection == false then
setProperty('gf.idleSuffix','-left')
end
end

function onCreatePost()
setProperty('gf.idleSuffix','-left')
end