require 'public_facing/public_facing_controller.rb'
class PublicFacing::RecipesController < PublicFacingController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    if params[:style]
      @featured_style = BeerStyle.find_by_name "#{params[:style]}"
      @recipes        = @featured_style.recipes.all
    else
      @recipes     = Recipe.all
    end

    @beer_styles = BeerStyle.all

    @page_title       = "Homebrew Recipes"
    @page_description = "Homebrew recipes from a community of homebrewers and homebrew enthusiasts."
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @page_title       = "#{@recipe.name}, a Homebrew Recipe by #{@recipe.author.name}"
    @page_description = "#{@recipe.description}"
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @recipe.recipe_ingredients.build
    @recipe.recipe_events.build
  end

  # GET /recipes/1/edit
  def edit
    unless @recipe.recipe_ingredients.present?
      @recipe.recipe_ingredients.build
    end
    unless @recipe.recipe_events.present?
      @recipe.recipe_events.build
    end
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.author = current_user

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to edit_recipe_path(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name,
                                     :description,
                                     :color,
                                     :difficulty,
                                     :recipe_type,
                                     :beer_style_id,
                                     :projected_volume_in_gallons,
                                     :projected_original_gravity,
                                     :projected_final_gravity,
                                     :projected_alcohol_by_volume,
                                     :projected_international_bittering_units,
                                     :total_boil_duration_in_minutes,
                                     :primary_fermenting_duration_in_days,
                                     :secondary_fermenting_duration_in_days,
                                     :recommended_fermenting_temperature_in_fahrenheit,
                                     :author_id,
                                     :additional_notes,
                                     recipe_ingredients_attributes: [:id, :quantity, :standard_unit, :item, :ingredient_type],
                                     recipe_events_attributes: [:id, :action, :subject])
    end
end
