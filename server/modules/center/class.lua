Center = {
    GetJobById = function(jobId)
        if not jobId then return nil end

        for _, v in pairs(Config.Jobs) do
            if v.id == jobId then
                return v
            end
        end

        return false
    end,

    HasJobRequirements = function(source, jobId)
        if not source or not jobId then return end

        local job = Center.GetJobById(jobId)
        if not job then return end

        if not job.requirements or not next(job.requirements) then
            return true
        end

        for _,v in pairs(job.requirements) do
            if v.type == 'item' then
                if not lib.Inventory.HasPlayerItem(source, v.value, v.args) then
                    return false
                end
            elseif v.type == 'money' then
                if lib.Framework.Money.Get(source, v.value) < v.args then
                    return false
                end
            end
        end

        return true
    end,
}