require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  setup do
    @recipe = recipes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipe" do
    assert_difference('Recipe.count') do
      post :create, recipe: { additional_notes: @recipe.additional_notes, author_id: @recipe.author_id, beer_style_id: @recipe.beer_style_id, color: @recipe.color, description: @recipe.description, difficulty: @recipe.difficulty, name: @recipe.name, primary_fermenting_duration_in_days: @recipe.primary_fermenting_duration_in_days, projected_alcohol_by_volume: @recipe.projected_alcohol_by_volume, projected_final_gravity: @recipe.projected_final_gravity, projected_international_bittering_units: @recipe.projected_international_bittering_units, projected_original_gravity: @recipe.projected_original_gravity, projected_volume_in_gallons: @recipe.projected_volume_in_gallons, recipe_type: @recipe.recipe_type, recommended_fermenting_temperature_in_fahrenheit: @recipe.recommended_fermenting_temperature_in_fahrenheit, secondary_fermenting_duration_in_days: @recipe.secondary_fermenting_duration_in_days, total_boil_duration_in_minutes: @recipe.total_boil_duration_in_minutes }
    end

    assert_redirected_to recipe_path(assigns(:recipe))
  end

  test "should show recipe" do
    get :show, id: @recipe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recipe
    assert_response :success
  end

  test "should update recipe" do
    patch :update, id: @recipe, recipe: { additional_notes: @recipe.additional_notes, author_id: @recipe.author_id, beer_style_id: @recipe.beer_style_id, color: @recipe.color, description: @recipe.description, difficulty: @recipe.difficulty, name: @recipe.name, primary_fermenting_duration_in_days: @recipe.primary_fermenting_duration_in_days, projected_alcohol_by_volume: @recipe.projected_alcohol_by_volume, projected_final_gravity: @recipe.projected_final_gravity, projected_international_bittering_units: @recipe.projected_international_bittering_units, projected_original_gravity: @recipe.projected_original_gravity, projected_volume_in_gallons: @recipe.projected_volume_in_gallons, recipe_type: @recipe.recipe_type, recommended_fermenting_temperature_in_fahrenheit: @recipe.recommended_fermenting_temperature_in_fahrenheit, secondary_fermenting_duration_in_days: @recipe.secondary_fermenting_duration_in_days, total_boil_duration_in_minutes: @recipe.total_boil_duration_in_minutes }
    assert_redirected_to recipe_path(assigns(:recipe))
  end

  test "should destroy recipe" do
    assert_difference('Recipe.count', -1) do
      delete :destroy, id: @recipe
    end

    assert_redirected_to recipes_path
  end
end
