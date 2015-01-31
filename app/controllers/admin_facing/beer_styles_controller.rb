require 'admin_facing/admin_facing_controller.rb'
class AdminFacing::BeerStylesController < AdminFacingController
  before_action :set_beer_style, only: [:show, :edit, :update, :destroy]

  # GET /beer_styles
  # GET /beer_styles.json
  def index
    @beer_styles = BeerStyle.all
  end

  # GET /beer_styles/1
  # GET /beer_styles/1.json
  def show
  end

  # GET /beer_styles/new
  def new
    @beer_style = BeerStyle.new
  end

  # GET /beer_styles/1/edit
  def edit
  end

  # POST /beer_styles
  # POST /beer_styles.json
  def create
    @beer_style = BeerStyle.new(beer_style_params)

    if @beer_style.save
      redirect_to admin_beer_styles_path, notice: 'Beer style was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /beer_styles/1
  # PATCH/PUT /beer_styles/1.json
  def update
    if @beer_style.update(beer_style_params)
      redirect_to admin_beer_styles_path, notice: 'Beer style was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /beer_styles/1
  # DELETE /beer_styles/1.json
  def destroy
    @beer_style.destroy
    respond_to do |format|
      format.html { redirect_to beer_styles_url, notice: 'Beer style was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beer_style
      @beer_style = BeerStyle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beer_style_params
      params.require(:beer_style).permit(:name, :description, :alternative_names, :examples, :slug)
    end
end
