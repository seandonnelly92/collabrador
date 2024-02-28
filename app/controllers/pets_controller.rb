class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
    @owner = @pet.user
    @appointments = @pet.appointments
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to user_profile_path
    else
      render user_profile_path, status: :unprocessable_entity
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :animal_type, :breed, :size, :activity_needs, :neutered_spayed, :child_friendly, :dog_friendly, :cat_friendly, :hypoallergenic)
  end
end
