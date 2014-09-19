class UserExpense < ActiveRecord::Base
  belongs_to :expense
  belongs_to :user

  def total_owed
    self.portion - self.paid
  end
end
