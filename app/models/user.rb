class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password
  belongs_to :dwelling
  has_many :expenses, foreign_key: :payer_id
  has_many :user_expenses
  has_many :comments


  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }

end
