class PetsController < ApplicationController
  def index
    @pets = Pet.where.not(user: current_user)
    @pet = Pet.find_by(params[:id])
    @owner = @pet.user
    @users = User.geocoded
    @markers = @users.map do |user|
      @pet_marker = Pet.find_by(user_id: user.id)
      {
        lat: user.latitude,
        lng: user.longitude,
        map_marker_html: render_to_string(partial: "map_marker", locals: {pet: @pet_marker})
      }

    end
  end

  def show
    @pet = Pet.find(params[:id])
    @owner = @pet.user
    @users = User.geocoded
    @appointments = @pet.appointments
    user = @users.find_by(id: @owner)
    @pet_marker = Pet.find_by(user_id: user)
    @markers =  [{
        lat: user.latitude,
        lng: user.longitude,
        map_marker_html: render_to_string(partial: "map_marker", locals: {pet: @pet_marker})
      }]
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to user_profile_path
    else
      render '/user_profile', status: :unprocessable_entity
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :animal_type, :breed, :size, :activity_needs, :neutered_spayed, :child_friendly, :dog_friendly, :cat_friendly, :hypoallergenic, pet_photos: [])
  end
end
