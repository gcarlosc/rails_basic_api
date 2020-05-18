module Api
  module V1
    class ApiController < ActionController::API
      include Authenticable
      include ExceptionHandler

      before_action :check_authentication

      def check_authentication
        head :forbidden unless current_user
      end
    end
  end
end
