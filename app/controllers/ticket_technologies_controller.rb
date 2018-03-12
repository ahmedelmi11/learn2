class TicketTechnologiesController < ApplicationController
  def create
   @ticket_technology = TicketTechnology.new(ticket_technology_params)
   if @ticket_technology.save
    redirect_to new_ticket_payment_path(@ticket)
   else
    render :create
  end
end

private

def ticket_technology_params
 params.require(:ticket_technology).permit(:ticket_id, :technology_id)

end

end


