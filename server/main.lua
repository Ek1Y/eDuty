ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('eDuty:on')
AddEventHandler('eDuty:on', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local posao = xPlayer.job.name
    local grade = xPlayer.job.grade
    
    if posao == 'offpolice' then
        xPlayer.setJob('police', grade)
        TriggerClientEvent('esx:showNotification', _source, 'Usao si na duznost')
    elseif posao == 'offambulance' then
        xPlayer.setJob('ambulance', grade)
        TriggerClientEvent('esx:showNotification', _source, 'Usao si na duznost')
    end
end)

RegisterServerEvent('eDuty:off')
AddEventHandler('eDuty:off', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local posao = xPlayer.job.name
    local grade = xPlayer.job.grade
    
    if posao == 'police' or posao == 'ambulance' then
        xPlayer.setJob('off' ..posao, grade)
        TriggerClientEvent('esx:showNotification', _source, 'Izasao si sa duznosti')
    end
end)