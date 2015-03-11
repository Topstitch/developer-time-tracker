class Developer < ActiveRecord::Base
  has_secure_password
  has_many :time_entries
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

  def overtime?
    weekly_hours = []
    start_day = Time.now.beginning_of_week
    end_day = Time.now.end_of_week
    self.time_entries.each do |t|
      if t.worked_on > start_day && t.worked_on < end_day
        weekly_hours << t.duration
      end
    end
    weekly_total = weekly_hours.reduce(:+)
    if weekly_total > 40
      return true
    else
      return false
    end
  end
end

# Time.now.beginning_of_week
# Time.now.end_of_week
# check if it's between those two, add it up if it is
#
# # sort the time entries based on what week they are in
# # add up the total time entries for each week
# # check if that total > 40
# # if so, return true, format red

# def overtime?
#   weekly_time = []
#   self.time_entries.each.worked_on do |t|
#     t.all_week
#
#
#   end
# end
