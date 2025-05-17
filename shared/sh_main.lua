Config = {}

Config.JobCenter = {
    Ped = {
        model = 's_m_y_construct_01',--Job center ped model, model names can be found @ https://docs.fivem.net/docs/game-references/ped-models/
        pos = vec4(-545.31, -203.88, 38.22, 210.71),--Ped position
        animation = {--This controls dealer animation, if you don't want this, make it to: animation = false
            --Supported anim data format:
                -- anim = ''
                -- dict = ''
                -- scenario = ''
            --Examples:
                -- anim = 'missexile3'
                -- dict = 'ex03_dingy_search_case_base_michael'
            scenario = 'WORLD_HUMAN_CLIPBOARD'
        }
    },

    Blip = {
        sprite = 351,--Blip icon id
        color = 3,--Blip color id
        scale = 1.0,--Blip scale
        label = "Job Center",--Blip label
    },
}

Config.Jobs = {
    {
        id = 'towing',--job id
        title = 'Towing Service',--job title
        description = 'Help stranded motorists by providing professional towing services.',
        image = 'tow.png',
        icon = 'pi pi-truck',--https://primevue.org/icons/
        requirements = {
            { type = 'item', label = 'Drivers License', severity = 'info', value = 'phone', args = 1 },
            { type = 'money', label = '$500', severity = 'danger', value = 'bank', args = 500 }
        }
    },
    {
        id = 'garbage',--job id
        title = 'Garbage Collection',--job title
        description = 'Keep the city clean by collecting and disposing of waste.',
        image = 'garbage.png',
        icon = 'pi pi-inbox',--https://primevue.org/icons/
        requirements = {
            -- types: item or money
            -- label: label of the item or money amount
            -- severity: severity of the item or money (info, danger, success)
            -- value: item name or account type
            -- args: amount of item or money
            { type = 'item', label = 'Drivers License', severity = 'info', value = 'drivers_license', args = 1 },
            { type = 'money', label = '$500', severity = 'danger', value = 'bank', args = 100 },
        }
    },
    {
        id = 'delivery',--job id
        title = 'Package Delivery',--job title
        description = 'Deliver packages and parcels throughout the city.',
        image = 'delivery.png',
        icon = 'pi pi-box',--https://primevue.org/icons/
        requirements = {            
            -- types: item or money
            -- label: label of the item or money amount
            -- severity: severity of the item or money (info, danger, success)
            -- value: item name or account type
            -- args: amount of item or money
            { type = 'item', label = 'Drivers License', severity = 'info', value = 'drivers_license', args = 1 },
            { type = 'money', label = '$500', severity = 'danger', value = 'bank', args = 100 }
        }
    },
    {
        id = 'mining',--job id
        title = 'Mining',--job title
        description = 'Extract valuable resources from the mines.',
        image = 'miner.png',
        icon = 'pi pi-compass',--https://primevue.org/icons/
        requirements = {
            -- types: item or money
            -- label: label of the item or money amount
            -- severity: severity of the item or money (info, danger, success)
            -- value: item name or account type
            -- args: amount of item or money
            { type = 'item', label = 'Drivers License', severity = 'info', value = 'drivers_license', args = 1 },
            { type = 'money', label = '$500', severity = 'danger', value = 'bank', args = 100 }
        }
    },
    {
        id = 'farmer',--job id
        title = 'Farming',--job title
        description = 'Farm plants and make money.',
        image = 'farmer.png',
        icon = 'pi pi-home',--https://primevue.org/icons/
        requirements = {
            -- types: item or money
            -- label: label of the item or money amount
            -- severity: severity of the item or money (info, danger, success)
            -- value: item name or account type
            -- args: amount of item or money
            { type = 'item', label = 'Drivers License', severity = 'info', value = 'drivers_license', args = 1 },
            { type = 'money', label = '$500', severity = 'danger', value = 'bank', args = 100 }
        }
    },
    {
        id = 'gruppe6',--job id
        title = 'Gruppe sechs',--job title
        description = 'Transport money accross bank locations.',
        image = 'gruppe6.png',
        icon = 'pi pi-dollar',--https://primevue.org/icons/
        requirements = {
            -- types: item or money
            -- label: label of the item or money amount
            -- severity: severity of the item or money (info, danger, success)
            -- value: item name or account type
            -- args: amount of item or money
            { type = 'item', label = 'Drivers License', severity = 'info', value = 'drivers_license', args = 1 },
            { type = 'money', label = '$500', severity = 'danger', value = 'bank', args = 100 }
        }
    }
}