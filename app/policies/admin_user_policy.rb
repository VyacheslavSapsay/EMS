class AdminUserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user.id == record.id || user.role == "super"
  end

  def destroy?
    user.role == "super" && user.id != record.id
  end

  def update?
    user.role == "super" || user.id == record.id
  end
end
