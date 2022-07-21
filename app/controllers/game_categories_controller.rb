class GameCategoriesController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :set_game_category, only: %i[ show update destroy ]

  # GET /game_categories
  def index
    @game_categories = GameCategory.all

    render json: @game_categories
  end

  # GET /game_categories/1
  def show
    render json: @game_category
  end

  # POST /game_categories
  def create
    @game_category = GameCategory.new(game_category_params)

    if @game_category.save
      render json: @game_category, status: :created, location: @game_category
    else
      render json: @game_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /game_categories/1
  def update
    if @game_category.update(game_category_params)
      render json: @game_category
    else
      render json: @game_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /game_categories/1
  def destroy
    @game_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_category
      @game_category = GameCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_category_params
      params.fetch(:game_category, {})
    end
end
