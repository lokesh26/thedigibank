class Accounts::TransactionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @transaction = @account.transactions.build
  end

  def create
    return receiver_not_found unless payment_receiver.present?
    return insufficient_balance unless sufficient_balance.present?
    return sending_to_self if sender_same_as_receiver

    PaymentBuilder.new(payment_params).create
    flash[:notice] = 'Transaction successful'
    redirect_to root_path
  rescue ActiveRecord::RecordInvalid
    render action: 'new'
  end

  def sent
    @sent_transactions = @account.transactions.order("created_at DESC")
                                 .paginate(page: params[:page], per_page: 5)   
  end

  def received
    @received_transactions = @account.received_transactions.order("created_at DESC")
                                     .paginate(page: params[:page], per_page: 5)
  end

  private

  def receiver_not_found
    flash[:alert] = "Receiver account not found"
    redirect_to new_accounts_transaction_path    
  end

  def insufficient_balance
    flash[:alert] = "Insufficient funds"
    redirect_to new_accounts_transaction_path
  end

  def sending_to_self
    flash[:alert] = "Can not send to yourself"
    redirect_to new_accounts_transaction_path
  end  

  def sender_same_as_receiver
    @account == payment_receiver
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
