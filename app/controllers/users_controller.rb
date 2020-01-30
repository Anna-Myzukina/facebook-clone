# frozen_string_literal: true

class UsersController < ApplicationController
  def index
  end
  
  def user_params
    params.require(:user).permit(:username, :sirname, :email, :password, :birthday, :gender)
  end
end
