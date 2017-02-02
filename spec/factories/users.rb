FactoryGirl.define do
  factory :user do
    email { User::VALID_EMAILS.first }
  end
end
