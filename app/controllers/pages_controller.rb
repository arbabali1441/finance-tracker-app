require 'csv'

class PagesController < ApplicationController
  before_action :ensure_authenticated_user, only: [:dashboard, :budgets, :profile, :settings, :subscription, :security, :bank_connect, :support]

  def landing_or_redirect
    if logged_in?
      redirect_to dashboard_path
    else
      render :landing
    end
  end

  def landing
    redirect_to dashboard_path if logged_in?
  end

  def dashboard
    @user = current_user
    @transactions = TransactionItem.order(created_at: :desc).limit(10)
    @wallets = Wallet.all
    @budgets = Budget.all
    @net_worth = @wallets.sum(:balance) + 142850.00
    @cash_flow = @transactions.where(tx_type: "Income").sum(:amount) - @transactions.where(tx_type: "Expense").sum(:amount) + 4250.00
    @runway = "18.4 Months"
    @health_score = "94 / 100"
  end

  def budgets
    @budgets = Budget.all
  end

  def profile
    @user = current_user
  end

  def settings
    @user = current_user
  end

  def subscription
  end

  def security
  end

  def bank_connect
  end

  def support
  end

  def pricing
  end

  def create_transaction
    TransactionItem.create!(
      title: params[:title],
      amount: params[:amount],
      tx_type: params[:tx_type]
    )
    redirect_to dashboard_path, notice: "Transaction committed successfully."
  end

  def destroy_transaction
    tx = TransactionItem.find(params[:id])
    tx.destroy
    redirect_to dashboard_path, notice: "Transaction removed from ledger."
  end

  def create_wallet
    Wallet.create!(
      name: params[:name],
      balance: params[:balance],
      currency: params[:currency]
    )
    redirect_to dashboard_path, notice: "New vault initialized successfully."
  end

  def create_budget
    Budget.create!(
      category: params[:category],
      limit_amount: params[:limit_amount],
      spent_amount: 0.0,
      currency: params[:currency],
      recurrence: params[:recurrence],
      filter_category: params[:filter_category]
    )
    redirect_to budgets_path, notice: "New budget created successfully."
  end

  def export_csv
    headers["Content-Type"] = "text/csv"
    headers["Content-Disposition"] = "attachment; filename=\"wealthpulse_statement_#{Date.today}.csv\""
    csv_data = CSV.generate(headers: true) do |csv|
      csv << ["ID", "Title", "Type", "Amount", "Date"]
      TransactionItem.all.each do |t|
        csv << [t.id, t.title, t.tx_type, t.amount, t.created_at]
      end
    end
    render plain: csv_data
  end

  private

  def ensure_authenticated_user
    unless logged_in?
      redirect_to login_path, alert: "Please sign in to access your workspace."
    end
  end
end
