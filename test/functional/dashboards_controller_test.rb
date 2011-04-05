require 'test_helper'

class DashboardsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  def setup
    @user = Factory(:user, :login => 'joe')
  end
  
  test "should get show" do
    sign_in @user
    get :show
    assert_response :success
  end

end
