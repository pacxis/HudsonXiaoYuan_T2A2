class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.references :user, null: true, foreign_key: true
      t.string :phone_number

      t.timestamps
    end
  end
end
