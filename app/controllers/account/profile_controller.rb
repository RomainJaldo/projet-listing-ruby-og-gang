class Api::V1::Account::ProfileController < Api::ApiController

    def index
      @user = current_user
    end

    def show

    end

end
