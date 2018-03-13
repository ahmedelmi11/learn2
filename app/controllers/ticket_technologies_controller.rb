class TicketTechnologiesController < ApplicationController
  def create
   @ticket_technology = TicketTechnology.new(ticket_technology_params)
  @ticket_technology.save

end

private

def ticket_technology_params
 params.require(:ticket_technology).permit(:ticket_id, :technology_id)
end

end


