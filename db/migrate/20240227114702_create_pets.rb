class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :sex
      t.boolean :neutered_spayed
      t.string :size
      t.string :animal_type
      t.string :breed
      t.boolean :child_friendly
      t.boolean :cat_friendly
      t.boolean :dog_friendly
      t.boolean :hypoallergenic
      t.string :activity_needs
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
