class TransactionPolicy < ApplicationPolicy
  def update?
    user.super? || record.author_id == user.id
  end

  def destroy?
    user.super?
  end

  class Scope < Scope
    def resolve
      user.super? ? scope.all : scope.where(author_id: user.id)
    end
  end

end
