class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password
  field :first, type: String
  field :last, type: String
  field :email, type: String
  field :password_digest, type: String
  field :zipcode, type: Integer
end
