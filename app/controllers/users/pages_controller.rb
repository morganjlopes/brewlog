class Users::PagesController < ApplicationController
  before_action :authenticate_user!, :only => [:dashboard]
  def dashboard
  end

  def show
    @user = User.find(params[:id])
    @activities = @user.activities
    @tab_title = "user_profile"
  end

  def recipes
    @user    = User.find(params[:id])
    @recipes = @user.recipes

    @tab_title = "user_recipes"
  end
end
