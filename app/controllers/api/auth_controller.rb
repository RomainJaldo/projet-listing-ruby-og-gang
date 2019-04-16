class Api::V1::AuthController < Api::V1::ApiController

    def create
      user = User.find_by(email: 'email@domain.com')
      token = nil

      if user
        if user.valid_password?(params[:password])
          token = user.generate_token.save
        end
      end

      if token
        render json: { success: true, token: token }
      else
        render json: {
          success: false,
          errors: [
            {user: [I18n.t('activerecord.errors.models.user.password')]}
          ]
        }, status: 401
      end
    end

end
