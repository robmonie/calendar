class AppointmentType < ActiveRecord::Base

  validates_presence_of :name, :description, :duration, :price
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'

end