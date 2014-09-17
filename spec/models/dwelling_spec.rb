require 'spec_helper'
describe Dwelling do
  let(:test_dwelling){Dwelling.create(address: "1234 W. Fulton", name: "winterfell", admin_id: 1 )}
  describe "Dwelling" do
    it "should return the total of all expenses for dwelling's users" do
      test_dwelling
      expect(Dwelling.all.count).to eq(1)
    end
  end

  describe "#count" do
    it "should return the number of dwellings in the database" do
      expect(Dwelling.all.count).to eq(0)
    end
  end
end
