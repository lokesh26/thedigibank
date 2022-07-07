require 'rails_helper'

describe Transaction do
  let!(:user1) { create :user }
  let!(:account1) { create :account, account_number: "tdb000001", user: user1 }

  let!(:user2) { create :user }
  let!(:account2) { create :account, account_number: "tdb000002", user: user2 }

  let!(:transaction) { create :transaction, sender: account1, receiver: account2 }

  describe 'associations' do
    it { is_expected.to(belong_to(:sender)) }
    it { is_expected.to(belong_to(:receiver)) }
  end

  describe '#validation' do  
    it { is_expected.to validate_presence_of(:sender_id) }
    it { is_expected.to validate_presence_of(:receiver_id) }
    it { is_expected.to validate_presence_of(:transaction_uuid) }
    it { is_expected.to validate_uniqueness_of(:transaction_uuid) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }

    context 'sending amount to yourself' do
      let(:self_transaction) { build :transaction, sender: account1, receiver: account1 }

      it 'should not be valid' do
        expect(self_transaction).not_to be_valid
      end   
    end
  end
end
