class Expense < ActiveRecord::Base
  belongs_to :payer, class_name: "User"
  has_many :user_expenses
  has_many :users, through: :user_expenses

  after_create :create_user_expenses

  def total_paid
    self.user_expenses.sum("paid")
  end

  def create_user_expenses
    dwelling = self.payer.dwelling
    habitants = dwelling.users
    portion = self.amount / habitants.length
    habitants.each { |habitant| habitant.user_expenses.create!(portion: portion, expense_id: self.id)}
  end
end
