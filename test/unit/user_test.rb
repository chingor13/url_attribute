require 'test_helper'
require 'pp'

class UserTest < ActiveSupport::TestCase

  self.use_transactional_fixtures = true
  fixtures :users

  test "loading from db" do
    user = User.find(ActiveRecord::Fixtures.identify(:jeff))

    assert(user.website)
    assert_equal("http://chingr.com/", user.website.to_s)
  end

  test "creating" do
    user = User.new({
      name: "New Person",
      website: "github.com",
      stem: "google.com"
    })

    assert_difference "User.count", 1 do
      user.save
    end

    user = User.last
    assert_equal("http://github.com", user.website.to_s, "should normalize the url")
    assert_equal("google.com", user.stem.to_s, "should not normalize field marked as unnormalized")
    assert_nil(user.facebook)
  end

  test "blank url" do
    user = User.new({
      name: "New Person",
      website: ""
    })

    assert_equal("", user.website.to_s)
  end

  test "nil url" do
    user = User.new({
      name: "New Person",
      website: nil
    })

    assert_nil(user.website)
  end

  test "invalid url" do
    user = User.new({
      name: "New Person",
      website: "something totally invalid"
    })

    assert(user.website)

    assert !user.valid?, "invalid website should be invalid"
    assert user.errors[:website].present?

    assert_equal("something totally invalid", user.website.to_s)
  end
end