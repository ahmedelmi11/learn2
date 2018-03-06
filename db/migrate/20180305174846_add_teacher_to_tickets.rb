class AddTeacherToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :teacher_id, :integer, null: true
  end
end
