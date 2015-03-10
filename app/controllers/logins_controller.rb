class LoginsController < ApplicationController
  before_action :set_login, only: [:destroy]

  def new
  end

  def create
    @login = Login.new(login_params)
    if @login.save
      redirect_to root_path, notice: 'Login was successful.'
    else
      render :new
    end
  end


  def destroy
    @login.destroy
    redirect_to new_login_path, notice: 'You have logged out.'
  end

  private

  def set_login
    @login = Login.find(params[:id])
  end

  def login_params
    params.require(:login).permit(:name, :email, :password)
  end

end
