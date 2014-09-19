require 'rails_helper'
describe Expense do
  before(:each) do
      dwelling = Dwelling.create!(name: "hoooooome", address: "12345 Lane St.")
      test_user=User.create!(name: "zac", email: "zacmitton22@gmail.com", phone: "8473341606", password: "password", dwelling_id: dwelling.id )
      @test_expense=Expense.create!(name: "rent", description: "so expensive", amount: 400, payer_id: test_user.id)
      @test_expense.user_expenses.first.update!(paid: 400.00)
  end

  it { should belong_to(:payer).class_name("User") }
  it { should have_many(:user_expenses) }
  it { should have_many(:users).through("user_expenses") }

  describe "#total_paid" do
    it "should return the total  paid on the expense" do
      expect(@test_expense.total_paid).to eq(400)
    end
  end
end
