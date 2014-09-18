require 'rails_helper'
describe Expense do
  let(:test_expense){Expense.first}

  it { should belong_to(:payer).class_name("User") }
  it { should have_many(:user_expenses) }
  it { should have_many(:users).through("user_expenses") }

  describe "#total_paid" do
    it "should return the total  paid on the expense" do
      expect(test_expense.total_paid).to eq(400)
    end
  end
end
