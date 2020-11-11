class AdminUserPolicy < ApplicationPolicy
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

  class Scope < Scope
    def resolve
      user.super? ? scope.all : scope.where(id: user.id)
    end
  end

  private

  def owner?
    user.id == record.id
  end
end
