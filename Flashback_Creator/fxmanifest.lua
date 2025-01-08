fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author '__ismael'
description 'Creator (character) System'
version '1.0.0'

client_scripts {'client/**/*', 'client/*'}
server_scripts {'@oxmysql/lib/MySQL.lua', 'server/**/*', 'server/*'}
shared_script 'shared/*.lua'

ui_page 'web/build/index.html'

files {
    'web/build/index.html',
    'web/build/assets/*.*',
    'web/images/**/*.*',
    'web/images/*.*'
}

escrow_ignore {
	'shared/*',
    'client/*',
    'server/*'
}
dependency '/assetpacks'