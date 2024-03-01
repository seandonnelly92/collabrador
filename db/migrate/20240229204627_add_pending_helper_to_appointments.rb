class AddPendingHelperToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :pending_helper, :bigint
  end
end
