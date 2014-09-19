class Dwelling < ActiveRecord::Base
  has_many :users
  has_many :expenses, through: :users
  belongs_to :admin, class_name: "User"

  def total_expenses
    self.expenses.sum("amount")
  end

  def total_paid
    total = 0
    self.expenses.each {|expense| total += expense.total_paid}
    total
  end

  def total_owed
    total_expenses - total_paid
  end
end
