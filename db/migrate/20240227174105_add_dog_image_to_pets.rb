class AddDogImageToPets < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :dog_image, :string
  end
end
