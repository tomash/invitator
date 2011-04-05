class InvitationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :accept, :decline]
  before_filter :load_resource, :only => [:destroy, :show, :accept, :decline]
  before_filter :check_token, :only => [:show, :accept, :decline]
  
  def index
    redirect_to edit_profile_path, :notice => 'please fill profile' unless(current_user.profile.valid?)
    @invitations = current_user.invitations
    @accepted_invitations = current_user.received_invitations.where(:state => 'accepted')
    @declined_invitations = current_user.received_invitations.where(:state => 'declined')
  end
  
  def new
    respond_to do |format|
      format.html
      format.js do
        render :layout => false
      end
    end
  end
  
  def create
    @invitation = current_user.invitations.new(params[:invitation])
    respond_to do |format|
      if @invitation.save
        format.html { redirect_to invitations_path, :notice => 'success' }
        format.js   { render 'success' }
      else
        format.html { redirect_to invitations_path, :notice => 'failure' }
        format.js   { render 'failure' }
      end
    end
  end
  
  def destroy
    @invitation.destroy
    redirect_to invitations_path, :notice => 'deleted'
  end
  
  def show
    @invitation = Invitation.find(params[:id])
    render :layout => 'sign'
  end
  
  def accept
    @invitation = Invitation.find(params[:id])
    @invitation.update_attribute(:state, 'accepted')
    session[:invitation_tokens] ||= []
    session[:invitation_tokens] << @invitation.token
    redirect_to new_user_registration_path, :notice => 'invitation accepted, now please register'
  end
  
  def decline
    @invitation = Invitation.find(params[:id])
    @invitation.update_attribute(:state, 'declined')
    session[:invitation_tokens] ||= []
    session[:invitation_tokens] << @invitation.token
    redirect_to new_user_session_path, :notice => 'invitation declined'
  end
  
  private
  def load_resource
    @invitation = Invitation.find(params[:id])
  end
  
  def check_token
    redirect_to new_user_session_path unless(params[:token] == @invitation.token)
  end
end
