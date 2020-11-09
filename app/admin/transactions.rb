ActiveAdmin.register Transaction do
  form title: 'Form' do |f|
    inputs 'Info' do
      f.input :description
      f.input :occured_at
      f.input :account_id, as: :select, collection: Account.all
      f.input :agent_id, as: :select, collection: Agent.all
      f.input :category_id, as: :select, collection: Category.all
      f.input :project_id, as: :select, collection: Project.all
      actions
    end
  end
end
