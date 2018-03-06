class AddColumnToTechnologies < ActiveRecord::Migration[5.1]
  def change
    add_column :technologies, :photo, :string
  end
end
