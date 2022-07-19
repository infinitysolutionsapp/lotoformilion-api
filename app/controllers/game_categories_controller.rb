class GameCategoriesController < ApplicationController
    def index
        @game_categories = GameCategory.all
        render json: @game_categories
    end
end
