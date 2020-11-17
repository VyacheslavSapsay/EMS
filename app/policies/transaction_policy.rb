class TransactionPolicy < ApplicationPolicy
  def update?
    user.super? || owner?
  end

  def destroy?
    user.super?
  end

  def owner?
    user.id = record.author_id
  end

  def permitted_attributes
    %i[agent_id author_id category_id credit_account_id
      credit_amount debit_account_id debit_amount description occured_at
      project_id]
  end

  class Scope < Scope
    def resolve
      user.super? ? scope.all : scope.owner(user)
    end
  end
end
