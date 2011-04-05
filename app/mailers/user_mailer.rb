class UserMailer < ActionMailer::Base
  default :from => ActionMailer::Base.smtp_settings[:from]
  
  def invitation_email(invitation)
    @invitation = invitation
    @url  = "http://example.com/login"
    mail(:to => @invitation.recipient_email,
      :subject => "#{@invitation.user.login} has invited you to Invitator!")
  end

end
