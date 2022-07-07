require 'rails_helper'

describe Account do
  let!(:user) { create :user }
  let!(:account) { create :account, account_number: "tdb000001", user: user }

  describe 'associations' do
    it { is_expected.to(belong_to(:user)) }
    it { is_expected.to have_many(:sent_transactions) }
    it { is_expected.to have_many(:received_transactions) }
  end

  describe '#validation' do  
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:balance) }
    it { is_expected.to validate_presence_of(:account_number) }
    it { is_expected.to validate_uniqueness_of(:account_number) }
    it { is_expected.to validate_numericality_of(:balance) }

    context 'balance' do
      context 'greater than 0' do
        let(:new_user) { create :user }
        let(:new_account) do
          build(:account, user: new_user, balance: -10.99)
        end

        it 'should not be valid' do
          expect(new_account).not_to be_valid
        end
      end    
    end
  end
end
