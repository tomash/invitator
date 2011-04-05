require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  def setup
    @user = Factory(:user, :login => 'joe')
    @user.profile.update_attributes(Factory.attributes_for(:profile))
  end
  
  test "should redirect to edit if profile is not valid (filled)" do
    sign_in Factory(:user)
    get :show
    assert_response :redirect
  end

  test "should get show when profile exists" do
    sign_in @user
    get :show
    assert_response :success
  end

end
