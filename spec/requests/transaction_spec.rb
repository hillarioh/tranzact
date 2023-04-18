require "rails_helper"

RSpec.describe 'Transaction', :type => :request do
    let!(:user1) {User.create(username: "lucky",password: "12345")}
    let!(:input) {   {:customer_id=> 1,
        :input_amount=> 1000.12,
        :output_amount=> 250.23,
        :input_currency=> "EUR",
        :output_currency=> "USD",
        :date_of_transaction=> DateTime.now()
        }
    }
    let!(:input2) {   {:customer_id=> 1,
        :input_amount=> 1000.12,
        :output_amount=> 250.23,
        }
    }
    let!(:input3) {   {:customer_id=> 1,
        :input_amount=> 1000.12,
        :output_amount=> 250.23,
        :input_currency=> "EUR",
        :output_currency=> "YEN",
        :date_of_transaction=> DateTime.now()
        }
    }
    describe 'POST /api/v1/transactions' do
        it "succeeds if its authenticated and post transactions" do
            get_token
            token = JSON.parse(response.body)
             post_transaction('/api/v1/transactions',input,token["auth_token"])
            expect(response).to have_http_status(:created)
        end
        it "returns unauthorized if no authentication is included" do            
             post_transaction('/api/v1/transactions',input)
            expect(response).to have_http_status(:unauthorized)
        end
        it "validates inputs required" do
            get_token
            token = JSON.parse(response.body)
             post_transaction('/api/v1/transactions',input2,token["auth_token"])
            expect(response).to have_http_status(422)
        end
        it "get lists all transactions" do
            get_token
            token = JSON.parse(response.body)
            get_transactions('/api/v1/transactions',token["auth_token"])
            expect(response).to have_http_status(200)
        end
        it "get a single transactions" do
            get_token
            token = JSON.parse(response.body)
            get_transactions('/api/v1/transactions/1',token["auth_token"])
            expect(response).to have_http_status(200)
        end
    end 
    describe 'PUT /api/v1/transaction' do
        it "updates with correct token and payload" do
            get_token
            token = JSON.parse(response.body)
            put_transaction( '/api/v1/transactions/1',input3,token["auth_token"])
            expect(response).to have_http_status(200)            
        end
        
    end
end
