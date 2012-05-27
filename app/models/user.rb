class User < ActiveRecord::Base

  ROLES = ['user', 'business_admin', 'app_admin']


  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :role

  belongs_to  :business
  has_many    :appointment_types

  before_validation :set_defaults

  validates :role, :inclusion => { :in => ROLES, :message => "%{value} is not a valid role" }

  def full_name
    "#{first_name} #{last_name}"
  end

  def has_role?(role)
    self.role.to_s == role.to_s
  end

  def setup_complete?
     appointment_types.count > 0
  end

  private

  def set_defaults
    self.role = 'user' unless self.role
  end
end
