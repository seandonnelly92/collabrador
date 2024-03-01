class PagesController < ApplicationController
  def home
  end

  def user_profile
    @owner = current_user
  end
end
