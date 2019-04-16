require 'test_helper'

describe "Auth" do

    before do
      @user = User.create(
        firstname: 'prenom',
        lastname: 'nom',
        email: 'email@domain.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
    end

    it "Returns a token if I'm logged in" do
      post api_v1_auth_path, {
        email: @user.email,
        password: 'password123'
      }

      token = json_response['token']
      get api_v1_account_root_path

    end

    focus
    it "Returns 401 if credentials invalid" do
      post api_v1_auth_path, {
        email: @user.email,
        password: 'password123'
      }
      token = json_response['token']

      get api_v1_account_root_path, nil, {
        "HTTP-AUTHORIZATION": token
      }

      raise json_response.inspect
    end

end
