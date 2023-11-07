require 'rails_helper'

RSpec.describe User, type: :model do
  context 'has associations with different model' do
    it 'has many houses with dependent destroy' do
      expect(User.reflect_on_association(:houses).options[:dependent]).to eq(:destroy)
    end

    it 'has many feedbacks with dependent destroy' do
      expect(User.reflect_on_association(:feedbacks).options[:dependent]).to eq(:destroy)
    end
  end

  context 'enums' do
    it 'defines the role enum with correct values' do
      expect(User.roles.keys).to eq(%w[admin owner user])
      expect(User.roles.values).to eq([0, 1, 2])
    end
  end

 
  context 'default role' do
    it 'sets the default role to user' do
      user = FactoryBot.build(:user)
      user.save
      expect(user.role).to eq('user')
    end
  end
  context 'callbacks' do
    it 'calls set_default_role after initialization' do
      expect_any_instance_of(User).to receive(:set_default_role)
      User.new
    end

    it 'does not change role if it is already set' do
      user = FactoryBot.build(:user, role: :admin)
      expect(user.role).to eq('admin')
    end
  end 
end
