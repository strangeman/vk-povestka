require_relative 'site'
require_relative 'lib/povestka_get'

write_content(return_content(Config::PUBLICS), Config::DATAFILE)

run Sinatra::Application