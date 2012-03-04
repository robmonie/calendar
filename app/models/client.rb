class Client <  ActiveRecord::Base

  attr_accessible :name, :email, :phone
  validates_presence_of :name, :email, :phone

end