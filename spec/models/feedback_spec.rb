require 'rails_helper'

RSpec.describe Feedback, type: :model do
  
  context 'association' do 
    it 'belongs to house' do 
      expect(Feedback.reflect_on_association(:house).macro).to eq(:belongs_to)
    end 

    it 'belongs to user' do 
      expect(Feedback.reflect_on_association(:user).macro).to eq(:belongs_to)
    end 
  end 

  context 'validation' do
    it 'validates the presence of feedback ' do 
      feedback = FactoryBot.build(:feedback, feedback: nil)
      feedback.valid? 
      expect(feedback.errors[:feedback]).to include("can't be blank")
    end 

    # it 'validates the feedback should be maximum length' do 

    # end 

    it 'validate the presence of rating' do 
      feedback = FactoryBot.build(:feedback, rating: nil)
      feedback.valid? 
      # expect(feedback.errors[:rating]).to include("can't be blank")
      expect(feedback).to be_invalid 
      expect(feedback.rating).to be_nil
    end 

    it 'validate the rating' do 
      feedback = FactoryBot.build(:feedback, rating: 5)
      feedback.valid?
      # expect(feedback).to be_invalid 
      expect(feedback.rating).to eq(5)
    end 

    it 'validate the rating ' do 
      feedback = FactoryBot.build(:feedback, rating: 12)
      feedback.valid? 
      expect(feedback).to be_invalid
      expect(feedback.errors[:rating]).to include("must be less than or equal to 5")
    end 
  end 
end
