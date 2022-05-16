class Menu < ApplicationRecord
  has_many :menu_items, dependent: :destroy
  belongs_to :listing, optional: true
end