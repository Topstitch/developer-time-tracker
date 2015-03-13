class Project < ActiveRecord::Base
  has_many :time_entries, :dependent => :restrict_with_error
  validates :max_hours, :name, presence: true
  validates :name, uniqueness: true

  def total_hours
    all_hours = []
    time_entries.all.each do |t|
      all_hours << t.duration
    end
    all_hours.reduce(:+)
  end

  def maxed_out_time_budget?
    if self.total_hours == nil || self.total_hours < max_hours
      return false
    else
      return true
    end
  end
end
