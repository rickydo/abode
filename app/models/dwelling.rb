class Dwelling < ActiveRecord::Base
  has_many :users
  has_many :expenses, through: :users


  def total_expenses
    self.expenses.reduce(0){|sum, e| e.amount + sum }
  end
end
