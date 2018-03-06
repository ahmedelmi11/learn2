class TicketsController < ApplicationController
  def create
    @ticket = Ticket.new(tickets_params)
    @ticket.student_id = current_user.id

    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      raise
      render :new
    end
  end

  def new
    @ticket = Ticket.new
  end

  private
    def tickets_params
      params.require(:ticket).permit(:description, :finished, :title)
    end

end


