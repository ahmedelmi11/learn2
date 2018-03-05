class AddStudentToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :student_id, :integer
  end
end
