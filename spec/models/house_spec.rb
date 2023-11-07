require 'rails_helper'

RSpec.describe House, type: :model do
  context 'associations' do
    it 'belongs to user' do 
      expect(House.reflect_on_association(:user).macro).to eq(:belongs_to)
    end 
    it 'has many feedbacks with dependent destroy' do
      expect(House.reflect_on_association(:feedbacks).options[:dependent]).to eq(:destroy)
    end
  end
  

  context 'validations' do
    it 'validates the presence of name' do
      house = FactoryBot.build(:house, name: nil)
  
      expect(house).to be_invalid
      expect(house.errors[:name]).to include("can't be blank")
    end

    it 'validates the presence of location' do 
      house = FactoryBot.build(:house, location: nil)

      expect(house).to be_invalid
      expect(house.errors[:location]).to include("can't be blank")
    end 

    it 'validates the presence of amount' do 
      house = FactoryBot.build(:house, amount: nil)
    
      expect(house).to be_invalid
      expect(house.errors[:amount]).to include("can't be blank")
    end
    
    it 'validates the presence of price_for' do
      house = FactoryBot.build(:house, price_for: nil)
      house.valid?
      expect(house.errors[:price_for]).to include("can't be blank")
    end
  
    it 'validates the presence of price_for with a valid enum value' do
      house = FactoryBot.build(:house, price_for: :rent_price)
      house.valid?
      expect(house.errors[:price_for]).not_to include("can't be blank")
    end 

    it 'validates the presence of available_for' do
      house = FactoryBot.build(:house, available_for: nil)
      house.valid?
      expect(house.errors[:available_for]).to include("can't be blank")
    end
  
    it 'validates the presence of available_for with a valid enum value' do
      house = FactoryBot.build(:house, available_for: :buy)
      house.valid?
      expect(house.errors[:available_for]).not_to include("can't be blank")
    end 

    it 'validates the presence of status' do 
      house = FactoryBot.build(:house, status: nil)
      house.valid? 
      expect(house.errors[:status]).to include("can't be blank")
    end
    
    it 'validates the presence of status with a valid enum value' do 
      house = FactoryBot.build(:house, status: :available)
      house.valid?
      expect(house.errors[:status]).not_to include("can't be blank") 
    end 

  end 
end

