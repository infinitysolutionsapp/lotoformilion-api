class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.json :params
      t.text :response

      t.timestamps
    end
  end
end
