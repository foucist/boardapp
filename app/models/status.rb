class Status < ActiveRecord::Base
  attr_accessible :entry

  belongs_to :user
end
