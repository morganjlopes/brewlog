class Users::PagesController < ApplicationController
  before_action :authenticate_user!, :only => [:dashboard]
  def dashboard
  end

  def show
    @user = User.find(params[:id])
    @activities = @user.activities
    @tab_title = "user_profile"

    @page_title       = "#{@user.name}"
    @page_description = "#{@user.name} and their Homebrew recipes. Check them out on allhomebrew.com."
  end

  def recipes
    @user    = User.find(params[:id])
    @recipes = Recipe.where(:author_id => @user.id).all

    @tab_title = "user_recipes"

    @page_title       = "#{@user.name} Recipes"
    @page_description = "Homebrew recipes by #{@user.name}. Check them out on allhomebrew.com."
  end

  def batches
    @user    = User.find(params[:id])
    @batches = Batch.where(:author_id => @user.id).all

    @tab_title = "user_batches"

    @page_title       = "#{@user.name} Batches"
    @page_description = "Homebrew batches by #{@user.name}. Check them out on allhomebrew.com."
    
  end

  def index
    @users = User.all
    
  end
end
