class UserTechnologiesController < ApplicationController

  def new
    # @user = User.find(params[:user_id])
    @user = current_user
    @user_technology = UserTechnology.new
  end


  def create
    @user = current_user
    create_user_technologies(@user)
    redirect_to user_path(@user)
  end


  def destroy
  end

  def create_user_technologies(user)
    UserTechnology.where(user: user).destroy_all
    params[:user][:user_technologies][:technology_id].each do |tech_id|
      user_technology = UserTechnology.new(technology_id: tech_id,  user_id: user.id)
      user_technology.save
    end
  end


end
