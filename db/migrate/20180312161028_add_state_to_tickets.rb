class AddStateToTickets < ActiveRecord::Migration[5.1]
  def change
     add_column :tickets, :state, :string
  end
end
