class UserProfile < ApplicationRecord
  has_many :listings
  has_many :bookings
  belongs_to :user

  validates :name, :phone_number, presence: true
  validates_numericality_of :phone_number, only_integer: true
end
