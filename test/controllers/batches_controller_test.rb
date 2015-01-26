require 'test_helper'

class BatchesControllerTest < ActionController::TestCase
  setup do
    @batch = batches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:batches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create batch" do
    assert_difference('Batch.count') do
      post :create, batch: { actual_volume_in_gallons: @batch.actual_volume_in_gallons, alcohol_by_volume: @batch.alcohol_by_volume, bottle_date: @batch.bottle_date, brew_date: @batch.brew_date, color: @batch.color, condition_date: @batch.condition_date, description: @batch.description, difficulty: @batch.difficulty, final_gravity: @batch.final_gravity, name: @batch.name, original_gravity: @batch.original_gravity, secondary_transition_date: @batch.secondary_transition_date, slug: @batch.slug, target_volume_in_gallons: @batch.target_volume_in_gallons }
    end

    assert_redirected_to batch_path(assigns(:batch))
  end

  test "should show batch" do
    get :show, id: @batch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @batch
    assert_response :success
  end

  test "should update batch" do
    patch :update, id: @batch, batch: { actual_volume_in_gallons: @batch.actual_volume_in_gallons, alcohol_by_volume: @batch.alcohol_by_volume, bottle_date: @batch.bottle_date, brew_date: @batch.brew_date, color: @batch.color, condition_date: @batch.condition_date, description: @batch.description, difficulty: @batch.difficulty, final_gravity: @batch.final_gravity, name: @batch.name, original_gravity: @batch.original_gravity, secondary_transition_date: @batch.secondary_transition_date, slug: @batch.slug, target_volume_in_gallons: @batch.target_volume_in_gallons }
    assert_redirected_to batch_path(assigns(:batch))
  end

  test "should destroy batch" do
    assert_difference('Batch.count', -1) do
      delete :destroy, id: @batch
    end

    assert_redirected_to batches_path
  end
end
