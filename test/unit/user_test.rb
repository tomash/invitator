require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should add an empty (invalid) profile after creation" do
    @user = Factory(:user)
    assert(!@user.profile.valid?)
  end
end
