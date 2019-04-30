class Api::V1::ApiController < ApplicationController

  protect_from_forgery with: :null_session

  before_action :auth_with_token

  private

  def auth_with_token
    user = User.find_by(auth_token: request.headers["X-Auth"])
  end

end
