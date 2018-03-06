class TicketsController < ApplicationController

  def edit
    @tickets = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket was succesfully updated"
      redirect_to_ticket_path(@ticket)
    else
      render 'edit'
    end
  end
end



