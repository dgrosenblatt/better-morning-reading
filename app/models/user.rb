class User < ApplicationRecord
  devise :database_authenticatable, :registerable #, :confirmable, :recoverable
  validates :name, presence: true
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /@/, message: 'must be a valid email' }
end
