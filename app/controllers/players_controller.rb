class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html {redirect_to @player, notice: 'Player was successfully created.'}
        format.json {render :show, status: :created, location: @player}
      else
        format.html {render :new}
        format.json {render json: @player.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html {redirect_to @player, notice: 'Player was successfully updated.'}
        format.json {render :show, status: :ok, location: @player}
      else
        format.html {render :edit}
        format.json {render json: @player.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html {redirect_to players_url, notice: 'Player was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  # GET /courses/1/cartolas
  def cartolas
    @player = Player.find(params[:id])
    @cartolas = @player.cartolas
  end

  def team
    @team = @player.teams
  end
  def plays_in?(cartola)
    self.cartolas.include?(cartola)
  end

  # POST /players/1/cartola_add?cartola_id=2
  def cartola_add
# Convert ids from routing to objects
    @player = Player.find(params[:id])
    @cartola = Cartola.find(params[:cartola])

    if @player.enrolled_in?(@cartola)
      flash[:error] = 'Player was already enrolled'
    else
      @player.cartolas << @cartola
      flash[:notice] = 'Player was successfully enrolled'
    end
    redirect_to action: "cartolas", id: @player
  end

  def cartola_remove
# Convert ids from routing to objects
    @player = Player.find(params[:id])
    cartola_ids = params[:cartolas]
    if cartola_ids.any?
      cartola_ids.each do |cartola_id|
        cartola = Cartola.find(cartola_id)
        if @player.enrolled_in?(cartola)
          logger.info "Removing student from cartola #{cartola.id}"
          @player.cartolas.delete(cartola)
          flash[:notice] = 'Cartola was successfully deleted'
          if cartola_ids.any?
            cartola_ids.each do |cartola_id|
              cartola = Cartola.find(cartola_id)
              if @player.enrolled_in?(cartola)
                logger.info "Removing student from cartola #{cartola.id}"
                @player.cartolas.delete(cartola)
                flash[:notice] = 'Cartola was successfully deleted'
              end
            end
          end
          redirect_to action: "cartolas", id: @player
        end
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:Name, :Position, :team_id)

  end
end