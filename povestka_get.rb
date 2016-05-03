require 'rest-client'
require 'json'

require_relative 'config'

def get_from_api(url)
  response = JSON.parse(RestClient.get(url))
  response.fetch("response").drop(1)
end

def get_public_posts(public_name, count=10)
  url = "https://api.vk.com/method/wall.get?domain=#{public_name}&count=#{count}"
  get_from_api(url)
end

def return_content(publics)
  @json = []
  publics.each do |public|
    @json += get_public_posts(public, Config::POST_COUNT)
  end
  @json.to_json
end

def write_content(content, file)
  File.open(file,"w") do |f|
    f.write(content)
    if Config::DEBUG == true
      puts 'Alive!'
    end
  end
end