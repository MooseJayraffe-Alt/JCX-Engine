function onUpdatePost(elapsed)
for i = 0, getProperty('notes.length') - 1 do
if getPropertyFromGroup('notes', i, 'noteType') == 'GF Sing' then
--setPropertyFromGroup('notes', i, 'visible', false)
end
end
end