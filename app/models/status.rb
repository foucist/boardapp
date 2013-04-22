STATUSES = [
  "Available",
  "Mobile (on call)",
  "Busy",
  "In a call",
  "In a meeting",
  "In a conference call",
  "Do not disturb",
  "Be Right Back",
  "Out to lunch",
  "Away",
  "Off Work",
  "Offline",
  "Unknown"
]

class Status < ActiveRecord::Base
  attr_accessible :entry

  belongs_to :user

  def self.list
   STATUSES
  end
end
