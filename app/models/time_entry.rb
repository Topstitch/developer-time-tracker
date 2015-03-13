class TimeEntry < ActiveRecord::Base
  belongs_to :developer
  belongs_to :project
  validates :duration, :worked_on, :developer, :project, presence: true
  validates :duration, numericality: { greater_than: 0 }
end
