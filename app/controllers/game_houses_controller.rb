class GameHousesController < ApplicationController
    def index
        @game_houses = GameHouse.all
        render json: @game_houses
      end

end
