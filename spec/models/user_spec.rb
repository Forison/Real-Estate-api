require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Test User model validation' do
    it 'create new user' do
      new_user = create(:user)
      expect(new_user).to be_valid
    end

    it 'Is invalid if username is nil/empty' do
      nil_username = build(:user, username: '')
      expect(nil_username).not_to be_valid
    end

    it 'Is invalid if email is nil/empty' do
      nil_email = build(:user, email: '')
      expect(nil_email).not_to be_valid
    end

    it 'Is invalid if country is nil/empty' do
      nil_country = build(:user, country: '')
      expect(nil_country).not_to be_valid
    end

    it 'Is invalid if password is nil/empty' do
      nil_password = build(:user, password_digest: '')
      expect(nil_password).not_to be_valid
    end

    it 'Is invalid if picture is nil/empty' do
      nil_picture = build(:user, picture: '')
      expect(nil_picture).not_to be_valid
    end
  end
end
