class Budget < ApplicationRecord
  validates :category, :limit_amount, presence: true
end
