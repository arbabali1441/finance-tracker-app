class CreateTransactionItems < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_items do |t|
      t.string :title
      t.decimal :amount
      t.string :tx_type
      t.string :mood
      t.integer :user_id

      t.timestamps
    end
  end
end
