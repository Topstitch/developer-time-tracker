class Project < ActiveRecord::Base
  has_many :time_entries
  validates :max_hours, :name, presence: true
  validates :name, uniqueness: true
end
