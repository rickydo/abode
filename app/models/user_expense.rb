class UserExpense < ActiveRecord::Base
  belongs_to :user
  belongs_to :expense
  has_one :payer through: :expense
end
