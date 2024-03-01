class AddTownTopets < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :town, :string
  end
end
