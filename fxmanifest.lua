fx_version 'cerulean'
games {'gta5'}

author 'scar'
description 'Automatically insert items into the DB'
version '1.0.0'
lua54 'yes'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
    'items.lua',
}