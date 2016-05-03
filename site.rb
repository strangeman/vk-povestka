require 'sinatra'
require 'tilt/erb'

require_relative 'povestka_get'
require_relative 'povestka_return'

Thread.new do # trivial example work thread
  while true do
    sleep 60
    write_content(return_content(Config::PUBLICS), Config::DATAFILE) 
  end
end

get '/' do
  @posts = return_sorted(get_from_file(Config::DATAFILE), "date")
  erb :date
end

get '/likes' do
  @posts = return_sorted(get_from_file(Config::DATAFILE), "likes")
  erb :date
end

get '/comments' do
  @posts = return_sorted(get_from_file(Config::DATAFILE), "comments")
  erb :date
end

get '/*' do
  redirect to('/')
end