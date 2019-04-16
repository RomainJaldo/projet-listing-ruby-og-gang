require 'test_helper'

describe User do

 it "display full_name" do
   user1 = User.find(users(:visitor).id)
   assert_equal "#{user1.firstname} #{user1.lastname}", user1.full_name

   user2 = User.find(users(:visitor).id)
   assert_equal "#{user2.firstname} #{user2.lastname}", user2.full_name

   user3 = User.find(users(:visitor).id)
   assert_equal "#{user3.firstname} #{user3.lastname}", user3.full_name
 end

 describe "generate_token" do
   it "generates a token" do
     token = @user.generate_token

     assert_equal 36, token.length
   end
 end
end
