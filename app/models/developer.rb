class Developer < ActiveRecord::Base
  has_secure_password
  has_many :time_entries, :dependent => :restrict_with_error {"potato"}
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

  def total_hours
    weekly_hours = 0
    start_day = Time.now.beginning_of_week
    end_day = Time.now.end_of_week
    self.time_entries.each do |t|
      if t.worked_on >= start_day && t.worked_on <= end_day
        weekly_hours += t.duration
      end
    end
    weekly_hours
  end

  def overtime?
    total_hours > 40
  end
end
