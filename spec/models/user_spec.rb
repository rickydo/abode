describe User do
  let(:test_user){User.create(name: "zac", email: "zacmitton22@gmail.com", phone: "8473341606", password: "password" )}
  describe "#authenticate" do
    it "can authenticate a user" do
      expect(User.authenticate("zac", "password")).to eq(true)
      expect(User.authenticate("zac", "fdlgjsfd")).to eq(false)
    end
  end
  describe "user fields" do
    it "user has a name" do
      expect(test_user.name).to eq("zac")
    end
    it "user has a phone" do
      expect(test_user.phone).to eq("8473341606")
    end
    it "user has an email" do
      expect(test_user.name).to eq("zacmitton22@gmail.com")
    end
  end
end
