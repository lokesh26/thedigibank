class PaymentBuilder
  def initialize(args)
    @amount = args.fetch :amount
    @sender_id = args.fetch :sender_id
    @receiver_id = args.fetch :receiver_id
  end

  def create
    debit_sender_account
    credit_rceciever_account
    create_transaction_log
  end

  private

  attr_reader :amount, :sender_id, :receiver_id

  def debit_sender_account
    sender.debit_account(amount)
  end

  def credit_rceciever_account
    receiver.credit_account(amount)
  end

  def create_transaction_log
    transaction = Transaction.new(transaction_attributes)
    transaction.save
  end

  def sender
    @sender ||= Account.find(sender_id)
  end

  def receiver
    @receiver ||= Account.find(receiver_id)
  end

  def transaction_attributes
    {
      transaction_uuid: SecureRandom.uuid,
      amount: amount,
      sender_id: sender_id,
      receiver_id: receiver_id
    }
  end
end
