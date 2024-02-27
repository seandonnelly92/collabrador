class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def temp
  end
end
