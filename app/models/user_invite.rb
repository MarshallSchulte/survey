class UserInvite < ActiveRecord::Base
  belongs_to :customer
  validates :first, presence: true
  validates :last, presence: true
  validates :email, uniqueness: true, on: :create, length: {minimum: 5}
end
