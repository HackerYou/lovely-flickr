class User < ActiveRecord::Base
  has_secure_password validations: false

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  has_many :photos
  has_many :galleries
end
