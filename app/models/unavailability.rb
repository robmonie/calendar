class Unavailability < ActiveRecord::Base

  attr_accessible :start_time, :end_time, :user
  belongs_to :user

  scope :in_future, lambda { where('end_time > ?', DateTime.now) }

end