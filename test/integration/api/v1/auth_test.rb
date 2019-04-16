require 'test_helper'

feature "Auth" do

    before do
      
      @user = User.create(
        email: 'email@domain.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
    end

    focus
    it "Returns a token if I'm logged in" do
      post api_v1_auth_path, {
        email: @user.email,
        password: 'password123'
      }

      assert_equal 200, last_responses.status
    end
end
