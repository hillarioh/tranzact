# app/jobs/user_update_job.rb
class TransactionJob < ApplicationJob
  queue_as :default

  def perform(t_id)
    tn = Transaction.find(t_id)

    tn.transition_status!

    return
  end
end
