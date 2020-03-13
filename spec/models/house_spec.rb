require 'rails_helper'

RSpec.describe House, type: :model do
  describe 'Test User model validation' do
    before(:each) do
      @user = create(:user)
    end
    
    it 'create new user' do
      new_home = create(:house, user_id: @user.id)
      expect(new_home).to be_valid
	end

	it 'Is invalid if name is nil/empty' do
      nil_name = build(:house, name: '')
      expect(nil_name).not_to be_valid
	end

	it 'Is invalid if category is nil/empty' do
      nil_category = build(:house, category: '')
      expect(nil_category).not_to be_valid
	end
		
	it 'Is invalid if description is nil/empty' do
      nil_description = build(:house, description: '')
      expect(nil_description).not_to be_valid
	end

	it 'Is invalid if price nil/empty' do
      nil_price = build(:house, price: '')
      expect(nil_price).not_to be_valid
	end

	it 'Is invalid if location is nil/empty' do
      nil_location = build(:house, location: '')
      expect(nil_location).not_to be_valid
    end
    it 'Is invalid if location is nil/empty' do
      nil_pictures = build(:house, pictures: '')
      expect(nil_pictures).not_to be_valid
	end
  end
end