class AddColumnToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :payment, :jsonb
  end
end
