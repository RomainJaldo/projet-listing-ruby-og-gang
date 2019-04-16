class Account::ContactsController < ApplicationController

    def index
      @messages = Message.joins(:post).where("posts.user_id" => current_user.id);
    end

end
