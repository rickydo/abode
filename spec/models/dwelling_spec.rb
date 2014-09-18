require 'rails_helper'
describe Dwelling do

  let(:test_dwelling){Dwelling.first}

  it 'should have_many users' do
    expect(test_dwelling).to have_many(:users)
  end

  it 'should have_many expenses through users' do
    expect(test_dwelling).to have_many(:expenses).through(:users)
  end

  it { should have_many(:expenses).through(:users) }

  describe "#total_expenses" do
    it "should return the total of all expenses for the dwelling" do
      test_dwelling
      expect(test_dwelling.total_expenses).to eq(2320)
    end
  end
  describe "#total_owed" do
    it "should return the total of all expenses for the dwelling" do
      test_dwelling
      expect(test_dwelling.total_owed).to eq(1835)
    end
  end
  describe "#total_paid" do
    it "should return the total of all expenses for the dwelling" do
      test_dwelling
      expect(test_dwelling.total_paid).to eq(485)
    end
  end
  # describe "#count" do
  #   xit "should return the number of dwellings in the database" do
  #     expect(Dwelling.all.count).to eq(0)
  #   end
  # end
end
