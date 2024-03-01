class RemoveUserIdDefaultFromAppointments < ActiveRecord::Migration[7.1]
  def change
    change_column_null :appointments, :user_id, true
  end
end
