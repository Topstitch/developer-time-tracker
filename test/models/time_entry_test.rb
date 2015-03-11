require 'test_helper'

class TimeEntryTest < ActiveSupport::TestCase
  test "check if time entry has developer id" do
    time_entry = TimeEntry.new(duration: 2.5, worked_on: "2015-03-09", project_id: 1)
    assert_not time_entry.save
  end
end
