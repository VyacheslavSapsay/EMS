ActiveAdmin.register Transaction do
  permit_params :account_id, :agent_id, :author_id, :category_id,
     :credit_account_id, :credit_amount, :debit_account_id, :debit_amount,
     :description, :occured_at, :project_id

  index do
    selectable_column
    column :id
    column :description
    column :occured_at
    column :debit_account
    column("Debit amount", sortable: true) {|t| t.debit_amount.format }
    column :credit_account
    column("Credit amount", sortable: true) {|t| t.credit_amount.format }
    column :agent
    column :category
    column :project
    column :author
    actions
  end

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
      f.input :credit_amount
      f.input :debit_account_id, as: :select, collection: Account.all
      f.input :debit_amount
      f.input :agent_id, as: :select, collection: Agent.all
      f.input :category_id, as: :select, collection: Category.all
      f.input :project_id, as: :select, collection: Project.all
      actions
    end
  end
end
