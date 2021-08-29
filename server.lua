ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local whitelisted_jobs = {'police', 'offpolice'}

local kick_message = 'Unauthorized Taze Detected!'

AddEventHandler('weaponDamageEvent', function(sender, data)
    local src = sender
    local src_name = GetPlayerName(src)
    if src_name ~= nil then
        if data.weaponType == 911657153 then --'WEAPON_STUNGUN'
            local xPlayer = ESX.GetPlayerFromId(src)
            if xPlayer ~= nil and xPlayer.job ~= nil then
                local allowed = false

                for k, v in pairs(whitelisted_jobs) do
                    if xPlayer.job.name == v then 
                        allowed = true
                        break
                    end
                end

                if not allowed then 
                    CancelEvent()
                    print('^1'..src_name..'^0 (ID: ^1'..src..'^0) has just been kicked for an unauthorized taze against another player!')
                    DropPlayer(src, kickMessage)
                end
            end
        end
    end
end)
