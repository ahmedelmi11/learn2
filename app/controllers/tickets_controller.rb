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






  private
  def find_ticket
    @ticket = Ticket.find(params[:id])
  end
end



