class User < ActiveRecord::Base
  belongs_to :dwelling
  has_many :expenses
  has_many :user_expenses
  has_many :comments
end
