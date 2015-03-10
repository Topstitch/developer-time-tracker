class LoginsController < ApplicationController

  def new
  end

  def dashboard
  end
  
  def create
    if #the right username and password, then
      #and change the session SOMEHOW
      redirect_to root_path, notice: 'Login was successful.'
    else
      render :new
    end
  end


  def destroy
    #change the session somehow
    redirect_to new_login_path, notice: 'You have logged out.'
  end



end
