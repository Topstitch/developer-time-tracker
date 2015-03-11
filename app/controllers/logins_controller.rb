class LoginsController < ApplicationController

  def new
  end

  def dashboard
    @time_entries = Developer.last.time_entries
  end

  def create
    if request.post?
      developer = Developer.find_by_email(params[:email])
      if developer && developer.authenticate(params[:password])
        session[:developer_id] = developer.id
        flash[:notice] = "Welcome!"
        redirect_to root_path
      else
        flash[:notice] = "Invalid e-mail or password."
        redirect_to new_login_path
      end
    end
  end


  def destroy
    session[:developer_id] = nil
    redirect_to new_login_path, notice: 'You have logged out.'
  end



end
