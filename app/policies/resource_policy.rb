class ResourcePolicy < ApplicationPolicy
  def create?
    user.super?
  end

  def update?
    user.super?
  end

  def destroy?
    user.super?
  end

  def permitted_attributes
    %i[name]
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
