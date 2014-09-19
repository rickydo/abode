class Dwelling < ActiveRecord::Base
  has_many :users
  has_many :expenses, through: :users
  belongs_to :admin, class_name: "User"

  after_create :generate_secret_key
  # after_create :add_inhabitant

  def generate_secret_key
    self.secret_key = SecureRandom.urlsafe_base64
    self.save
  end

  # def add_inhabitant
  #   self.admin.update(dwelling: self)
  # end

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
