class CreateMenuItems < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_items do |t|
      t.references :menu, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
