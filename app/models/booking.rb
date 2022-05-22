class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user_profile

  validates :address, presence: true
  validate :future_date

  private
  # Validates date to ensure it is not in the past
  def future_date
    return if :date.blank?

    if date < Date.today
      errors.add(:date, "cannot be in the past")
    end
  end
end
