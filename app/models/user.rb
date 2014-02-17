require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String
  property :username, String,:required => true, :unique => true,
    :messages =>{
      :presence => "We need your username",
      :is_unique => "Sorry that username already exists!"
    }
  property :email, String, :required => true, :unique => true, :format => :email_address,
    :messages => {
    :presence => "We need your email address",
    :is_unique => "We already have that email.",
    :format => "Doesn't look like an email address to me..."
  }
  property :password_digest, Text

  validates_confirmation_of :password, :message => "Sorry your passwords dont match"

  has n, :posts, :through => Resource

   def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
    
  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    end
  end
end