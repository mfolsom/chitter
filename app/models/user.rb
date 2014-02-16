require 'data_mapper'

class User
  include DataMapper::Resource

  has n, :posts, :through => Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
end