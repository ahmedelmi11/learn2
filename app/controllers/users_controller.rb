class UsersController < ApplicationController

  def show
    @user = current_user
    # @user_controller = UserController.new
  end



  def edit
    @user = current_user
  end


  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "User was succesfully updated"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def get_user_avatar
    url = "https://api.github.com/users/#{@user.github_username}"
    user_serialised = open(url).read
    user = JSON.parse(user_serialised)
    @user.github_avatar_url = user['']
  end

end
