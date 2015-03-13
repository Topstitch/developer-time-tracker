class DevelopersController < ApplicationController
  before_action :set_developer, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?
  before_action :developer_match?, only: [:edit, :update, :destroy]

  def index
    @developers = Developer.all
  end

  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      redirect_to developers_path, notice: 'Developer was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @developer.update(developer_params)
      redirect_to developers_path, notice: 'Developer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @developer.destroy
      redirect_to developers_path, notice: 'Developer was successfully deleted.'
    else
      redirect_to developers_path, notice: 'You cannot delete this developer due to their associated records.'
    end
  end

  private

  def set_developer
    @developer = Developer.find(params[:id])
  end

  def developer_params
    params.require(:developer).permit(:name, :email, :password)
  end

  def developer_match?
    if current_user.id != @developer.id
      redirect_to developers_path, notice: 'You can only edit your own records.'
    end
  end

end
