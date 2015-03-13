require 'test_helper'

class TimeEntriesControllerTest < ActionController::TestCase
  setup do
    @developer = developers(:one)
    @time_entry = time_entries(:one)
    session[:developer_id] = @developer.id
    @project = projects(:one)
    #generally, I like to use fixtures, but @special_time_entry was the best way I could think of to associate a time entry with the first fixture developer...it won't let you edit or delete a time entry unless you are the developer who is signed in
    @special_time_entry = TimeEntry.create(duration: 6.5, worked_on: "2015-03-09", project_id: @project.id, developer_id: @developer.id)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create time_entry" do
    assert_difference('TimeEntry.count') do
      post :create, time_entry: { duration: 2.5, worked_on: "2015-03-09", project_id: @project.id, developer_id: @developer.id}
    end
    assert_redirected_to root_path
  end

  test "should get edit" do
    get :edit, id: @special_time_entry
    assert_response :success
  end

  test "should update time_entry" do
    patch :update, id: @time_entry, time_entry: {duration: 4.5, worked_on: "2015-03-09", project_id: @project.id, developer_id: @developer.id}
    assert_redirected_to root_path
  end

  test "should destroy time_entry" do
    assert_difference('TimeEntry.count', -1) do
      delete :destroy, id: @special_time_entry
    end
    assert_redirected_to root_path
  end

  test "should not destroy another's time entry" do
    sneakydeveloper = developers(:two)
    session[:developer_id] = sneakydeveloper.id
    assert_no_difference('TimeEntry.count', -1) do
      delete :destroy, id: @special_time_entry
    end
  end
end
