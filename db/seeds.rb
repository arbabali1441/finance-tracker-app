Transaction.destroy_all
User.destroy_all

user = User.create!(name: "Arbab Ali", email: "admin@wealthpulse.com", password: "password123")

Transaction.create!([
  { title: "Monthly Salary", amount: 6500.00, category: "Salary", transaction_type: "Income", date: Date.today - 2.days, account: "Bank Account" },
  { title: "Client Web Development", amount: 2100.00, category: "Freelance", transaction_type: "Income", date: Date.today - 5.days, account: "Bank Account" },
  { title: "Downtown Apartment Rent", amount: 2200.00, category: "Rent", transaction_type: "Expense", date: Date.today - 3.days, account: "Bank Account" },
  { title: "Supermarket Groceries", amount: 385.50, category: "Food & Drink", transaction_type: "Expense", date: Date.today - 1.day, account: "Cash" },
  { title: "Binance Crypto Staking", amount: 450.00, category: "Crypto", transaction_type: "Expense", date: Date.today, account: "Crypto Wallet" },
  { title: "Netflix & Spotify Sub", amount: 35.99, category: "Subscriptions", transaction_type: "Expense", date: Date.today - 6.days, account: "Credit Card" },
  { title: "Client Business Dinner", amount: 150.00, category: "Food & Drink", transaction_type: "Expense", date: Date.today - 4.days, account: "Credit Card" }
])
puts "✅ WealthPulse Database Seeded Successfully!"
