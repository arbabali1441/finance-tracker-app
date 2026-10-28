class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.string :category
      t.decimal :limit_amount
      t.decimal :spent_amount
      t.string :currency
      t.string :recurrence
      t.string :filter_category

      t.timestamps
    end
  end
end
