class RemoveFinishedFromTickets < ActiveRecord::Migration[5.1]
  def change
    remove_column :tickets, :finished
  end
end
