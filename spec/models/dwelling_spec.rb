require 'spec_helper'
describe Dwelling do
  let(:test_dwelling){Dwelling.first}
  describe "#total_expenses" do
    it "should return the total of all expenses for the dwelling" do
      test_dwelling
      expect(test_dwelling.total_expenses).to eq(2320)
    end
  end

  describe "#count" do
    it "should return the number of dwellings in the database" do
      expect(Dwelling.all.count).to eq(0)
    end
  end
end
