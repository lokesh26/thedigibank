class Accounts::TransactionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @transaction = @account.transactions.build
  end

  def create
    return redirect_to_new_transaction unless payment_receiver.present?
    return redirect_to_new_transaction unless sufficient_balance.present?

    PaymentBuilder.new(payment_params).create
    flash[:notice] = 'Transaction successful'
    redirect_to root_path
  rescue ActiveRecord::RecordInvalid
    render action: 'new'
  end

  def sent
    @sent_transactions = @account.transactions.order("created_at DESC").paginate(page: params[:page], per_page: 5)   
  end

  def received
    @received_transactions = @account.received_transactions.order("created_at DESC").paginate(page: params[:page], per_page: 5)
  end

  private

  def redirect_to_new_transaction
    flash[:alert] = "Receiver account not found or insufficient funds"
    redirect_to new_accounts_transaction_path
  end

  def sufficient_balance
    @account.balance >= BigDecimal(transaction_params[:transaction][:amount])
  end

  def payment_receiver
    @receiver ||= Account.find_by(
      account_number: transaction_params[:account_number]
    )
  end

  def payment_params
    {
      amount: transaction_params[:transaction][:amount],
      receiver_id: payment_receiver.id,
      sender_id: @account.id
    }
  end

  def transaction_params
    params.permit(:account_number, transaction: [:amount])
  end  
end
