class TimeEntriesController < ApplicationController
  before_action :set_time_entry, only: [:show, :edit, :update, :destroy]

  def index
    @time_entries = TimeEntry.all
  end

  def new
  end

  def create
    @time_entry = TimeEntry.new(time_entry_params)
    if @time_entry.save
      redirect_to time_entries_path, notice: 'Time Entry was successfully created.'
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
      redirect_to time_entries_path, notice: 'Time Entry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @time_entry.destroy
    redirect_to time_entries_path, notice: 'Time Entry was successfully deleted.'
  end

  private

  def set_time_entry
    @time_entry = TimeEntry.find(params[:id])
  end

  def time_entry_params
    params.require(:time_entry).permit(:name, :email, :password)
  end

end
