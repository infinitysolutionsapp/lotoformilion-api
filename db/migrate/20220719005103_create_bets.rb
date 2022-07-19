class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.json :result
      t.json :move
      t.integer :dozens
      t.json :simulations
      t.references :Game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
