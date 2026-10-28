class CreateUsersAndTransactions < ActiveRecord::Migration[7.0]
  def change
    unless table_exists?(:users)
      create_table :users do |t|
        t.string :name
        t.string :email
        t.string :password_digest
        t.timestamps
      end
      add_index :users, :email, unique: true
    end

    unless table_exists?(:transactions_items)
      create_table :transactions_items do |t|
        t.string :title
        t.decimal :amount, precision: 10, scale: 2
        t.string :tx_type
        t.string :mood
        t.integer :user_id
        t.timestamps
      end
    end
  end
end
