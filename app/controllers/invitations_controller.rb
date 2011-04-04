class InvitationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_resource, :only => [:destroy, :show]
  
  def index
    @invitations = current_user.invitations.all
  end
  
  def new
    respond_to do |format|
      # format.html # no html
      format.js do
        render :layout => false
      end
    end
  end
  
  def create
    @invitation = current_user.invitations.new(params[:invitation])
    respond_to do |format|
      if @invitation.save
        # format.html # no html
        format.js   { render 'success' }
      else
        # format.html # no html
        format.js   { render 'failure' }
      end
    end
  end
  
  private
  def load_resource
    @invitation = Invitation.find(params[:id])
  end
end
