require 'json'

require_relative '../config'


def get_from_file(datafile)
  JSON.parse( IO.read(datafile, encoding:'utf-8') )
end

def return_sorted(content, sort="date")
  if sort == "likes" or sort == "comments"
    content.sort_by { |hsh| hsh[sort]["count"]}.reverse
  else
    content.sort_by { |hsh| hsh["date"]}.reverse
  end
end
