require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "check if project has name" do
    project = Project.new(max_hours: 10)
    assert_not project.save
  end

  test "check if project has unique name" do
    project = Project.new(name:"MyString", max_hours: 5)
    assert_not project.save
  end

  
end
