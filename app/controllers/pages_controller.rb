class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @student = User.find(current_user.id)
    @tickets = Ticket.where(student: current_user)
  end
end
