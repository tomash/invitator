class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def process_accepted_invitations
    session[:invitation_tokens].each do |token|
      Invitation.find_by_token(token).update_attributes({:acceptor_id => current_user.id})
    end
  rescue
    session[:invitation_tokens] = []
  end
end
