class Api::ApiController < ApplicationController

    protect_from_forgery with: :null_session

    before_action :auth_with_token

    private

    def auth_with_token
      user = User.finn_by(auth_token: request.headers["X-Auth"])

      raise user.inspect
    end

end
