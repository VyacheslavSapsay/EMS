class Category < ApplicationRecord
  include Transactionable
  scope :top_expenses, -> { CategoriesTopExpensesQuery.call }
end
