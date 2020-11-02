class AdminUserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    user.role == "super" && user.id != record.id
  end

  def update?
    user.role == "super" || user.id == record.id
  end
end
