class Expense < ActiveRecord::Base
  belongs_to :payer, class_name: :user
  has_many :user_expenses
  # could belong to comment

end
