class AdminUserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.super?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end

  def show?
    user.super? || user.id == record.id
  end

  def create?
    user.super?
  end

  def update?
    user.super? || user.id == record.id
  end

  def destroy?
    user.super? && user.id != record.id
  end
end
