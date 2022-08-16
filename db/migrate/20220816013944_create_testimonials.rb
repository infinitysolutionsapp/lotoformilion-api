class CreateTestimonials < ActiveRecord::Migration[7.0]
  def change
    create_table :testimonials do |t|
      t.integer :points
      t.text :receipt
      t.text :msg
      t.text :name
      t.string :loteria

      t.timestamps
    end
  end
end
