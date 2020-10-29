class AdminUserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def destroy?
  #   current_user.id == 2
  # end
end
