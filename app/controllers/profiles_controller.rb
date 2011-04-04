class ProfilesController < ApplicationController
  before_filter :authenticate_user!, :load_profile
  
  def edit
  end
  
  def update
    @profile.update_attributes!(params[:profile])
    redirect_to profile_path
  rescue
    render :edit
  end

  def show
    redirect_to edit_profile_path unless(@profile && @profile.valid?)
  end
  
  private
  def load_profile
    @profile = current_user.profile
  end

end
