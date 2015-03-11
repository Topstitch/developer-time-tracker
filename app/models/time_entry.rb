class TimeEntry < ActiveRecord::Base
  belongs_to :developer
  belongs_to :project
  validates :duration, :worked_on, :developer, :project, presence: true

end
