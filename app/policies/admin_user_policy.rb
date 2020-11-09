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
    user.super? || owner?
  end

  def create?
    user.super?
  end

  def update?
    user.super? || owner?
  end

  def destroy?
    user.super? && !owner?
  end

  private

  def owner?
    user.id == record.id
  end

end
