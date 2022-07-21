class GameHousesController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :set_game_house, only: %i[ show update destroy ]

  # GET /game_houses
  def index
    @game_houses = GameHouse.all

    render json: @game_houses
  end

  # GET /game_houses/1
  def show
    render json: @game_house
  end

  # POST /game_houses
  def create
    @game_house = GameHouse.new(game_house_params)

    if @game_house.save
      render json: @game_house, status: :created, location: @game_house
    else
      render json: @game_house.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /game_houses/1
  def update
    if @game_house.update(game_house_params)
      render json: @game_house
    else
      render json: @game_house.errors, status: :unprocessable_entity
    end
  end

  # DELETE /game_houses/1
  def destroy
    @game_house.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_house
      @game_house = GameHouse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_house_params
      params.fetch(:game_house, {})
    end
end
