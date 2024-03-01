class RemoveAppointmentidDefaultFromReviews < ActiveRecord::Migration[7.1]
  def change
    change_column_null :reviews, :appointment_id, true
  end
end
