ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'

require File.expand_path '../../lib/povestka_get.rb', __FILE__
require File.expand_path '../../lib/povestka_return.rb', __FILE__
require File.expand_path '../../site.rb', __FILE__