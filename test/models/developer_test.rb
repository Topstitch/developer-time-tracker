require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase

  test "check if developer has name" do
    developer = Developer.new(email: "fred@dev.com", password: "potato")
    assert_not developer.save
  end

  test "check if developer has unique email" do
    developer = Developer.new(name:"Sarah Jessica", email: "sj@dev.com", password: "potato")
    assert_not developer.save
  end

  test "check overtime method" do
    developer1 = developers(:one)
    time_entry1 = TimeEntry.new(duration: 30, worked_on: "2015-03-09", project_id: 1, developer_id: developer1.id)
    time_entry2 = TimeEntry.new(duration: 15, worked_on: "2015-03-10", project_id: 1, developer_id: developer1.id)
    assert true, developer1.overtime?

    developer2 = developers(:two)
    time_entry3 = TimeEntry.new(duration: 30, worked_on: "2015-03-09", project_id: 1, developer_id: developer2.id)
    time_entry4 = TimeEntry.new(duration: 15, worked_on: "2015-03-30", project_id: 1, developer_id: developer2.id)
    assert_equal false, developer2.overtime?
  end

  test "can't delete a developer with time entries" do
    developer = developers(:one)
    time_entry = TimeEntry.new(duration: 30, worked_on: "2015-03-09", project_id: 1, developer_id: developer.id)
    developer.destroy
    refute developer == nil
  end


end
