class User < ActiveRecord::Base

  ROLES = ['user', 'business_admin', 'app_admin']


  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :role,
                  :google_access_token, :google_refresh_token, :google_issued_at, :google_expires_in

  belongs_to :business

  before_validation :set_defaults

  validates :role, :inclusion => { :in => ROLES, :message => "%{value} is not a valid role" }


  def has_role?(role)
    self.role.to_s == role.to_s
  end

  def connnected_to_google?
    ! google_access_token.blank?
  end

  def setup_complete?
    false
  end

  def google_access_token_expired?
    return true if google_expires_in.blank?
    google_expires_in.seconds.ago > google_issued_at
  end

  private

  def set_defaults
    self.role = 'user' unless self.role
  end
end
