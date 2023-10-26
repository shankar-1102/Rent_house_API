# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # for Admin 
    can :manage, :all if user.admin? 
    
    # for owner 
    return unless user.role.eql?("owner")
    alias_action :read, :create, to: :action
    can :action, House
    can :update , House, user_id: user.id
    can :destroy, House, user_id: user.id

    # for user 
    return unless user.role.eql?("user")
    alias_action :upadte,  :destroy,  to: :feedback_action
    can :feedback_action, Feedback, user_id: user.id
    can :read, House 
    can :read, Feedback 
    can :create, Feedback 

  end
end 
