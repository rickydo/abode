# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_expense do
    expense nil
    user nil
  end
end
