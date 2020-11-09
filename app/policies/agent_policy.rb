class AgentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.super?
  end

  def update?
    user.super?
  end

  def destroy?
    user.super?
  end
end
