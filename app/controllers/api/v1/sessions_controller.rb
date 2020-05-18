module Api
  module V1
    class SessionsController < ApiController
      skip_before_action :check_authentication

      def create
        user = User.find_by_email(session_params[:email])
        if user&.authenticate(session_params[:password])
          render json: { token: JsonWebToken.encode(user_id: user.id), email: user.email }
        else
          head :unaurthorized
        end
      end

      private

      def session_params
        params.require(:session).permit(:email, :password)
      end
    end
  end
end
