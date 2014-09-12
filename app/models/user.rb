class User < ActiveRecord::Base

  has_many :questions
  has_many :answers
  validates_uniqueness_of :username
  has_secure_password

end
