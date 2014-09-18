class Expense < ActiveRecord::Base
  belongs_to :payer, class_name: "User"
  has_many :user_expenses
  has_many :users, through: :user_expenses
  has_one :dwelling, through: :payer
  validates :name, :amount, presence: true
  # could belong to comment
  def total_paid
    self.user_expenses.reduce(0) { |sum, user_expense| user_expense.paid + sum }
  end
end
