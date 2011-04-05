class UserMailer < ActionMailer::Base
  default :from => ActionMailer::Base.smtp_settings[:from]
  default_url_options[:host] = APP_CONFIG['host']
  
  def invitation_email(invitation)
    @invitation = invitation
    @invitation_url = invitation_url(@invitation, :token => @invitation.token)
    mail(:to => @invitation.recipient_email,
      :subject => "#{@invitation.user.login} has invited you to Invitator!")
  end

end
