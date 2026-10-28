class Wallet < ApplicationRecord
  validates :name, :balance, presence: true
end
