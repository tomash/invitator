require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  test "should have generated token" do
    @invitation = Factory(:invitation)
    assert_equal(40, @invitation.token.size)
  end
  
  test "should spawn many invitations for multiple emails" do
    assert_difference 'Invitation.count', +3 do 
      @invitation = Factory(:invitation, :recipient_email => 'd1@example.com,d2@example.com,d3@example.com')
    end
  end
  
  test "should send e-mail notification to addressate" do
    assert_difference 'ActionMailer::Base.deliveries.count', +1 do
      @invitation = Factory(:invitation, :recipient_email => 'bob@example.com')
    end
  end
    
end
