class CreateGameHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :game_houses do |t|
      t.string :name

      t.timestamps
    end
  end
end
