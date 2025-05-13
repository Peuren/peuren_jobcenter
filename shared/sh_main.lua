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
        sprite = 477,--Blip icon id
        color = 5,--Blip color id
        scale = 1.0,--Blip scale
        label = "Job Center",--Blip label
    },
}

Config.Jobs = {
    {
        id = 'towing',
        title = 'Towing Service',
        description = 'Help stranded motorists by providing professional towing services.',
        image = 'tow.png',
        icon = 'pi pi-truck',
        rank = 2,
        requirements = {
            { type = 'license', label = 'Drivers License', severity = 'info' },
            { type = 'money', label = '$500', severity = 'danger' }
        }
    },
    {
        id = 'garbage',
        title = 'Garbage Collection',
        description = 'Keep the city clean by collecting and disposing of waste.',
        image = 'garbage.png',
        icon = 'pi pi-inbox',
        rank = 1,
        requirements = {
            { type = 'license', label = 'Drivers License', severity = 'info' }
        }
    },
    {
        id = 'delivery',
        title = 'Package Delivery',
        description = 'Deliver packages and parcels throughout the city.',
        image = 'delivery.png',
        icon = 'pi pi-box',
        rank = 1,
        requirements = {
            { type = 'license', label = 'Drivers License', severity = 'info' },
            { type = 'item', label = 'Phone', severity = 'warning' }
        }
    },
    {
        id = 'mining',
        title = 'Mining',
        description = 'Extract valuable resources from the mines.',
        image = 'miner.png',
        icon = 'pi pi-compass',
        rank = 5,
        requirements = {
            { type = 'item', label = 'Mining Tools', severity = 'warning' },
            { type = 'money', label = '$1000 Deposit', severity = 'danger' }
        }
    },
    {
        id = 'farmer',
        title = 'Farming',
        description = 'Farm plants and make money.',
        image = 'farmer.png',
        icon = 'fas fa-tractor',
        rank = 1,
        requirements = {
            { type = 'item', label = 'Mining Tools', severity = 'warning' },
            { type = 'money', label = '$1000 Deposit', severity = 'danger' }
        }
    },
    {
        id = 'gruppe6',
        title = 'Gruppe sechs',
        description = 'Transport money accross bank locations.',
        image = 'gruppe6.png',
        icon = 'fas fa-gun',
        rank = 1,
        requirements = {
            { type = 'item', label = 'Mining Tools', severity = 'warning' },
            { type = 'money', label = '$1000 Deposit', severity = 'danger' }
        }
    }
}