require 'rails_helper'
describe User do
  before(:each) do
    dwelling = Dwelling.create!(name: "hoooooome", address: "12345 Lane St.")
    @test_user=User.create!(name: "zac", email: "zacmitton22@gmail.com", phone: "8473341606", password: "password", dwelling_id: dwelling.id )
    test_expense=Expense.create!(name: "rent", description: "so expensive", amount: 680, payer_id: @test_user.id)
    test_expense.user_expenses.first.update!(paid: 30.00)
  end

  it { should belong_to(:dwelling) }
  it { should have_many(:user_expenses) }
  it { should have_many(:expenses).with_foreign_key(:payer_id) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should ensure_length_of(:password).is_at_least(6) }

  describe '#email' do
    it 'should create a user with a valid email' do
      user = User.create(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
      expect(user.id).should_not be_nil
    end

    it 'should not create a user with a invalid email' do
      user = User.create(name: "Example User", email: "userexample.com",
                     password: "foobar", password_confirmation: "foobar")
      expect(user.id).to be_nil
    end
  end

  describe "#authenticate" do
    it "can authenticate a user" do
      expect(@test_user.authenticate("password")).to be_truthy
      expect(@test_user.authenticate("fdlgjsfd")).to be_falsey
    end
  end
  describe "#total_expenses" do
    it "can show the user their total expense liability" do
      expect(@test_user.total_expenses).to eq(680.00)
    end
  end
  describe "#total_owed" do
    it "can show the user how much left they currently owe" do
      expect(@test_user.total_owed).to eq(650.00)
    end
  end
  describe "#total_paid" do
    it "can show the user how much of their total they have already paid" do
      expect(@test_user.total_paid).to eq(30.00)
    end
  end

  describe "#create_remember token" do
    @user = User.create(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")

    it 'should have a token when created' do
      expect{@user.remember_token}.should_not be_nil
    end

    pending 'should have a different token after signout' do
      expect{@user.destroy}.to change{@user.remember_token}
    end
  end
end
