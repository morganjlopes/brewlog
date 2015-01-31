require 'public_facing/public_facing_controller.rb'
class PublicFacing::BreweriesController < PublicFacingController
  before_action :authenticate_user!
  before_action :set_brewery, only: [:show, :edit, :update]

  # GET /breweries
  # GET /breweries.json
  def index
    if current_user.breweries.count < 1
      redirect_to new_brewery_path, :notice => "Before you start brewing..."
    end
    @breweries = current_user.breweries.all
  end

  def members
    @tab_title                          = "brewery_members"
    @brewery                            = current_user.breweries.find(params[:brewery_id])
    @accessable                         = @brewery
    @access_invitation                  = @brewery.access_invitations.new
    @access_invitations                 = @brewery.access_invitations.all
  end

  def remove_member
    
  end

  # GET /breweries/1
  # GET /breweries/1.json
  def show
    @tab_title = "brewery_home"
    @activities = @brewery.collective_activity_log.sort_by{|e| e[:created_at]}.reverse.last(10)
  end

  # GET /breweries/new
  def new
    @brewery = current_user.breweries.new
  end

  # GET /breweries/1/edit
  def edit
  end

  # POST /breweries
  # POST /breweries.json
  def create
    @brewery = current_user.breweries.new(brewery_params)
    @brewery.users << current_user

    respond_to do |format|
      if @brewery.save
        track_activity @brewery
        format.html { redirect_to @brewery, notice: 'Brewery was successfully created.' }
        format.json { render :show, status: :created, location: @brewery }
      else
        format.html { render :new }
        format.json { render json: @brewery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breweries/1
  # PATCH/PUT /breweries/1.json
  def update
    respond_to do |format|
      if @brewery.update(brewery_params)
        track_activity @brewery
        format.html { redirect_to @brewery, notice: 'Brewery was successfully updated.' }
        format.json { render :show, status: :ok, location: @brewery }
      else
        format.html { render :edit }
        format.json { render json: @brewery.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brewery
      @brewery = Brewery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brewery_params
      params.require(:brewery).permit(:name, :slogan)
    end
end
