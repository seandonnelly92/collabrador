class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def create
    start_date, end_date = date_range_params
    @owner = current_user

    @appointment = Appointment.new( start_date:, end_date:,
                                    location: appointment_params['location'],
                                    looking_for: appointment_params['looking_for'],
                                    pet_id: appointment_params['pet_id']
    )
    # @appointment.user = @owner

    if @appointment.save
      redirect_to user_profile_path
    else
      render '/pages/user_profile', status: :unprocessable_entity
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start_date, :end_date, :location, :looking_for, :user_id, :pet_id)
  end

  def date_range_params
    string_format = appointment_params['start_date']
    start_string = string_format.split("to")[0]
    end_string = string_format.split("to")[1]
    return str_to_date(start_string), str_to_date(end_string)
  end

  def str_to_date(date_string)
    date_string = date_string.split # Splits based on spaces
    date = date_string[0].split("-") # To split the date
    time = date_string[1].split(":") # To split the time

    date.map!(&:to_i) # Converting str to integers
    time.map!(&:to_i) # Converting str to integers

    return DateTime.new(date[0], date[1], date[2], time[0], time[1]) # Follows order Year Month Day Hour Minute
  end
end
