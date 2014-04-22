require 'test_helper'

class ValidatorTest < ActiveSupport::TestCase

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

  test "invalid url2" do
    user = User.new({
      name: "New Person",
      website: "@!*@(*!@(#"
    })

    assert(user.website)

    assert !user.valid?, "invalid website should be invalid"
    assert user.errors[:website].present?

    assert_equal("@!*@(*!@(#", user.website.to_s)
  end

end