class User < ApplicationRecord
  has_one_attached :avatar
  has_secure_password
  validates_uniqueness_of :email  
end
