class AddColumnToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :breed, :string
  end
end
