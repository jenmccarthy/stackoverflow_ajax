class User < ActiveRecord::Base

  has_many :questions
  has_many :answers
  validates_uniqueness_of :name
  has_secure_password

end
