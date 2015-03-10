require 'test_helper'

class TimeEntriesControllerTest < ActionController::TestCase
  setup do
    @time_entry = time_entries(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create time_entry" do
    assert_difference('TimeEntry.count') do
      post :create, time_entry: { duration: 2.5, worked_on: "2015-03-09", project_id: 1, developer_id: 2}
    end
    assert_redirected_to root_path
  end

  test "should get edit" do
    get :edit, id: @time_entry
    assert_response :success
  end

  test "should update time_entry" do
    patch :update, id: @time_entry, time_entry: { duration: 4.5, worked_on: "2015-03-09", project_id: 1, developer_id: 2}
    assert_redirected_to root_path
  end

  test "should destroy time_entry" do
    assert_difference('TimeEntry.count', -1) do
      delete :destroy, id: @time_entry
    end
    assert_redirected_to root_path
  end

end
