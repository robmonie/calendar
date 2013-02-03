class Client <  ActiveRecord::Base

  attr_accessible :name, :email, :phone, :business_id
  # validates_presence_of :name, :email, :phone

  belongs_to :business
  has_many :appointments

end