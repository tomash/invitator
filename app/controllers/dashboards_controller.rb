class DashboardsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :process_accepted_invitations
  
  def show
  end
  

end
