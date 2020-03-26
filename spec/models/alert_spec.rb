require 'rails_helper'

RSpec.describe Alert, type: :model do
  describe 'Test Alert model validation' do
    it 'create new message' do
      new_alert = create(:alert)
      expect(new_alert).to be_valid
    end

    it 'Is invalid if sender is nil/empty' do
      nil_sender = build(:alert, sender: '')
      expect(nil_sender).not_to be_valid
    end

    it 'Is invalid if email is nil/empty' do
      nil_message = build(:alert, message: '')
      expect(nil_message).not_to be_valid
    end
  end
end
