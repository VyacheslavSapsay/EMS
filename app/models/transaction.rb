class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :author, class_name: :AdminUser, foreign_key: :author_id
  belongs_to :agent
  belongs_to :category
  belongs_to :project
end
