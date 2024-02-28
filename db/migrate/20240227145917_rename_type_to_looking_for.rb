class RenameTypeToLookingFor < ActiveRecord::Migration[7.1]
  def change
    rename_column :appointments, :type, :looking_for
  end
end
