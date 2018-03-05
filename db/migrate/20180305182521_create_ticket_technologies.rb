class CreateTicketTechnologies < ActiveRecord::Migration[5.1]
  def change
    create_table :ticket_technologies do |t|
      t.references :ticket, foreign_key: true
      t.references :technology, foreign_key: true

      t.timestamps
    end
  end
end
