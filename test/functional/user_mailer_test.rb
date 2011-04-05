require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def test_invitation_email
    @invitation = Factory(:invitation)
    # Send the email, then test that it got queued
    email = UserMailer.invitation_email(@invitation).deliver
    assert !ActionMailer::Base.deliveries.empty?
    
    assert_equal [@invitation.recipient_email], email.to
  end
end
