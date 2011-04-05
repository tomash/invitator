require 'test_helper'

class InvitationsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  def setup
    @user = Factory(:user, :login => 'joe')
    @user.profile.update_attributes(Factory.attributes_for(:profile))
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_response :success
  end
end
