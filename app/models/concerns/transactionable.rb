module Transactionable
  extend ActiveSupport::Concern

  included do
    has_many :transactions, dependent: :nullify

    validates :name, presence: true
  end
end
