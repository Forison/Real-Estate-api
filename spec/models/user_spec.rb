require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Test User model validation' do
    it 'create new user' do
      new_user = create(:user)
      expect(new_user).to be_valid
		end
	end
end