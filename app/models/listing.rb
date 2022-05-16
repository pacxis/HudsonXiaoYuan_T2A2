
class Listing < ApplicationRecord
  belongs_to :user_profile
  has_many :menus
  has_many :bookings, dependent: :destroy
  has_many :listing_categories
  has_many :categories, through: :listing_categories
end