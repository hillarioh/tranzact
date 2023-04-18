class TransactionMailer < ApplicationMailer
    default from: 'okerioh@gmail.com'

    def creation
        @user = params[:user]
        mail(to: @user.email, subject: 'Transaction status.')
    end

end
