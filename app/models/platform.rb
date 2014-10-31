class Platform
  include Mongoid::Document
  field :ps, type: String
  field :xbox, type: String
  field :pc, type: String
  field :ios, type: String
  field :andro, type: String
end
