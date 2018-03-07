class TicketsController < ApplicationController
  before_action :find_ticket, only: [:update, :edit, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket_technology = TicketTechnology.new
  end

  def edit
  end

  def update
    if @ticket.update(tickets_params)
      TicketTechnology.where(ticket_id: @ticket.id).destroy_all
      create_ticket_technologies(@ticket)
      flash[:notice] = "Ticket was succesfully updated"
      redirect_to ticket_path(@ticket)
    else
      render :edit
    end
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(tickets_params)
    @ticket.student_id = current_user.id
    if @ticket.save
      create_ticket_technologies(@ticket)
      flash[:notice] = "Ticket was succesfully created"
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  private

  def create_ticket_technologies(ticket)
    params[:ticket][:ticket_technologies][:technology_id].each do |tech_id|
      ticket_technology = TicketTechnology.new(technology_id: tech_id,  ticket_id: ticket.id)
      ticket_technology.save
    end
  end

  def find_ticket
    @ticket = Ticket.find(params[:id])
  end

  def tickets_params
    params.require(:ticket).permit(:description, :finished, :title)
  end
end


