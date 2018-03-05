class TicketTechnology < ApplicationRecord
  belongs_to :ticket
  belongs_to :technology
end
