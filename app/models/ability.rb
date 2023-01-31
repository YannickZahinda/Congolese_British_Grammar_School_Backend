# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      # return unless user.admin?
      # can :read, :all
      if user.admin?
        can :manage, all:
      end
  end
end
