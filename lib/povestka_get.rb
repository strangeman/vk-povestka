require 'rest-client'
require 'json'

require_relative '../config'

def get_from_api(url)
  response = JSON.parse(RestClient.get(url))
  response.fetch("response").drop(1)
end

def get_public_posts(public_name, count=10)
  if count<=0 or count>100
    raise ArgumentError, "Records count should be more than 0 and no more than 100"
  elsif public_name == ''
    raise ArgumentError, "Public name shouldn't be empty"
  else
    url = "https://api.vk.com/method/wall.get?domain=#{public_name}&count=#{count}"
    get_from_api(url)
  end
end

def return_content(publics, count=nil)
  if publics.empty? 
    raise ArgumentError, "Define at least one public"
  end
  if count == nil
    count = Config::POST_COUNT
  end
  @json = []
  publics.each do |public|
    @json += get_public_posts(public, count)
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