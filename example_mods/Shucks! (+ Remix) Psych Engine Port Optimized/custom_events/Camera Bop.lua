function onEvent(name, value1, value2)
if name == 'Camera Bop' then
-- Converte valores e evita erros com tonumber falhando
camBopIntensity = tonumber(value1) or 0   
--damn
triggerEvent('Add Camera Zoom', camBopIntensity, camBopIntensity);
end
end