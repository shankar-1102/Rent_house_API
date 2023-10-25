class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self


  has_many :houses 
  has_many :feedbacks   
  
  private 
  
  enum role: {admin:0, owner: 1, user: 2}   
end
