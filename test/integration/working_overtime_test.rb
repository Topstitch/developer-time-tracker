require 'test_helper'

class WorkingOvertimeTest < ActionDispatch::IntegrationTest
  # Developer can log in and make 3 time entries.  Developer goes on overtime.  Developer sees their entries reflected on the project list page.
  setup do
    @developer = developers(:one)
    @date = Time.now
  end

  test "working overtime" do
    get root_path
    assert_redirected_to new_login_path
    post logins_path, {email: "sj@dev.com", password: "password"}
    assert_redirected_to root_path
    follow_redirect!
    assert_template "logins/dashboard"
    assert_select 'a#new-entry-link'
    get new_time_entry_path
    post time_entries_path, time_entry: {duration: 10, worked_on: @date, project_id: projects(:one).id, developer_id: @developer.id}
    assert_redirected_to root_path
    follow_redirect!
    assert_template "logins/dashboard"
    assert_select 'a#new-entry-link'
    get new_time_entry_path
    post time_entries_path, time_entry: {duration: 20, worked_on: @date, project_id: projects(:two).id, developer_id: @developer.id}
    assert_redirected_to root_path
    follow_redirect!
    assert_template "logins/dashboard"
    assert_select 'a#new-entry-link'
    get new_time_entry_path
    post time_entries_path, time_entry: {duration: 20, worked_on: @date, project_id: projects(:one).id, developer_id: @developer.id}
    assert_redirected_to root_path
    follow_redirect!
    assert_template "logins/dashboard"
    assert true, @developer.time_entries.count == 3
    assert true, @developer.overtime?
    assert_select 'p#overtime-warning'
    assert_select 'a#proj-index-link'
    get projects_path
    assert_template "projects/index"
    assert_select "tbody" do
      assert_select "tr", 2
      #2 projects, 1 row for each
    end
    assert_select "td", {:text => "Tacocat"}
    assert_select "td", {:text => "Potato"}
    assert_equal 30, projects(:one).total_hours
    assert_equal 20, projects(:two).total_hours
  end

end
