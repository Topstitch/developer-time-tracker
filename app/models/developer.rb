class Developer < ActiveRecord::Base
  has_secure_password
  has_many :time_entries
  
end
