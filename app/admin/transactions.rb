ActiveAdmin.register Transaction do
  permit_params :description, :occured_at, :account_id, :agent_id,
    :category_id, :project_id, :author_id, :credit_account_id, :debit_account_id,
    :credit_amount, :debit_amount

  form title: 'Form' do |f|
    inputs 'Info' do
      f.semantic_errors *f.object.errors.keys
      f.object.occured_at = DateTime.now
      f.object.author_id = current_admin_user.id if current_admin_user.user?
      f.input :description
      f.input :occured_at
      if current_admin_user.super?
        f.input :author_id, as: :select, collection: AdminUser.all
      else
        f.input :author_id, as: :hidden
      end
      f.input :credit_account_id, as: :select, collection: Account.all
      f.input :debit_account_id, as: :select, collection: Account.all
      f.input :debit_amount
      f.input :credit_amount
      f.input :agent_id, as: :select, collection: Agent.all
      f.input :category_id, as: :select, collection: Category.all
      f.input :project_id, as: :select, collection: Project.all
      actions
    end
  end
end
