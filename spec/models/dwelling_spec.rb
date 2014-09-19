require 'rails_helper'
describe Dwelling do

  before(:each) do
      @test_dwelling = Dwelling.create!(name: "hoooooome", address: "12345 Lane St.")
      test_user=User.create!(name: "zac", email: "zacmitton22@gmail.com", phone: "8473341606", password: "password", dwelling_id: @test_dwelling.id )
      @test_expense=Expense.create!(name: "rent", description: "so expensive", amount: 2320, payer_id: test_user.id)
      @test_expense.user_expenses.first.update!(paid: 485.00)
  end

  it 'should have_many users' do
    expect(@test_dwelling).to have_many(:users)
  end

  it 'should have_many expenses through users' do
    expect(@test_dwelling).to have_many(:expenses).through(:users)
  end

  it { should have_many(:expenses).through(:users) }

  describe "#total_expenses" do
    it "should return the total of all expenses for the dwelling" do
      @test_dwelling
      expect(@test_dwelling.total_expenses).to eq(2320)
    end
  end
  describe "#total_owed" do
    it "should return the total of all expenses for the dwelling" do
      @test_dwelling
      expect(@test_dwelling.total_owed).to eq(1835)
    end
  end
  describe "#total_paid" do
    it "should return the total of all expenses for the dwelling" do
      @test_dwelling
      expect(@test_dwelling.total_paid).to eq(485)
    end
  end
  # describe "#count" do
  #   xit "should return the number of dwellings in the database" do
  #     expect(Dwelling.all.count).to eq(0)
  #   end
  # end
end
