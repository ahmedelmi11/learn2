class AddDefaultToTickets < ActiveRecord::Migration[5.1]
  def change
    change_column_default :tickets, :state, 'pending'
  end
end
