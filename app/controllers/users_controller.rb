class UsersController < ApplicationController

  def show
    @user = current_user
    @tickets = Ticket.all
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

end
