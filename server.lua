local AntiTazePlayers = true
local DistanceMaxTaze = 20 -- max distance taze... nemojte dirati!
AddEventHandler("weaponDamageEvent", function(sender, data)
    if AntiTazePlayers then
        local _src = sender
        local osobaaa = NetworkGetEntityFromNetworkId(data.hitGlobalId)
        if DoesEntityExist(osobaaa) and IsPedAPlayer(osobaaa) then
            local udaljenostigraca = #(GetEntityCoords(GetPlayerPed(_src)) - GetEntityCoords(osobaaa))
            if _src and data.weaponType == 911657153 or data.weaponType == `WEAPON_STUNGUN` then
                if udaljenostigraca >= DistanceMaxTaze then
                    CancelEvent()
                    DropPlayer(_src, "Pokusaj da taze uradis preko cheata! Uhvatio te Tinky :)")
                end
            end
        end
    end
end)
