class User < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :location, :state, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, on: create, presence: true, length: {in: 8..40}
end
