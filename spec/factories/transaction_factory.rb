FactoryBot.define do
  factory :transaction do
    transaction_uuid { SecureRandom.uuid }
    amount { 10.00 }
  end
end
