class User < ActiveRecord::Base
  has_many :organizations
  has_many :cities, through: :organizations
end
