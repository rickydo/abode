class Dwelling < ActiveRecord::Base
  has_many :users
  has_many :expenses, through: :users


  def total_expenses
    self.expenses.reduce(0){|sum, e| e.amount + sum }
  end

  def total_owed
    total_expenses - total_paid
  end

  def total_paid
    self.expenses.reduce(0) do |sum, expense|
      sum + expense.user_expenses.reduce(0) { |mini_sum, e| e.paid + mini_sum }
    end
  end

end
