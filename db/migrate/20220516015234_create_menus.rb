class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.references :listing, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
