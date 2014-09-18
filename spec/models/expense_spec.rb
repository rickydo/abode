require 'rails_helper'
describe Expense do
  let(:test_expense){Expense.first}
  describe "#total_paid" do
    it "should return the total  paid on the expense" do
      expect(test_expense.total_paid).to eq(400)
    end
  end
end
