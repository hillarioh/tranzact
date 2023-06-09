class ApplicationController < ActionController::API
    attr_reader :current_user

    private
    def authenticate_request
        @current_user = AuthorizeRequest.call(request.headers).result
        render json: {error: 'Not Authorized'}, status: 401 unless @current_user
    end
end
