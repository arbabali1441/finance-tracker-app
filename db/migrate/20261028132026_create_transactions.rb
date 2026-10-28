class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :title
      t.decimal :amount
      t.string :category
      t.string :transaction_type
      t.date :date

      t.timestamps
    end
  end
end
