module Authenticable
  def current_user
    @current_user ||= begin
      token = request.headers['Authorization']
      return unless token.present?
      decoded = JsonWebToken.decode(token)
      User.find(decoded[:user_id])
    end
  end
end
