require 'rails_helper'
describe User do
  let(:test_user){User.first}
  describe "#authenticate" do
    it "can authenticate a user" do
      expect(test_user.authenticate("password")).to be_truthy
      expect(test_user.authenticate("fdlgjsfd")).to be_falsey
    end
  end
  describe "#total_expenses" do
    it "can show the user their total expense liability" do
      expect(test_user.total_expenses).to eq(680.00)
    end
  end
  describe "#total_owed" do
    it "can show the user how much left they currently owe" do
      expect(test_user.total_owed).to eq(650.00)
    end
  end
  describe "#total_paid" do
    it "can show the user how much of their total they have already paid" do
      expect(test_user.total_paid).to eq(30.00)
    end
  end
end
