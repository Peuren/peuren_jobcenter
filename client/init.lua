lib = exports.peuren_lib:Core()
lib.LoadLocales()

local loaded = false

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() and not loaded then
        Center.SpawnNpc()
        loaded = true
    end
end)

RegisterNetEvent('peuren_lib:PlayerLoaded', function()
    if loaded then return end
    Center.SpawnNpc()
    loaded = true
end)