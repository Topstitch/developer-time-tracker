require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "check if project has name" do
    project = Project.new(max_hours: 10)
    assert_not project.save
  end

  test "check if project has unique name" do
    project = Project.new(name:"Tacocat", max_hours: 5)
    assert_not project.save
  end

  test "can't delete a project with time entries" do
    project = Project.create(name:"MyString", max_hours: 5)
    time_entry = TimeEntry.new(duration: 4.5, worked_on: "2015-03-09", project_id: project.id, developer_id: 1)
    project.destroy
    refute project == nil
  end

end
