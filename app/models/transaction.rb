class Transaction < ApplicationRecord
  include AASM

  validates :customer_id, :input_amount, :input_currency, :output_amount, :output_currency, :date_of_transaction, :presence=> true

  enum status: {
    initial: 0,
    pending: 1,
    paid: 2,
    canceled: 3,
    refunded: 4
  }

  aasm column: :status, enum: true do
    state :initial, initial: true
    state :pending
    state :paid

    event :transition_status do
      transitions from: :initial, to: :pending, guard: :start_payment?
      transitions from: :pending, to: :paid, guard: :successful_payment?
    end

  end

  after_create :transition_status_in_background
  after_update :check

  private

  def start_payment?
    sleep(5) # simulate processing
    true
  end

  def check
    if self.status != 'paid' && self.status != 'refunded'
     transition_status_in_background
    else
      TransactionMailer.creation.deliver_later
    end
  end

  def successful_payment?
    sleep(5) # simulate processing
    true
  end

  def cancel_payment?
    sleep(5) # simulate processing
    true
  end

  def refund_payment?
    sleep(5) # simulate processing
    true
  end

  def transition_status_in_background
    TransactionJob.perform_later(id)
  end

  # def aasm_write_state(new_state)
  #   super
  #   if new_state == 'paid'
  #     Rails.logger.info "Transaction #{id} has been paid"
  #   else
  #     Rails.logger.info "Transaction #{id} has been refunded"  
  #   end
  # end

end
