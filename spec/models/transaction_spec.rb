require "rails_helper"

RSpec.describe Transaction, :type => :model do
  describe 'Check for validation of Transaction inputs' do
    it 'is valid with valid attributes' do
      expect(Transaction.create).to_not be_valid
    end
    it { should validate_presence_of(:input_amount) }
    it { should validate_presence_of(:input_currency) }
    it { should validate_presence_of(:output_amount) }
    it { should validate_presence_of(:output_currency) }
    it { should validate_presence_of(:date_of_transaction) }
  end
end
