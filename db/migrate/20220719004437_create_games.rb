class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :GameCategory, null: false, foreign_key: true
      t.references :GameHouse, null: false, foreign_key: true
      t.string :name
      t.json :last_results

      t.timestamps
    end
  end
end
