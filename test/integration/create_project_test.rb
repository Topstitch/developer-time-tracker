require 'test_helper'

class CreateProjectTest < ActionDispatch::IntegrationTest
  # developer logs in, and creates a new project, and then adds a time entry to that project
  setup do
    @developer = developers(:one)
  end

  test "create project with a time entry" do
    get root_path
    assert_redirected_to new_login_path
    post logins_path, {email: "sj@dev.com", password: "password"}
    assert_redirected_to root_path
    follow_redirect!
    assert_template "logins/dashboard"
    assert_select 'a#proj-index-link'
    get projects_path
    assert_template "projects/index"
    assert_select 'a#new-proj-link'
    get new_project_path
    post projects_path, project: {name: "Majestic Cats", max_hours: 100}
    assert_redirected_to projects_path
    follow_redirect!
    assert_select 'a#go-to-root'
    get root_path
    assert_select 'a#new-entry-link'
    get new_time_entry_path
    project = Project.find_by(name: "Majestic Cats")
    assert true, project.time_entries.count == 0
    post time_entries_path, time_entry: { duration: 3.5, worked_on: "2015-03-09", project_id: project.id, developer_id: @developer.id}
    assert true, project.time_entries.count == 1
  end

end
