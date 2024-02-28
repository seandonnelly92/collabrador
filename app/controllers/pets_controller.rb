class PetsController < ApplicationController
  def index
    @pets = Pet.all
    @pet = Pet.find_by(params[:id])
    @owner = @pet.user
  end

  def show
    @pet = Pet.find(params[:id])
    @owner = @pet.user
    @appointments = @pet.appointments
  end
end
