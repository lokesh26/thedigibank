class SendingToSelfValidator < ActiveModel::Validator
  def validate(record)
    return true unless record.sender == record.receiver

    record.errors.add(:receiver_id, 'Receiver can not be same as sender')
  end
end
