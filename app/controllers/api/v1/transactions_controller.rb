class Api::V1::TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :update]

  def index
    @transactions = Transaction.all
    render json: @transactions
  end

  def show
    render json: @transaction
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def update
    if @transaction.update(transaction_params)
      render json: @transaction, status: :ok
    else 
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  private
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def transaction_params
      params.permit(:customer_id, :input_amount, :input_currency, :output_amount, :output_currency, :date_of_transaction)
    end
end
