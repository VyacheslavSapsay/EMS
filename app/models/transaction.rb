class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :agent
  belongs_to :category
  belongs_to :project
end
