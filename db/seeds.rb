# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  20.times do 
    transaction = Transaction.create(
        customer_id: rand(1..10),
        input_amount: Faker::Number.decimal(r_digits: 2, l_digits: 4),
        output_amount: Faker::Number.decimal(r_digits: 2, l_digits: 4),
        input_currency: Faker::Currency.code,
        output_currency: Faker::Currency.code,
        date_of_transaction: DateTime.now()        
    )
  end

  5.times do
    user = User.create(
      username: Faker::Name.first_name, 
      password: "1234567"
    )
  end

