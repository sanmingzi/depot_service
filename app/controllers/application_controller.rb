class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :set_current_user
  before_action :authenticate
  helper_method :current_user, :pundit_user, :is_login?

  def current_user
    @current_user
  end

  def pundit_user
    UserContext.new(@current_user, session)
  end

  def is_login?
    @current_user != nil
  end

  private
    def user_id
      session[:user] && session[:user][:id]
    end

    def set_current_user
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
      redirect_to ENV['LOGIN_URL'] unless is_login?
    end

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
end
