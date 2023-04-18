require "rails_helper"
require 'json'

RSpec.describe 'Authentication', :type => :request do
    let!(:user1) {User.create(username: "lucky",password: "12345")}
    describe 'POST /authenticate' do
        context 'with invalid credentials' do
            before do
                post '/api/v1/authenticate', params:
                                { username: "lecrae",
                                password: "12345"  }
            end
            it 'returns unauthorized' do
                expect(response).to have_http_status(:unauthorized)
            end
        end
        context 'with valid credentials' do
            before do
                post '/api/v1/authenticate', params:
                                { username: "lucky",
                                password: "12345"  }
            end
            it 'returns a auth token with status 200' do
                expect(response).to have_http_status(200)
            end
        end
    end  
end
