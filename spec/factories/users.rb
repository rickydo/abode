# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString"
    phone "MyString"
    password_digest "MyString"
    string "MyString"
    dwelling nil
  end
end
