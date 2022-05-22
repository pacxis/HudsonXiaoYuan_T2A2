class CreateListingCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :listing_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
