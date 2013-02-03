class ClientSerializer < ActiveModel::Serializer

  embed :ids

  attributes :id, :name, :phone, :email, :gravatar_image_url

  has_many :appointments

  def gravatar_image_url
    "http://www.gravatar.com/avatar/" + Digest::MD5.hexdigest(object.email.to_s.strip.downcase)
  end

end
