class Expense < ActiveRecord::Base
  belongs_to :payer, class_name: :user
  has_many :user_expenses
  # could belong to comment
  def total_paid
    self.user_expenses.reduce(0) { |sum, user_expense| user_expense.paid + sum }
  end
end
