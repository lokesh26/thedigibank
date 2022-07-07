class Account < ApplicationRecord
  belongs_to :user

  has_many :transactions, :class_name => 'Transaction', :foreign_key => 'sender_id'
  has_many :received_transactions, :class_name => 'Transaction', :foreign_key => 'receiver_id'

  validates :user_id, presence: true, uniqueness: true
  validates :account_number, presence: true, uniqueness:  { case_sensitive: true }
  validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0 }  
end
