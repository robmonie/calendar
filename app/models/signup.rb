class Signup

  extend ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveModel::Conversion

  validates_presence_of :business_name, :first_name, :last_name, :email, :password, :password_confirmation
  validates :password, :confirmation => true
  validate :unique_email

  attr_accessor :business_name, :first_name, :last_name, :email, :password, :password_confirm
  attr_reader :business, :user

  def initialize(params = {})
    params.each do |name, value|
      send("#{name}=", value)
    end

    #TODO: need to add validation  to signup equal to that on user. Ie, email format, password length etc.
    @business = Business.new(:name => self.business_name)
    @user = User.new( :first_name => self.first_name, :last_name => self.last_name, :email => self.email,
                      :password => self.password, :password_confirm => self.password_confirm, :role => :business_admin)

  end

  def persisted?
    false
  end

  def save

    if valid?
      begin
        Business.transaction do
          @business.save!
          @business.users << @user
          @business.save!
        end
        return true
      rescue Exception => exception
        exception.record.errors.each do |key, messages|
          self.errors.add(key, messages)
        end
      end
    end

    return false
  end

  def unique_email
    if User.where(:email => self.email).count > 0
      errors.add(:email, "has already been taken")
    end
  end

end