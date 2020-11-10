class TransactionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    user.super? || record.author_id == user.id
  end

  def destroy?
    user.super?
  end

end
