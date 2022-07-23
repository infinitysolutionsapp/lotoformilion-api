class GameCategory < ApplicationRecord
    belongs_to :game_house
    has_many :games
end
