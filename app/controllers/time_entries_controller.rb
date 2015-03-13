class TimeEntriesController < ApplicationController
  before_action :set_time_entry, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?
  before_action :developer_match?, only: [:edit, :update, :destroy]

  def index
    @time_entries = TimeEntry.all
  end

  def new
    @time_entry = TimeEntry.new
  end

  def create
    @time_entry = TimeEntry.new(time_entry_params)
    if @time_entry.save
      redirect_to root_path, notice: 'Time Entry was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @time_entry.update(time_entry_params)
      redirect_to root_path, notice: 'Time Entry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @time_entry.destroy
    redirect_to root_path, notice: 'Time Entry was successfully deleted.'
  end

  private

  def set_time_entry
    @time_entry = TimeEntry.find(params[:id])
  end

  def time_entry_params
    params.require(:time_entry).permit(:duration, :worked_on, :developer_id, :project_id)
  end

  def developer_match?
    if current_user.id != @time_entry.developer_id
      redirect_to root_path, notice: 'You can only edit your own records.'
    end
  end

end
