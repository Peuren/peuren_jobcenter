UI = {
    isOpen = false,
    firstTime = true,
    currentPage = nil,

    Open = function(page, pageData)
        if UI.isOpen then return end

        if UI.firstTime then
            SendNUIMessage({
                type = "loadLocale",
                data = lib.Locale("ui")
            })
            UI.firstTime = false
        end

        SetNuiFocus(true, true)
        SendNUIMessage({
            type = "visible",
            value = true
        })

        SendNUIMessage({
            type = "open",
            page = page,
            pageData = pageData
        })

        UI.isOpen = true
        UI.currentPage = page
    end,

    Close = function()
        if not UI.isOpen then return end
        
        SetNuiFocus(false, false)
        SendNUIMessage({
            type = "visible",
            value = false
        })

        UI.currentPage = nil
        UI.isOpen = false
    end,
}