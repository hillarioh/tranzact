module ApiHelpers
    def headers(options)       
        { HTTP_AUTHORIZATION: "Bearer #{options}"}
    end
    def get_transactions(route,token={})
        get route, headers: headers(token)
    end
    def post_transaction(route, params = {},token={})
        post route, params: params, headers: headers(token)
    end
    def put_transaction(route, params = {},token={})
        put route, params: params, headers: headers(token)
    end
    def get_token
        post '/api/v1/authenticate', params:  {username: "lucky", password: "12345"}
    end
end


