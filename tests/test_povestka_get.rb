require File.expand_path '../test_helper.rb', __FILE__

class MyTest < MiniTest::Unit::TestCase

  #include Rack::Test::Methods

  @@hash_fields = ['text', 'date', 'likes', 'comments', 'reposts']

  def test_get_from_api_basic
    @content = get_from_api("https://api.vk.com/method/wall.get?domain=drugsandbooze&count=10")
    assert_equal 10, @content.length
    @@hash_fields.each do |field|
      assert @content[0].has_key?(field)
    end
  end

  def test_return_content_basic
    @publics = ['drugsandbooze','shapi_to','varlamov']
    @content = JSON.parse(return_content(@publics, 20))
    assert_equal @publics.length*20, @content.length
    @@hash_fields.each do |field|
      assert @content[0].has_key?(field)
    end
  end

  def test_return_content_zero_publics
    @publics = []
    assert_raises(ArgumentError) {
      return_content(@publics, 20)
    }
  end

  def test_get_public_posts_empty_public_name
    assert_raises(ArgumentError) {
      get_public_posts('', 20)
    }
  end

  def test_get_public_posts_many_records
    assert_raises(ArgumentError) {
      get_public_posts('drugsandbooze', 1000)
    }
    assert_raises(ArgumentError) {
      get_public_posts('drugsandbooze', 'drugsandbooze')
    }
  end

end