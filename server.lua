ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local allowedJobs = {
    'police',
    'offpolice'
}

local kickMessage = 'Unauthorized Tazed Detected'

AddEventHandler('weaponDamageEvent', function(sender, data)
    local allowed = false
    if sender ~= nil then
        local senderName = GetPlayerName(sender)
        if senderName ~= nil then
            if data.damageType ~= 0 then
                if data.weaponDamage == 1 then
                    local xPlayer = ESX.GetPlayerFromId(sender)
                    if xPlayer ~= nil then
                        local job, jobName = xPlayer.job, xPlayer.job.name
                        if job ~= nil and jobName ~= nil then
                            for k, v in pairs(allowedJobs) do
                                if jobName == v then 
                                    allowed = true
                                    break
                                end
                            end
                            if not allowed then 
                                CancelEvent()
                                print('^1'..senderName..'^0 (^1'..tonumber(sender)..'^0) has just been kicked for an unauthorized taze!')
                                DropPlayer(sender, kickMessage)
                            end
                        end
                    end
                end
            end
        end
    end
end)
