require 'rails_helper'

describe User do
  describe 'associations' do
    it { is_expected.to(have_one(:account).dependent(:destroy))  }
  end
end
