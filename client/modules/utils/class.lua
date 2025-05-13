Utils = {
    Data = {},
    
    ---Laods model
    ---@param model string
    LoadModel = function(model)
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(0)
        end
    end,

    ---Loads animation dictionaries
    ---@param dict string
    LoadAnimDict = function(dict)
        while not HasAnimDictLoaded(dict) do
            RequestAnimDict(dict)
            Wait(100)
        end
    end,
}