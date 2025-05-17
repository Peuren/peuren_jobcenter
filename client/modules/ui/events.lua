RegisterNuiCallback("close", function(data, cb)
    UI.Close()
    cb(true)
end)

RegisterNuiCallback("start-working", function(job, cb)
    if not job then return end

    local result = lib.Framework.Callbacks.Trigger("peuren_jobcenter:selectJob", job)
    if not result then return end

    UI.Close()
    cb('ok')
end)
