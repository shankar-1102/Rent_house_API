# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin? 
      can :manage, :all 
    elsif user.owner?
      alias_action :read, :create, to: :action
      can :action, House
      can :update , House, user_id: user.id
      can :destroy, House, user_id: user.id
    elsif user.user?
      alias_action :upadte,  :destroy,  to: :feedback_action
      can :feedback_action, Feedback, user_id: user.id
      can :read, House 
      can :read, Feedback 
      can :create, Feedback 
    end 
  end
end 
