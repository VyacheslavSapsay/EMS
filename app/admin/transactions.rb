ActiveAdmin.register Transaction do
  menu priority: 3

  permit_params do
    Pundit.policy(current_admin_user, Transaction).permitted_attributes
  end

  index do
    selectable_column
    column :id
    column :description
    column :occured_at
    column :debit_account
    column('Debit amount', sortable: 'debit_amount_cents') { |t| t.debit_amount.format }
    column :credit_account
    column('Credit amount', sortable: 'credit_amount_cents') { |t| t.credit_amount.format }
    column :agent
    column :category
    column :project
    column :author
    actions
  end

  show do
    attributes_table do
      row :description
      row :occured_at
      row :author
      if transaction.debit_account_id.blank?
        row :credit_account
        row ('Credit amount') {|t| t.credit_amount.format }
      else
        row :debit_account
        row ('Debit amount') {|t| t.debit_amount.format }
      end
      row :project
      row :category
      row :agent
    end
  end

  form do |f|
    inputs 'Info' do
      f.semantic_errors *f.object.errors.keys
      f.object.occured_at ||= DateTime.now
      f.object.author_id = current_admin_user.id if current_admin_user.user?
      f.input :description
      f.input :occured_at, as: :datetime_picker
      if current_admin_user.super?
        f.input :author_id, as: :select, collection: AdminUser.all
      else
        f.input :author_id, as: :hidden
      end
      f.input :account_type, as: :select, collection: %i[debit credit]
      f.input :amount, as: :number
      f.input :account_id, as: :select, collection: Account.all
      f.input :agent_id, as: :select, collection: Agent.all
      f.input :category_id, as: :select, collection: Category.all
      f.input :project_id, as: :select, collection: Project.all
      actions
    end
  end

  sidebar :details, only: :show do
    attributes_table do
      row :created_at
      row :updated_at
    end
  end

  controller do

    def create
      transaction = Transaction.new(permitted_params[:transaction])
      if params[:transaction][:account_type].present?
        transaction.write_attribute("#{params[:transaction][:account_type]}_account_id",
          params[:transaction][:account_id])
        transaction.write_attribute("#{params[:transaction][:account_type]}_amount_cents",
          params[:transaction][:amount])
        if transaction.save
          redirect_to admin_transaction_path(transaction)
        else
          @resource = transaction
          render :new
        end
      else
        redirect_to new_admin_transaction_path,
        flash: {error: 'Choose account type'}
      end
    end
  end
end
