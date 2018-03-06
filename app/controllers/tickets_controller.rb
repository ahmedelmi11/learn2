class TicketsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @tickets = Ticket.all
  end

  def show
  end

end
