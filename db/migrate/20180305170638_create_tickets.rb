class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.boolean :finished, default: false

      t.timestamps
    end
  end
end
