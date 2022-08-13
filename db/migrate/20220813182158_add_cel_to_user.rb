class AddCelToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cell, :text
  end
end
