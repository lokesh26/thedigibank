class Account < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :account_number, presence: true, uniqueness:  {case_sensitive: true}
  validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0}  
end
