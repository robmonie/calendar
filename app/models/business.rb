class Business < ActiveRecord::Base

  validates_presence_of :name
  has_many :users
  has_many :clients, :order => 'clients.name'

  accepts_nested_attributes_for :users

end