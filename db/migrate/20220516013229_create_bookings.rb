class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :user_profile, null: false, foreign_key: true
      t.string :address
      t.date :date

      t.timestamps
    end
  end
end
