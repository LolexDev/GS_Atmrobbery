fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'GROVE SCRIPTS'

client_scripts{
    'client/main.lua',
}

server_scripts{
    'server/main.lua',
}

shared_scripts {
    'config.lua',
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',
    'locales/*.lua',
    'lib/functions.lua',
    '@ox_lib/init.lua',
}

dependencies {
    'ox_lib',
}