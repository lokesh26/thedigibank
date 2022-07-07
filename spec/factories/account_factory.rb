FactoryBot.define do
  factory :account do
    account_number { Faker::Bank.account_number }
    balance { 1000.00 }
  end
end
