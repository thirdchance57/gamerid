class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password
  
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :zipcode, type: Integer
  field :is_admin, type: Mongoid::Boolean

  has_many :gamertags
  has_many :photos

  validates_length_of :zipcode, :minimum => 5, :maximum => 5, :allow_blank => false
  validates_uniqueness_of :email

end
