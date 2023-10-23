class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.text :name
      t.text :location
      t.integer :price_for
      t.integer :available_for
      t.integer :status
      t.integer :amount
      t.string :image_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
