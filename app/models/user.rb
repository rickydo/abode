class User < ActiveRecord::Base
  belongs_to :dwelling
  has_one :admin_dwelling, foreign_key: "admin_id"
  has_many :expenses, foreign_key: "payer_id"
  has_many :user_expenses

  validates :email, presence: true, uniqueness: true, format: {with: /\w+@\w+\..+/}
  validates :password, length: { minimum: 6 }

  has_secure_password

  before_create :create_remember_token

  def total_expenses
    self.user_expenses.sum("portion")
  end

  def total_owed
    total_expenses - total_paid
  end

  def total_paid
    self.user_expenses.sum("paid")
  end

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
end
