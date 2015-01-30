class BatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_brewery_from_url
  before_action :set_batch, only: [:show, :edit, :update]

  # GET /batches
  # GET /batches.json
  def index
    @batches = @brewery.batches.all
    @tab_title = "brewery_batches"
  end

  # GET /batches/1
  # GET /batches/1.json
  def show
  end

  # GET /batches/new
  def new
    @batch = @brewery.batches.new
  end

  # GET /batches/1/edit
  def edit
  end

  # POST /batches
  # POST /batches.json
  def create
    @batch = @brewery.batches.new(batch_params)
    @batch.actual_brew_date = Time.now

    respond_to do |format|
      if @batch.save
        track_activity @batch
        format.html { redirect_to edit_brewery_batch_path(@brewery, @batch), notice: 'Batch was successfully created.' }
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
        format.html { redirect_to edit_brewery_batch_path(@brewery, @batch), notice: 'Batch was successfully updated.' }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_brewery_from_url
      @brewery = current_user.breweries.find(params[:brewery_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      @batch = @brewery.batches.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batch_params
      params.require(:batch).permit(:name,
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
                                    :difficulty)
    end
end
