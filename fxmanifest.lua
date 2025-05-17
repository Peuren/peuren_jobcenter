fx_version 'cerulean'
game 'gta5'

author 'PEUREN DEVELOPMENT - peuren.tebex.io'
version '0.0.1'
lua54 'yes'

client_scripts { 'client/**/**' }
shared_script 'shared/sh_main.lua'
server_scripts { 'server/**/**' }

files {
    'locales/*.json',
    'web/images/**',
    'web/dist/**/**',
}

dependency 'peuren_lib'

-- ui_page "http://localhost:5173/"
ui_page "web/dist/index.html"