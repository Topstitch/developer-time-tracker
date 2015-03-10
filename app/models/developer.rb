class Developer < ActiveRecord::Base
  has_secure_password
  has_many :time_entries

  # def overtime?
  #   weekly_time = []
  #   self.time_entries.each.worked_on do |t|
  #     t.all_week
  #
  #
  #   end
  # end
end

# Time.now.beginning_of_week
# Time.now.end_of_week
# check if it's between those two, add it up if it is
#
# # sort the time entries based on what week they are in
# # add up the total time entries for each week
# # check if that total > 40
# # if so, return true, format red
