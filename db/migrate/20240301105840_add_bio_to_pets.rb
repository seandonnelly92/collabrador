class AddBioToPets < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :bio, :text
  end
end
