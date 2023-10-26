class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self


  has_many :houses , dependent: :destroy
  has_many :feedbacks, dependent: :destroy 
  
  private 
  
  enum role: {admin: 0, owner: 1, user: 2} 
  after_initialize :set_default_role, if: :new_record?  
  def set_default_role
    self.role ||= :user
  end 
end
