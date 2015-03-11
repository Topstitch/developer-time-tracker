class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private

  # def set_session
  #   session[:name] = params[:name] if params[:name]
  # end

  def current_user
    @current_user = Developer.find_by_id(session[:developer_id])
  end

  def logged_in?
    if current_user.nil?
      redirect_to logins_path
    end
  end
end
