Center = {
    InZone = false,
    Data = { ped = nil },

    ---Spawns job center npc
    SpawnNpc = function()
        local data = Config.JobCenter.Ped
        if not data then return end

        Utils.LoadModel(data.model)
        local ped = CreatePed(4, data.model, data.pos.x, data.pos.y, data.pos.z - 1.0, data.pos.w, false, true)

        Center.Data.ped = ped

        local blip = Config.JobCenter.Blip
        if blip then
            local Blip = AddBlipForCoord(data.pos.x, data.pos.y, data.pos.z)
            SetBlipSprite(Blip, blip.sprite)
            SetBlipDisplay(Blip, 4)
            SetBlipColour(Blip, blip.color)
            SetBlipScale(Blip, blip.scale + 0.0)
            SetBlipAsShortRange(Blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(blip.label)
            EndTextCommandSetBlipName(Blip)
        end

        lib.Target.AddEntity(ped, {
            {
                name = lib.Locale('interact_with_job_npc'),
                icon = 'fas fa-user',
                label = lib.Locale('interact_with_job_npc'),
                onSelect = function()
                    UI.Open('center', Config.Jobs)
                end,
            }
        }, 2)

        if data.animation then
            if data.animation.dict then
                RequestAnimDict(data.animation.dict)
                TaskPlayAnim(ped, data.animation.dict, data.animation.clip, 3.0, 1.0, -1, 49, 0, false, false, false)
                RemoveAnimDict(data.animation.dict)
            elseif data.animation.scenario then
                TaskStartScenarioInPlace(ped, data.animation.scenario, 0, true)
            end
        end

        SetEntityAsMissionEntity(ped, true, false)
        FreezeEntityPosition(ped, true)
        SetPedCanRagdoll(ped, false)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetPedFleeAttributes(ped, 0, false)
        SetPedCombatAttributes(ped, 17, true)
        SetEntityInvincible(ped, true)
        SetPedSeeingRange(ped, 0)
    end,

    ---Deletes created job center npc ped
    Clear = function()
        DeleteEntity(Center.Data.ped)
        Center.Data.ped = nil
    end,
}