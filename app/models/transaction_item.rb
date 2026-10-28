class TransactionItem < ApplicationRecord
  validates :title, :amount, :tx_type, presence: true
end
