FactoryBot.define do
  factory :transaction do
    customer_id  rand(1..10)}
    input_amount {Faker::Number.decimal(r_digits: 2, l_digits: 4)}
    output_amount {Faker::Number.decimal(r_digits: 2, l_digits: 4)}
    input_currency {Faker::Currency.code}
    output_currency {Faker::Currency.code}
    date_of_transaction {DateTime.now() }
  end
end