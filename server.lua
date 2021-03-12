ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local allowedJobs = {
    'police'
}

local kickMessage = 'Stop trying to taze other players!'

AddEventHandler('weaponDamageEvent', function(sender, data)
    local allowed = false
    if sender ~= nil then
        if data.damageType ~= 0 then
            if data.weaponDamage == 1 then
                local xPlayer = ESX.GetPlayerFromId(sender)
                if xPlayer ~= nil then
                    for k, v in pairs(allowedJobs) do
                        if xPlayer.job ~= nil and xPlayer.job.name == v then 
                            allowed = true
                            break
                        end
                    end
                    if not allowed then 
                        CancelEvent()
                        DropPlayer(sender, kickMessage)
                    end
                end
            end
        end
    end
end)