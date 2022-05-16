class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.references :user_profile, null: false, foreign_key: true
      t.integer :price
      t.text :listing_description
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
