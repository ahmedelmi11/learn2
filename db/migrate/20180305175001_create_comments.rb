class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user
      t.references :ticket

      t.timestamps
    end
  end
end
