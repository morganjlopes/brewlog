require 'public_facing/public_facing_controller.rb'
class PublicFacing::BatchesController < PublicFacingController
  before_action :authenticate_user!
  before_action :set_batch, only: [:show, :edit, :update]

  # GET /batches
  # GET /batches.json
  def index
    @batches = Batch.all
    @tab_title = "brewery_batches"
  end

  # GET /batches/1
  # GET /batches/1.json
  def show
  end

  # GET /batches/new
  def new
    @batch = Batch.new
    @batch.actual_brew_date = Time.now
    if params[:recipe]
      @recipe = Recipe.find(params[:recipe])

      # Setup Projected data based on recipe details
      @batch.name                                    = "#{@recipe.name}"
      @batch.beer_style                              = @recipe.beer_style
      @batch.difficulty                              = @recipe.difficulty
      @batch.projected_alcohol_by_volume             = @recipe.projected_alcohol_by_volume
      @batch.projected_international_bittering_units = @recipe.projected_international_bittering_units
      @batch.projected_original_gravity              = @recipe.projected_original_gravity
      @batch.projected_final_gravity                 = @recipe.projected_final_gravity
      @batch.projected_volume_in_gallons             = @recipe.projected_volume_in_gallons

      if @recipe.primary_fermenting_duration_in_days.present?
        @batch.projected_secondary_transition_date   = @recipe.primary_fermenting_duration_in_days.days.from_now
      end

      if @recipe.secondary_fermenting_duration_in_days.present?
        @batch.projected_bottle_date                 = @batch.projected_secondary_transition_date + @recipe.secondary_fermenting_duration_in_days.days
      end

    end
  end

  # GET /batches/1/edit
  def edit
  end

  # POST /batches
  # POST /batches.json
  def create
    @batch                  = Batch.new(batch_params)
    @batch.author           = current_user
    @batch.actual_brew_date = Time.now

    respond_to do |format|
      if @batch.save
        track_activity @batch
        format.html { redirect_to edit_batch_path(@batch), notice: 'Batch was successfully created.' }
        format.json { render :show, status: :created, location: @batch }
      else
        format.html { render :new }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batches/1
  # PATCH/PUT /batches/1.json
  def update
    respond_to do |format|
      if @batch.update(batch_params)
        track_activity @batch
        format.html { redirect_to edit_batch_path(@batch), notice: 'Batch was successfully updated.' }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # def set_brewery_from_url
    #   @brewery = Brewery.find(params[:brewery_id])
    # end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      @batch = Batch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batch_params
      params.require(:batch).permit(:name,
                                    :beer_style,
                                    :description,
                                    :projected_volume_in_gallons,
                                    :projected_alcohol_by_volume,
                                    :projected_original_gravity,
                                    :projected_final_gravity,
                                    :projected_secondary_transition_date,
                                    :projected_bottle_date,
                                    :projected_condition_date,
                                    :actual_original_gravity,
                                    :actual_final_gravity,
                                    :actual_alcohol_by_volume,
                                    :actual_brew_date,
                                    :actual_secondary_transition_date,
                                    :actual_bottle_date,
                                    :actual_condition_date,
                                    :color,
                                    :difficulty,
                                    :recipe_id)
    end
end
