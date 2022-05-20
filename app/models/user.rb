class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :user_profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_create :assign_default_role

  def assign_default_role
    self.add_role("buyer#{self.id}".to_sym)
  end
end
