fx_version 'cerulean'
game 'gta5'

author 'VGroup'
description 'V-Core its a core and wrapper that can be used to create or use script for diffrent cores'
version '1.0.0'
lua54 'yes'

shared_scripts {
    'shared/main.lua',
    'config.lua',
    'shared/loader.lua',

}

client_scripts {
    'client/main.lua',
    'client/Modules/*.lua',
    'shared/Modules/*.lua'
} 

server_scripts {
    'server/main.lua',
    'server/Modules/*.lua',
    'shared/Modules/*.lua'
}

