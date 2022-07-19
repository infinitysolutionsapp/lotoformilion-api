class Game < ApplicationRecord
  belongs_to :GameCategory
  belongs_to :GameHouse
end
