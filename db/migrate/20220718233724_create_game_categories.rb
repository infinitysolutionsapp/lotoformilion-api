class CreateGameCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :game_categories do |t|
      t.references :game_houses, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
