
class Listing < ApplicationRecord
  belongs_to :user_profile
  has_many :menus, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :listing_categories, dependent: :destroy
  has_many :categories, through: :listing_categories
end