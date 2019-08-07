resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Program-casino adapted from [SF.L] Master' 

version '1.0'

dependencies {
	'es_extended'
}

client_scripts {
    '@es_extended/locale.lua',
	'locales/de.lua',
    'config.lua',
    'client/main.lua'
}
server_scripts {
    '@es_extended/locale.lua',
	'locales/de.lua',
    'config.lua',
    'server/main.lua'
}