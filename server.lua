local kick_message = 'Unauthorized Taze Detected!'
AddEventHandler('weaponDamageEvent', function(sender, data)
    local src = sender
    local src_name = GetPlayerName(src)
    local osobadruga = NetworkGetEntityFromNetworkId(data.pedId)
    local udaljenost = #(GetEntityCoords(GetPlayerPed(src)) - GetEntityCoords(osobadruga)) -- Distance check..
    if src_name ~= nil then
        if data.weaponType == 911657153 then --'WEAPON_STUNGUN'
            if DoesEntityExist(osobadruga) and IsPedAPlayer(osobadruga) then
                if not GetSelectedPedWeapon(GetPlayerPed(src)) == 911657153 or udaljenost > 20 then
                    CancelEvent()
                    print('^1'..src_name..'^0 (ID: ^1'..src..'^0) has just been kicked for an unauthorized taze against another player! \n Distance between players: ' .. udaljenost)
                    DropPlayer(src, kick_message)
                end
            end
        end
    end
end)
