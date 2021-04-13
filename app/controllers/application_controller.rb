class ApplicationController < ActionController::Base
  before_action :set_user
  before_action :authenticate
  helper_method :current_user, :is_login?

  def current_user
    @current_user
  end

  def is_login?
    @current_user.present?
  end

  private
    def user_id
      session[:user] && session[:user][:id]
    end

    def set_user
      @current_user = nil
      if user_id
        username, email = session[:user].fetch_values(:username, :email)
        @current_user = User.find_or_create_by(id: user_id)
        @current_user.username = username
        @current_user.email = email
        @current_user.save
      end
    end

    def authenticate
      redirect_to ENV['SSO_URL'] unless is_login?
    end
end
