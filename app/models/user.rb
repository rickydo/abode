class User < ActiveRecord::Base
  has_secure_password
  belongs_to :dwelling
  has_many :expenses
  has_many :user_expenses
  has_many :comments
end
