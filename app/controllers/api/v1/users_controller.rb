module Api
  module V1
    class UsersController < ApiController

      def me
        render json: current_user
      end

      def index
        render json: User.all
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: user, status: :created
        else
          render json: user.errors.full_messages, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
