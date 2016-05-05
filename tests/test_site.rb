require File.expand_path '../test_helper.rb', __FILE__

class SiteTest < MiniTest::Unit::TestCase

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_site_basic
    get '/'
    assert last_response.ok?
    assert last_response.body.include? "Новости Комсомольска"
    assert last_response.body.include? "uk-article"
  end
end