require 'public_facing/public_facing_controller.rb'
class PublicFacing::BeerStylesController < PublicFacingController
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

    respond_to do |format|
      if @beer_style.save
        format.html { redirect_to @beer_style, notice: 'Beer style was successfully created.' }
        format.json { render :show, status: :created, location: @beer_style }
      else
        format.html { render :new }
        format.json { render json: @beer_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beer_styles/1
  # PATCH/PUT /beer_styles/1.json
  def update
    respond_to do |format|
      if @beer_style.update(beer_style_params)
        format.html { redirect_to @beer_style, notice: 'Beer style was successfully updated.' }
        format.json { render :show, status: :ok, location: @beer_style }
      else
        format.html { render :edit }
        format.json { render json: @beer_style.errors, status: :unprocessable_entity }
      end
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
