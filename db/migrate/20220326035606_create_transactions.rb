class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :customer_id
      t.float :input_amount
      t.float :output_amount
      t.string :input_currency
      t.integer :status, default: 0
      t.string :output_currency
      t.datetime :date_of_transaction

      t.timestamps
    end
  end
end
