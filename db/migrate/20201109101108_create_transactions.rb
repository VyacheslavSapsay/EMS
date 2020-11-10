class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
      create_table :transactions do |t|
        t.string :description
        t.timestamp :occured_at
        t.bigint :debit_amount
        t.bigint :credit_amount
        t.belongs_to :agent, foreign_key: true
        t.belongs_to :category, foreign_key: true
        t.belongs_to :project, foreign_key: true
        t.references :debit_account, null: true,  foreign_key: { to_table: :accounts }
        t.references :credit_account, null: true,  foreign_key: { to_table: :accounts }
        t.timestamps
      end

    add_reference :transactions, :author, references: :admin_users, index: true
    add_foreign_key :transactions, :admin_users, column: :author_id
  end
end
