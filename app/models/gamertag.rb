class Gamertag
  include Mongoid::Document
  field :platform, type: String
  field :game, type: String
  field :server, type: String
  field :name, type: String
  field :username, type: String
end
