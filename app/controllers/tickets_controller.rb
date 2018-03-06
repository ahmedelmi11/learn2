class TicketsController < ApplicationController
  before_action :find_ticket, only: [:update, :edit]

  def edit

  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket was succesfully updated"
      redirect_to_ticket_path(@ticket)
    else
      render 'edit'
    end
  end

  def create
    @ticket = Ticket.new(tickets_params)
    @ticket.student_id = current_user.id

    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  def new
    @ticket = Ticket.new
  end







  private
  def find_ticket
    @ticket = Ticket.find(params[:id])
  end

  def tickets_params
    params.require(:ticket).permit(:description, :finished, :title)
  end


end


