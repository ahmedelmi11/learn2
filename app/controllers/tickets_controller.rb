class TicketsController < ApplicationController
  before_action :find_ticket, only: [:update, :edit, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @tickets = Ticket.where(state: 'paid')
  end

  def show
    @ticket_technology = TicketTechnology.new
    @comment = Comment.new
    @comments = Comment.where(ticket: @ticket)
  end

  def accept_ticket
    @ticket = Ticket.find(params[:ticket_id])
    @ticket.teacher_id = current_user.id
    if @ticket.save
      flash[:notice] = "Ticket taken"
      @ticket.active!
      redirect_to ticket_path(@ticket)
    else
      flash[:alert] = "Ticket not taken"
      redirect_to ticket_path(@ticket)
    end
  end

  def mark_ticket_finished
    @ticket = Ticket.find(params[:ticket_id])
    @ticket.teacher_id = current_user.id
    if @ticket.active?
      flash[:notice] = "Ticket Finished"
      @ticket.finished!
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Ticket not marked as finished"
      redirect_to ticket_path(@ticket)
    end
  end

  def edit
  end

  def update
    if @ticket.update(tickets_params)
      TicketTechnology.where(ticket_id: @ticket.id).destroy_all
      create_ticket_technologies(@ticket)
      flash[:notice] = "Ticket was successfully updated"
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
    @ticket.sku = "todo"
    @ticket.price = 10
    @ticket.student_id = current_user.id
    if @ticket.save
      create_ticket_technologies(@ticket)
      redirect_to ticket_path(@ticket)
      flash[:notice] = "Ticket was successfully created"
    else
      render :new
    end
  end

  def create_video_chat
    @ticket = Ticket.find(params[:ticket_id])
    message =  "Join me on this video session\n" + "https://appear.in/learn2_#{@ticket.id}_#{@ticket.student.email}"
    @comment = Comment.new(ticket: @ticket, user: current_user, content: message)
    @comment.save
    redirect_to ticket_path(@ticket)
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
    params.require(:ticket).permit(:description, :finished, :title, :ticket_sku, :state)
  end
end


