class UserTechnologiesController < ApplicationController

  def new
    # @user = User.find(params[:user_id])
    @user = current_user
    @user_technology = UserTechnology.new
  end


  def create
    @user = current_user
    @technology = Technology.find(params[:user_technology][:technology_id])
    @user_technology = UserTechnology.new(user: @user, technology: @technology)
    @user_technology.save
    redirect_to user_path(@user)
  end


  def destroy
  end

end
