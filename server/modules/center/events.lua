lib.Framework.RegisterCallback('peuren_jobcenter:selectJob', function(source, cb, job)
    if not source or not job then return cb(false) end

    local hasRequired = Center.HasJobRequirements(source, job)
    if not hasRequired then
        TriggerClientEvent("peuren_lib:notify", source, lib.Locale('job_requirements'), nil, "error")
        return cb(false)
    end

    lib.Framework.Job.Set(source, job, 0)
    TriggerClientEvent("peuren_lib:notify", source, lib.Locale('job_started'), nil, "success")

    cb(true)
end)