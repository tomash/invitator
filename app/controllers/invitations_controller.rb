class InvitationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_resource, :only => [:destroy, :show]
  
  def index
    @invitations = current_user.invitations.all
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
  
  private
  def load_resource
    @invitation = Invitation.find(params[:id])
  end
end
