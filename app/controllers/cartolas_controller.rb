class CartolasController < ApplicationController
  before_action :set_cartola, only: [:show, :edit, :update, :destroy]

  # GET /cartolas
  # GET /cartolas.json
  def index
    @cartolas = Cartola.all
  end

  # GET /cartolas/1
  # GET /cartolas/1.json
  def show
  end

  # GET /cartolas/new
  def new
    @cartola = Cartola.new
  end

  # GET /cartolas/1/edit
  def edit
  end

  # POST /cartolas
  # POST /cartolas.json
  def create
    @cartola = Cartola.new(cartola_params)

    respond_to do |format|
      if @cartola.save
        format.html { redirect_to @cartola, notice: 'Cartola was successfully created.' }
        format.json { render :show, status: :created, location: @cartola }
      else
        format.html { render :new }
        format.json { render json: @cartola.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cartolas/1
  # PATCH/PUT /cartolas/1.json
  def update
    respond_to do |format|
      if @cartola.update(cartola_params)
        format.html { redirect_to @cartola, notice: 'Cartola was successfully updated.' }
        format.json { render :show, status: :ok, location: @cartola }
      else
        format.html { render :edit }
        format.json { render json: @cartola.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cartolas/1
  # DELETE /cartolas/1.json
  def destroy
    @cartola.destroy
    respond_to do |format|
      format.html { redirect_to cartolas_url, notice: 'Cartola was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cartola
      @cartola = Cartola.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cartola_params
      params.require(:cartola).permit(:nome)
    end

  def players_in_cartola
    @players = Player.find(params[:id])
  end
end
