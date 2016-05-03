require_relative 'site'
require_relative 'povestka_get'

write_content(return_content(Config::PUBLICS), Config::DATAFILE)

run Sinatra::Application