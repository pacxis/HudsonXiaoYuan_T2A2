class Listing < ApplicationRecord
  belongs_to :user_profile
  has_many :menus, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :listing_categories, dependent: :destroy
  has_many :categories, through: :listing_categories

  has_one_attached :truck_img
  has_one_attached :menu_img

  # validates :title, :price, :listing_description, :categories, :menu_img, presence: true
  # validates_numericality_of :price, only_integer: true
  

end