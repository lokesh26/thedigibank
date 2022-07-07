class Transaction < ApplicationRecord
  belongs_to :sender, class_name: 'Account'
  belongs_to :receiver, class_name: 'Account'

  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validates :transaction_uuid, presence: true, uniqueness: {case_sensitive: true}
  validates :amount, presence: true, numericality: { greater_than: 0 }

  validates_with SendingToSelfValidator
end
