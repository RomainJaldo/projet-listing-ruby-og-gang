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

      assert_equal 200, last_responses.status
    end
end
