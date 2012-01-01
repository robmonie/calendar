class Business < ActiveRecord::Base

  validates_presence_of :name
  has_many :users

  accepts_nested_attributes_for :users

end