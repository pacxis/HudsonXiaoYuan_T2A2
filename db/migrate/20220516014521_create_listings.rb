class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.references :user_profile, null: false, foreign_key: true
      t.integer :price
      t.text :listing_description
      t.boolean :visible

      t.timestamps
    end
  end
end
